<template>

   <div class="flex flex-col">

      <div class="quiz-main-container overflow-y-auto overflow-x-hidden">

         <QuizQuestion 
            v-if="questions_array.length > question"
            :key="question"
            :questions_array="questions_array" 
            :question="question"
         ></QuizQuestion>

      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import ApiWrapper from '../../../scripts/api_wrapper';
   import { vxm } from '../../../store';

   import QuizQuestion from '../../quiz/quiz_question.vue';
   import QuizAnswer from '../../quiz/quiz_answer.vue';

   @Component({
      name: "QuizEdit",
      components: {
         QuizQuestion,
         QuizAnswer,
      }
   })
   export default class QuizEdit extends Vue {

      // Question Configuration

      get questions_array() {

         return vxm.quiz.getQuizUtil.questions;

      }

      get question() {

         return vxm.quiz.getQuizUtil.question;

      }
    
      nextQuestion(): void {

         vxm.quiz.nextQuestion();

      }

      // Lifecycle Hooks

      created() {

         vxm.quiz.setEditMode(true);

      }

      async beforeMount() {

         vxm.quiz.formatQuizJSON();

      }

   }

</script>