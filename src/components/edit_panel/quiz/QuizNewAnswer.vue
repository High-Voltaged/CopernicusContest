<template>

   <div  
      class="button-container flex items-center w-64 space-x-2 flex-0 relative rounded-lg focus:outline-none bg-gray-200 p-2 m-2"
   >

      <div class="flex-0 w-6 min-w-6 h-6 min-h-6 flex justify-center items-center rounded-full bg-purple-400">

         <span class="text-white text-sm leading-loose select-none"> 
            {{ answer.letter_label }} 
         </span>

      </div>

      <div class="flex-auto">

         <input v-model="answer.answer" class="w-full bg-gray-400 bg-opacity-50 px-2 py-1 rounded-lg focus:outline-none text-sm text-gray-secondary tracking-wider pr-2" />

      </div>

      <button  
         @click="addAnswer()"
         :class="{ 'hover:bg-opacity-100': validateAnswerLength() }" 
         class="flex-0 inline-flex justify-center items-center px-2 py-1 rounded-full bg-purple-400 bg-opacity-50 transition duration-200 ease focus:outline-none"
      >
         
         <span class="text-sm text-white text-medium">
            Add
         </span>

      </button>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import { Limits } from '../../../../app/limits';
   import { vxm } from '../../../store';

   @Component({
      name: "QuizNewAnswer",
   })
   export default class QuizNewAnswer extends Vue {

      answer = {
         
         answer: '',
         letter_label: 'Z',

      };


      // Answer Configuration


      addAnswer(): void {

         if(!this.validateAnswerLength()) {

            vxm.quiz.setValidationError({ value: true, content: 'The length of the answer is either too short or too long.' });

         } else {

            vxm.quiz.setValidationError({ value: false, content: '' });

            vxm.quiz.addAnswer(this.answer);
   
            this.answer.answer = '';

         }

      }


      // Validation


      validateAnswerLength(): boolean {

         if((this.answer.answer.length < Limits.min_answer_length) 
            || (this.answer.answer.length > Limits.max_answer_length)) {

            return false;

         } else {

            return true;

         }

      }

   }

</script>