<template>

   <div class="flex flex-shrink-0 justify-center w-full h-full max-h-screen overflow-y-auto overflow-x-hidden py-8 transition duration-500 ease transform">

      <div class="quiz-card flex flex-col items-center m-auto w-19/20 sm:w-9/10 md:w-4/5 lg:w-2/3 xl:w-1/2 px-8 py-4 shadow-md" style="border-radius: 15px">

         <div class="header w-full flex items-center justify-start space-x-2 md:px-0 lg:px-2">

            <router-link to="/" tag="button" class="flex items-center justify-center space-x-1 px-3 py-2 rounded-lg bg-transparent border-2 border-gray-primary border-opacity-75 hover:border-opacity-100 transition duration-300 ease focus:outline-none">

                <span class="text-sm text-gray-200 font-semibold text-left">
                    {{ current_lang.main }}
                </span>

            </router-link>

         </div>

         <div class="content w-full mt-4">

            <div class="flex items-center justify-center w-full">
               
               <div class="text-xl md:text-2xl font-semibold text-gray-200 select-none">
                  {{ current_lang.your_result_is }}
               </div>

               <div class="ml-3 text-xl md:text-2xl tracking-wider font-bold text-gray-200 select-none">
                  {{ correct_answers }} / {{ questions_array.length }}
               </div>

               <div class="ml-3 cursor-pointer">

                  <div v-if="questions_array.length / correct_answers <= 2">

                     <font-awesome-icon :icon="['fas', 'check']" class="w-6 h-6 fill-current text-green-400" />

                  </div>

                  <div v-else>

                     <font-awesome-icon :icon="['fas', 'times']" class="w-6 h-6 fill-current text-red-primary" />

                  </div>

               </div>

            </div>

            <div class="divider relative h-px my-5 min-w-full">
            
               <div class="div-quiz-transparent absolute top-0 left-1/20 right-1/20 h-px">
               </div>
            
            </div>

            <div class="flex flex-col items-start w-full">

               <div class="w-full text-lg md:text-xl 2xl:text-center font-semibold text-gray-secondary">
                  {{ current_lang.correct_answers }}
               </div>

               <div v-if="questions_array.length > 0" class="w-full mt-4">

                  <QuizResultQuestions :questions_array="questions_array"> </QuizResultQuestions>

               </div>

            </div>

         </div>

      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import { vxm } from '../../../store';
   
   import QuizResultQuestions from './QuizResultQuestions.vue';

   @Component({
      name: "QuizResult",
      components: {
         QuizResultQuestions
      }
   })
   export default class QuizResult extends Vue {

      @Prop() private questions_array;
      @Prop() private correct_answers;

       get current_lang() {

           return vxm.lang.getCurrentLangStrings;

       }

   }

</script>