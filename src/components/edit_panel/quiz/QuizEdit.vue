<template>

    <div class="flex flex-col">

      <QuizEditMenu 
         v-if="quiz_menu == 0"
         @edit="setEditForm($event)"
         @addQuestion="setNewQuestion"
      ></QuizEditMenu>

      <div v-else-if="quiz_menu == 1" class="quiz-main-container overflow-y-auto overflow-x-hidden">

         <QuizQuestion v-if="questions_array.length > 0"
                        :key="question"
                        :questions_array="questions_array"
                        :question="question"
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

    import { Component, Prop, Vue } from "nuxt-property-decorator";
    import ApiWrapper from '../../../scripts/api_wrapper';
    import { vxm } from '../../../store';
    import IQuizQuestion from "~/interfaces/quiz_question";

    import QuizEditMenu from './QuizEditMenu.vue';
    import QuizQuestion from '../../quiz/QuizQuestion.vue';
    import QuizAnswer from '../../quiz/QuizAnswer.vue';
    import VerificationDialog from '../VerificationDialog.vue';

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

        get answers() {

           return vxm.quiz.getQuizUtil.questions[this.question].answers;

        }

        get correct_answer_id() {

            return this.questions_array[this.question].correct_answer_id;

        }

         removeQuestion(): void {

            vxm.quiz.removeQuestion(this.question);

         }

         // Validation of Changes

         checkSavedQuestion(): boolean {

            // get the value of the temp_question from QuizQuestion.vue
            let temp_question: string = this.$children[0].temp_question;

            let question = {
               question: temp_question,
               answers: this.answers,
               correct_answer_id: this.correct_answer_id,
            }

            // if the question is absolutely empty, it cannot be left unsaved
            if(!question.question && !question.answers.length && !question.correct_answer_id) {

               return false;

            }

            vxm.quiz.checkSavedQuestion(question as IQuizQuestion);

            if(vxm.quiz.savedQuestion) {

               return true;

            } else {

               return false;

            }

         }


        // Lifecycle Hooks

        async beforeCreate() {

            await vxm.quiz.prepareQuiz(this.$route.name);

        }

        beforeDestroy() {

           vxm.quiz.resetQuiz();

        }

         // Route Configuration

         route_cancel = true;

         verify = {
            on: false,
            content: '',
         }

         to = null;

         handleCancel(): void {

            this.route_cancel = true;
            this.verify.on = false;

         }

         handleContinue(): void {

            this.route_cancel = false;
            this.$router.push(this.to);

            let question: string = this.$children[0].temp_question;

            // Check if the question is both empty and wasn't within the initial version of questions_array

            if((!question && !this.answers.length && !this.correct_answer_id) 
               && (this.init_questions.indexOf(this.questions_array[this.question]) == -1)) {

               this.removeQuestion();

            }            
         }

         beforeRouteLeave(to, from, next) {
               
            // set the route which the user attempted to redirect to   
            this.to = to;

            if(this.route_cancel) {
               
               next(false); 

               // show the prompt dialog if the question wasn't saved
               if(!this.checkSavedQuestion()) {

                  this.verify.content = 'Are you sure you want to leave the question unsaved?';
                  this.verify.on = true;

               } else {

                  next();

               }
            
            } else {

               next();

            }

         }

    }

</script>