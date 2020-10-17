<template>

   <div class="flex flex-col">

      <QuizEditMenu 
         v-if="quiz_menu == 0"
         @edit="setEditForm($event)"
      ></QuizEditMenu>      

      <div v-else-if="quiz_menu == 1" class="quiz-main-container overflow-y-auto overflow-x-hidden">

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

   import QuizEditMenu from './QuizEditMenu.vue';
   import QuizQuestion from '../../quiz/QuizQuestion.vue';
   import QuizAnswer from '../../quiz/QuizAnswer.vue';

   @Component({
      name: "QuizEdit",
      components: {
         QuizEditMenu,
         QuizQuestion,
         QuizAnswer,
      }
   })
   export default class QuizEdit extends Vue {

      // Menu Configuration


      quiz_menu = 0;

      setEditForm(index: number): void {

         this.quiz_menu = 1;
         vxm.quiz.setQuestionIndex(index);

      }


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

      async beforeMount() {

         vxm.quiz.formatQuizJSON();

      }

   }

</script>