<template>

   <div class="flex flex-shrink-0 items-center justify-center w-full h-screen max-h-screen overflow-y-auto overflow-x-hidden py-8 transition duration-500 ease transform">

      <div class="quiz-card flex flex-col items-center justify-center m-auto w-19/20 sm:w-9/10 md:w-4/5 lg:w-2/3 xl:w-1/2 rounded-lg px-8 py-4 shadow-md">

         <div class="header w-full flex items-center justify-start space-x-2 py-3 md:px-0 lg:px-2">

            <div class="flex items-center justify-center w-full">

               <span class="text-xl font-semibold text-white text-center select-none">
                  All the Quiz Questions
               </span>

            </div>

         </div>

         <div class="content w-full space-y-3">

            <div 
               v-for="(question, i) in questions_array"
               :key="i"
               class="flex flex-col items-center relative w-full space-y-3 mt-4"
            >

               <div class="flex items-center justify-center w-full">
               
                  <span class="text-base md:text-sm text-center font-normal text-gray-300 select-none">
                     Question #{{ i + 1 }} out of {{ questions_array.length }}
                  </span>

               </div>   

               <div class="md:text-lg font-normal text-gray-200"> 
                  {{ question.question }} 
               </div>

               <QuizAnswersContainer :answers="questions_array[i].answers"></QuizAnswersContainer>

               <button @click="$emit('edit', i)" class="absolute right-2 top-2 flex items-center justify-center space-x-1 px-3 py-2 rounded-lg bg-gray-primary bg-opacity-50 hover:bg-opacity-100 transition duration-300 ease focus:outline-none">
                  
                  <span class="text-sm text-gray-200 font-semibold tracking-wider text-left">
                     Edit
                  </span>

               </button>

               <div class="divider relative h-px my-5 min-w-full">
            
                  <div class="div-quiz-transparent absolute top-0 left-1/20 right-1/20 h-px">
                  </div>
               
               </div>

            </div>

         </div>

      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import { vxm } from '../../../store';

   import QuizAnswersContainer from '../../quiz/QuizAnswersContainer.vue';

   @Component({
      name: "QuizEditMenu",
      components: {
         QuizAnswersContainer,
      }
   })
   export default class QuizEditMenu extends Vue {

      get questions_array() {

         return vxm.quiz.getQuizUtil.questions;

      }

   }

</script>