<template>

    <div class="flex flex-col">

      <QuizEditMenu 
         v-if="quiz_menu == 0"
         :default_menu="default_menu"
         @edit="setEditForm($event)"
         @addQuestion="setNewQuestion"
      ></QuizEditMenu>

      <div v-else-if="quiz_menu == 1" class="flex justify-center items-center w-full h-full overflow-y-auto overflow-x-hidden">

         <QuizQuestion v-if="questions_array.length > 0"
                        :key="question"
                        :questions_array="questions_array"
                        :question="question"
                        @toMenu="toMenu"
                        @setMenu="setQuizMenu($event)"></QuizQuestion>

      </div>

      <transition name="scale-out">

         <VerificationDialog 
            v-if="verify.on"
            :content="verify.content"
            @cancel="handleCancel"
            @continue="handleContinue"
         />

      </transition>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Watch, Vue } from "nuxt-property-decorator";
    import ApiWrapper from '../../../scripts/api_wrapper';
    import { vxm } from '../../../store';
    import IQuizQuestion from "~/interfaces/quiz_question";

    import QuizEditMenu from './QuizEditMenu.vue';
    import QuizQuestion from '../../quiz/QuizQuestion.vue';
    import QuizAnswer from '../../quiz/QuizAnswer.vue';
    import VerificationDialog from '../VerificationDialog.vue';
    import { LangUtil } from "../../../scripts/lang/utils";

    @Component({
        name: "QuizEdit",
        components: {
            QuizEditMenu,
            QuizQuestion,
            QuizAnswer,
            VerificationDialog,
        }
    })
    export default class QuizEdit extends Vue {

      // Menu Configuration

      quiz_menu = 0;

      @Watch('quiz_menu') 
      setEditMode(): void {

         if(this.quiz_menu == 0) {

            vxm.quiz.setEditMode(false);

         }

      }

      setQuizMenu(index: number) {

         this.quiz_menu = index;

      }

      setEditForm(index: number): void {

         this.quiz_menu = 1;
         vxm.quiz.setQuestionIndex(index);

      }

      setNewQuestion(): void {

         this.quiz_menu = 1;

         vxm.quiz.addQuestion();

      }

      // Question Configuration

      get questions_array() {

         return vxm.quiz.getQuizUtil.questions;

      }

      get init_questions() {

         return vxm.quiz.getQuizUtil.init_questions;

      }

      get question() {

         return vxm.quiz.getQuizUtil.question;

      }

      get question_text() {

         return vxm.quiz.getQuizUtil.questions[this.question].question;

      }

      get answers() {

         return vxm.quiz.getQuizUtil.questions[this.question].answers;

      }

      get correct_answer_id() {

         return this.questions_array[this.question].correct_answer_id;

      }

      get current_lang() {

         return vxm.lang.getCurrentLangStrings;

      }

      removeQuestion(): void {

         vxm.quiz.removeQuestion(this.question);

      }

      // Validation of Changes

      checkSavedQuestion(): boolean {

         // if the question is absolutely empty, it cannot be left unsaved
         if(!this.question_text && !this.answers.length && !this.correct_answer_id) {

            return false;

         }

         vxm.quiz.checkSavedQuestion();

         if(vxm.quiz.savedQuestion) {

            return true;

         } else {

            return false;

         }

      }

      default_menu = null;
      
      prepareMenu() {

         if(this.questions_array.length == 0) {

            this.default_menu = true;

         } else {

            this.default_menu = false;

         }

         this.$nuxt.$loading.finish();

      }


      // Lifecycle Hooks


      async beforeMount() {

         await vxm.quiz.prepareQuiz(this.$route.name);

         this.prepareMenu();

      }

      beforeDestroy() {

         vxm.quiz.resetQuiz();

      }

      destroyed() {

         this.$nuxt.$loading.start();

      }

      // Route Configuration

      verify = {
         on: false,
         content: '',
      };

      handleCancel(): void {

         this.verify.on = false;
         this.verify.content = '';

      }

      async handleContinue() {

         this.quiz_menu = 0;

         this.verify.on = false;
         this.verify.content = '';

         // Check if the question is both empty and wasn't within the initial version of questions_array

         if((!this.question_text && !this.answers.length && !this.correct_answer_id) 
            && (this.init_questions[this.question].id == this.questions_array[this.question].id)) {

            this.removeQuestion();

         }    

         vxm.quiz.resetQuiz();
         await vxm.quiz.prepareQuiz(this.$route.name);

      }

      async toMenu() {
      
         // show the prompt dialog if the question wasn't saved
         if(!this.checkSavedQuestion()) {

            this.verify.content = this.current_lang.unsaved_question_confirm;
            this.verify.on = true;

         } else {

            this.quiz_menu = 0;

            this.$nuxt.$loading.start();

            vxm.quiz.resetQuiz();
            await vxm.quiz.prepareQuiz(this.$route.name);

            this.prepareMenu();

         }

      }
    
    }

</script>