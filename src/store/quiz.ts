import { createModule, mutation, action } from 'vuex-class-component';

import ApiWrapper from '../scripts/api_wrapper';
import IQuizQuestion from '../../interfaces/quiz_question';
import IQuizAnswer from '../../interfaces/quiz_answer';

const VuexModule = createModule({
    namespaced: 'quiz',
    strict: false,
    target: 'nuxt',
})

export default class Articles extends VuexModule {

    questions_array: IQuizQuestion[] = [];
    correct_answers: number = 0;
    question: number = 0;
    temp_id: number = -1;

    get getQuizUtil() {

        return {
            questions: this.questions_array,
            correct_answers: this.correct_answers,
            question: this.question,
            editMode: this.editMode,
        }

    }

    @action async assignLetterLabels(): Promise<void> {

        for (let i = 0; i < this.questions_array.length; ++i) {

            let letter = "A";

            for (let x = 0; x < this.questions_array[i].answers.length; ++x) {

                this.questions_array[i].answers[x].letter_label = letter;

                let code: number = letter.charCodeAt(0);

                ++code;

                letter = String.fromCharCode(code);

            }

        }

    }

    @action async formatQuizJSON(route_name: string): Promise<void> {

        let quiz;

        if (route_name == "quiz_admin_view") {

            quiz = await ApiWrapper.fetchQuizEdit();

        } else {

            quiz = await ApiWrapper.fetchQuiz();

        }

        for (let raw_question of quiz) {

            let found = false;

            for (let j = 0; j < this.questions_array.length; ++j) {

                if (this.questions_array[j].id == raw_question.question_id) {

                    this.questions_array[j].answers.push({
                        id: raw_question.answer_id,
                        answer: raw_question.answer,
                        letter_label: "0",
                    });

                    found = true;

                    break;
                    
                }

            }

            if (!found) {

                this.questions_array.push({
                    id: raw_question.question_id,
                    question: raw_question.question,
                    answers: [{
                        id: raw_question.answer_id,
                        answer: raw_question.answer,
                        letter_label: "0",
                    }],
                    correct_answer_id: raw_question.correct_answer_id,
                    selected_answer: -1,
                });

            }

        }

    }

    @action async prepareQuiz(route_name: string): Promise<void> {

        await this.formatQuizJSON(route_name);

        await this.assignLetterLabels();

    }

    @mutation selectedAnswer(args) {
        
        for (let i = 0; i < this.questions_array.length; ++i) {

            if (this.questions_array[i].id == args[1]) {

                this.questions_array[i].selected_answer = args[0];

                if (this.questions_array[i].selected_answer == this.questions_array[i].correct_answer_id) {

                    ++this.correct_answers;

                }

                break;

            }

        }

    }

    @mutation nextQuestion() {

        ++this.question;

    }

    @mutation prevQuestion() {

        --this.question;

    }

    // Edit Mode

    editMode = false;

    @mutation setEditMode(value: boolean) {

        this.editMode = value;

    }

    @mutation setQuestionIndex(index: number) {

        this.question = index;

    }

    @mutation addQuestion() {

      let temp = {
         id: this.questions_array.length,
         question: '',
         answers: [],
         correct_answer_id: null,
         selected_answer: -1,
      };

      this.questions_array.push(temp);

      this.question = temp.id;

    }

    @mutation removeQuestion(index: number) {

      this.questions_array.splice(index, 1);

      this.question = this.questions_array.length - 1;

    }

    @mutation setQuestion(question: string) {

      this.questions_array[this.question].question = question;

    }

    @mutation addAnswer(answer) {

        // Get the temporary ID
        this.questions_array[this.question].answers.push({
            id: this.temp_id,
            answer: answer.answer,
            letter_label: answer.letter_label,
        });

        --this.temp_id;

    }

    @mutation removeAnswer(id: number) {

        let tempAnswer = this.questions_array[this.question].answers.find(answer => {

            return (answer.id == id); 

        });

        let index = this.questions_array[this.question].answers.indexOf(tempAnswer);

        this.questions_array[this.question].answers.splice(index, 1);

    }

    @mutation setCorrectAnswer(index: number) {

      this.questions_array[this.question].correct_answer_id = index;

    }

    // Validation

    validationEror = {
        value: false,
        content: '',
    };

    get getValidationError() {

        return this.validationEror;

    }

    @mutation setValidationError(payload: { value: boolean, content: string }) {

        this.validationEror.value = payload.value;
        this.validationEror.content = payload.content;

    }

}