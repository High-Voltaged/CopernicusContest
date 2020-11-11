<template>

   <div class="flex items-center justify-center w-full h-full overflow-y-auto overflow-x-hidden py-8 transition duration-500 ease transform">

      <div class="quiz-card flex flex-col items-center justify-center m-auto w-19/20 sm:w-9/10 md:w-4/5 lg:w-2/3 xl:w-1/2 px-8 py-4 space-y-2 shadow-md" style="border-radius: 15px">

         <div class="header w-full flex flex-col items-center justify-center space-x-2 py-3 md:px-0 lg:px-2">

            <div class="flex items-center justify-center w-full">

                <span class="text-xl font-semibold text-white text-center select-none">
                    {{ current_lang.all_quiz_questions }}
                </span>

            </div>

            <button @click="setNewQuestion" class="xl:absolute xl:right-8 xl:top-8 flex items-center justify-center mt-3 xl:mt-0 px-2 py-1 xl:px-4 xl:py-2 bg-gray-secondary rounded-lg shadow bg-opacity-50 hover:bg-opacity-75 transition duration-300 ease focus:outline-none">

               <span class="inline-block p-1">
                  <font-awesome-icon :icon="['fas', 'plus']" class="w-4 h-4 fill-current text-white" />
               </span>

               <span class="text-left text-base xl:text-lg font-semibold text-white select-none">
                   {{ current_lang.add_question }}
               </span>

            </button>

         </div>

         <div v-if="questions_array.length > 0" class="content w-full space-y-10 md:space-y-5">

            <div 
               v-for="(question, i) in questions_array"
               :key="i"
               class="flex flex-col items-center relative w-full space-y-3 mt-4"
            >

               <div class="flex items-center justify-center w-full">

                   <span class="text-base md:text-sm text-center font-normal text-gray-300 select-none">
                       
                       {{ current_lang.question }} {{ i + 1 }} {{ current_lang.out_of }} {{ questions_array.length }}

                   </span>

               </div>  

               <div class="md:text-lg font-normal text-center text-gray-200"> 
                  {{ question.question }} 
               </div>

               <QuizAnswersContainer :question_id="i" :answers="questions_array[i].answers"></QuizAnswersContainer>

               <div class="flex items-center justify-center md:justify-end w-full">

                  <button @click="$emit('edit', i)" class="flex items-center justify-center space-x-1 px-6 md:px-3 py-2 rounded-lg bg-gray-primary bg-opacity-75 hover:bg-opacity-100 transition duration-300 ease focus:outline-none">
                     
                      <span class="text-sm text-gray-200 font-medium text-left">
                          {{ current_lang.edit_question }}
                     </span>
                  
                  </button>
               
               </div>
               
               <div class="divider relative h-px my-5 min-w-full">
               
                  <div class="div-quiz-transparent absolute top-0 left-1/20 right-1/20 h-px">
               
                  </div>
               
               </div>
            
            </div>

         </div>

         <div v-else class="inline-block w-full">

             <span class="inline-block w-full text-center font-medium text-gray-300 select-none">

                 {{ current_lang.no_questions }}

             </span>

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
      
      setNewQuestion(): void {
      
         this.$emit('addQuestion');
      
      }
      
      get current_lang() {
      
         return vxm.lang.getCurrentLangStrings;
      
      }
         
   }

</script>
