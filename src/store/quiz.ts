import { createModule, mutation, action } from 'vuex-class-component';

import ApiWrapper from '../scripts/api_wrapper';
import IQuizQuestion from '../../interfaces/quiz_question';
import { store } from '.';

const VuexModule = createModule({
    namespaced: 'quiz',
    strict: false,
    target: 'nuxt',
})

export default class Articles extends VuexModule {

   init_questions_array: IQuizQuestion[] = [];

    questions_array: IQuizQuestion[] = [];
    correct_answers: number = 0;
    question: number = 0;
    temp_id: number = -1;

    get getQuizUtil() {

        return {
            init_questions: this.init_questions_array,
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

    @mutation resetQuiz() {

      this.questions_array = [];
      this.question = 0;
      this.correct_answers = 0;
      this.temp_id = -1;

      this.editMode = false;
      this.saved_question = null;

    }

    // Edit Mode

    editMode = false;

    @mutation setInitConfig(temp_array: IQuizQuestion[]) {

      this.init_questions_array = temp_array;

    }

    @mutation setEditMode(value: boolean) {

        this.editMode = value;

    }

    @mutation setQuestionIndex(index: number) {

        this.question = index;

    }

    @mutation setTempQuestion(question_text: string) {

      this.questions_array[this.question].question = question_text;

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

    saved_question: boolean = null;

    get savedQuestion() {

      return this.saved_question;

    }

    get getValidationError() {

        return this.validationEror;

    }

    @mutation setValidationError(payload: { value: boolean, content: string }) {

        this.validationEror.value = payload.value;
        this.validationEror.content = payload.content;

    }

    @mutation checkSavedQuestion() {

      let curr_question = {
         question: this.questions_array[this.question].question,
         answers: this.questions_array[this.question].answers,
         correct_answer_id: this.questions_array[this.question].correct_answer_id,
      }

      let stored_question = {
         question: this.init_questions_array[this.question].question,
         answers: this.init_questions_array[this.question].answers,
         correct_answer_id: this.init_questions_array[this.question].correct_answer_id,
      };

      for(let i in curr_question) {

         if(curr_question[i] != stored_question[i]) {

            if(i == 'answers') {

               if(curr_question[i].length != stored_question[i].length) {

                  console.log('length not equal');

                  this.saved_question = false;
                  return;

               }

               for(let j in curr_question[i]) {

                  for(let k in curr_question[i][j]) {

                     if(stored_question[i][j]) {

                        console.log('stored_question exists');

                        if(curr_question[i][j][k] != stored_question[i][j][k]) {
   
                           console.log('the two answers do not match')

                           this.saved_question = false;
                           return;
   
                        }                     

                     } else {

                        console.log('the answer doesn\'t exist in the init array');

                        this.saved_question = false;
                        return;

                     }

                  }

               }

            } else {

               this.saved_question = false;
               return;

            }

         }

      }  

      this.saved_question = true;

    }

}