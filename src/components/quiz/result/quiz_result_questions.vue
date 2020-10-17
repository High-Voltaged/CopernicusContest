<template>

   <div v-if="questions_array.length > 0">

      <div 
         v-for="(question, i) in questions_array"
         :key="i"
      >

         <QuizResultQuestion :question="question"> </QuizResultQuestion>

         <div class="flex items-center justify-center h-px w-full my-4">
            <div class="divider-result h-full w-full"></div>
         </div>

      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import QuizResultQuestion from './quiz_result_question.vue';

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