<template>

   <div class="flex flex-col items-center space-y-5">

      <div 
         v-for="(question, i) in questions_array"
         :key="i"
      >

         <QuizResultQuestion :question="question"> </QuizResultQuestion>

         <div class="divider relative h-px my-5 min-w-full">
            
            <div class="div-quiz-transparent absolute top-0 left-1/20 right-1/20 h-px"></div>
         
         </div>

      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import QuizResultQuestion from './QuizResultQuestion.vue';

   @Component({
      name: "QuizResultQuestions",
      components: {
         QuizResultQuestion,
      }
   })
   export default class QuizResultQuestions extends Vue {

      @Prop() private questions_array;

   }

</script>