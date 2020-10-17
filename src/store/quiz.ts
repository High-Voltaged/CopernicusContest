import { createModule, mutation, action } from 'vuex-class-component';

import ApiWrapper from '../scripts/api_wrapper';

const VuexModule = createModule({
    namespaced: 'quiz',
    strict: false,
    target: 'nuxt',
})

export default class Articles extends VuexModule {

   questions_array = [];
   correct_answers: number = 0;
   question: number = 0;

   get getQuizUtil() {

      return {
         questions: this.questions_array,
         correct_answers: this.correct_answers,
         question: this.question,
         editMode: this.editMode,
      }

   }

   @action async formatQuizJSON(): Promise<void> {

      let quiz = await ApiWrapper.fetchQuiz();

      for (let i = 0; i < quiz.length; ++i) {

         let found = false;

         for (let x = 0; x < this.questions_array.length; ++x) {

            if (this.questions_array[x].id == quiz[i].id) {

               this.questions_array[x].answers.push({
                  id: quiz[i].answer_id,
                  answer: quiz[i].answer,
               });

               found = true;

               break;

            }

         }

         if (!found) {

            this.questions_array.push({
               id: quiz[i].id,
               question: quiz[i].question,
               answers: [{
                     id: quiz[i].answer_id,
                     answer: quiz[i].answer,
               }],
               correct_answer_id: quiz[i].correct_answer_id,
               selected_answer: -1,
            });

         }

      }

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

   @mutation addAnswer(answer) {

      this.questions_array[this.question].answers.push({
         answer: answer.answer,
         letter_label: answer.letter_label,
      });

   }
   
   @mutation removeAnswer(content) {

      let tempAnswer = this.questions_array[this.question].answers.find(answer => {

         return (answer.answer == content); // change this to 'id' 

      });

      let index = this.questions_array[this.question].answers.indexOf(tempAnswer);

      this.questions_array[this.question].answers.splice(index, 1);

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