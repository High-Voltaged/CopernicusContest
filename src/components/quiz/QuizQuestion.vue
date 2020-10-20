<template>

    <div class="flex quiz-container flex-shrink-0 flex justify-center h-full w-full max-h-screen overflow-y-auto overflow-x-hidden py-8 transition duration-500 ease transform">

        <div class="quiz-card flex flex-col items-center relative m-auto w-19/20 sm:w-9/10 md:w-4/5 lg:w-2/3 xl:w-1/2 rounded-lg space-y-3 px-8 py-4 shadow-md">

            <div class="header w-full flex flex-col items-center space-y-1 md:px-0 lg:px-2">

                <div class="flex items-center justify-start space-x-2 w-full">

                    <router-link v-if="editMode" to="/admin" tag="button" class="flex items-center justify-center space-x-1 px-3 py-2 rounded-lg bg-transparent border-2 border-gray-primary border-opacity-75 hover:border-opacity-100 transition duration-300 ease focus:outline-none">

                        <span class="text-sm text-gray-200 font-semibold tracking-wider text-left select-none">
                            Admin
                        </span>

                    </router-link>

                    <router-link v-else to="/" tag="button" class="flex items-center justify-center space-x-1 px-3 py-2 rounded-lg bg-transparent border-2 border-gray-primary border-opacity-75 hover:border-opacity-100 transition duration-300 ease focus:outline-none">

                        <span class="text-sm text-gray-200 font-semibold tracking-wider text-left select-none">
                            Main
                        </span>

                    </router-link>

                </div>

                <div class="flex items-center justify-center w-full">

                    <span class="text-base md:text-sm text-center font-normal text-gray-300 select-none">
                        Question #{{ question + 1 }} out of {{ questions_array.length }}
                    </span>

                </div>

            </div>

            <div class="content md:px-0 lg:px-2 w-full 2xl:flex 2xl:flex-col 2xl:items-center">

                <div v-if="questions_array[question]" class="flex flex-col items-center justify-center w-full">

                    <span v-if="!editMode" class="text-xl md:text-2xl text-center font-normal text-gray-200 md:px-2 lg:px-12 xl:px-8">
                        {{ questions_array[question].question }}
                    </span>

                    <input v-else
                           v-model="temp_question"
                           class="w-full sm:w-2/3 md:w-1/2 lg:w-64 bg-gray-tertiary bg-opacity-50 text-sm text-gray-200 py-2 px-3 overflow-hidden focus:bg-opacity-75 transition duration-200 ease focus:outline-none"
                           style="border-radius: 15px" />

                    <div class="divider relative h-px my-5 min-w-full">

                        <div class="div-quiz-transparent absolute top-0 left-1/20 right-1/20 h-px">
                        </div>

                    </div>

                </div>

                <QuizAnswersContainer @selectedAnswer="selectedAnswer"
                                      :answers="questions_array[question].answers"></QuizAnswersContainer>

            </div>

            <transition name="fade-out">

                <div v-if="error.value" class="flex items-center justify-center w-full px-2 mb-2">

                    <span class="text-center text-sm font-medium text-red-primary select-none">
                        {{ error.content }}
                    </span>

                </div>

            </transition>

            <div class="divider-full w-full min-w-full h-px my-4 bg-white"></div>

            <div :class="editMode ? 'justify-evenly' : 'justify-end' "
                 class="footer w-full flex items-center md:px-0 lg:px-2">

                <button v-if="editMode"
                        :disabled="prev_disabled"
                        @click="prevQuestion()"
                        :class="{ 'hover:border-opacity-100': !prev_disabled }"
                        class="flex items-center justify-center space-x-1 px-3 py-2 rounded-lg bg-transparent border-2 border-gray-primary border-opacity-75 transition duration-300 ease focus:outline-none">

                    <span class="text-sm text-gray-200 font-semibold tracking-wider text-left select-none">
                        Back
                    </span>

                </button>

                <button v-if="editMode"
                        @click="saveTheQuiz()"
                        class="flex items-center justify-center space-x-1 px-3 py-2 rounded-lg shadow bg-gray-primary bg-opacity-75 hover:bg-opacity-100 transition duration-300 ease focus:outline-none">

                    <span class="text-sm text-gray-200 font-medium text-left select-none">
                        Save the Quiz
                    </span>

                </button>

                <button :disabled="next_disabled"
                        @click="nextQuestion()"
                        :class="{ 'hover:border-opacity-100': !next_disabled }"
                        class="flex items-center justify-center space-x-1 px-3 py-2 rounded-lg bg-transparent border-2 border-gray-primary border-opacity-75 transition duration-300 ease focus:outline-none">

                    <span class="text-sm text-gray-200 font-semibold tracking-wider text-left select-none">
                        Next
                    </span>

                </button>

            </div>

        </div>

        <transition name="fade-out">

            <Notification v-if="notif_on"
                          :content="notif_content"
                          @click="closeNotification" />

        </transition>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import { Limits } from '../../../app/limits';
    import { vxm } from '../../store';

    import QuizAnswer from './QuizAnswer.vue';
    import QuizAnswersContainer from './QuizAnswersContainer.vue';
    import Notification from '../edit_panel/Notification.vue';
    import APIWrapper from '../../scripts/api_wrapper';


    @Component({
        name: "QuizQuestion",
        components: {
            QuizAnswer,
            QuizAnswersContainer,
            Notification,
        }
    })
    export default class QuizQuestion extends Vue {

        // Question / Answer Configuration

        get questions_array() {

            return vxm.quiz.getQuizUtil.questions;

        }

        get question() {

            return vxm.quiz.getQuizUtil.question;

        }

        get prev_disabled() {

            if (this.question == 0) {

                return true;

            } else {

                return false;

            }

        }

        get next_disabled() {

            if (this.question == (this.questions_array.length - 1) && this.editMode) {

                return true;

            } else {

                return false;

            }

        }

        prevQuestion(): void {

            vxm.quiz.prevQuestion();

        }

        nextQuestion(): void {

            vxm.quiz.nextQuestion();

        }

        selectedAnswer(id): void {

            this.$emit("selectedAnswer", [id, this.questions_array[this.question].id]);

        }

        // Lifecycle Hooks


        created() {

            if (this.$parent._name == '<QuizEdit>') {

                vxm.quiz.setEditMode(true);

            }

        }

        mounted() {

            this.questions_array[this.question];

        }


        // Edit Mode / Validation

        temp_question = this.questions_array[this.question].question;

        get editMode() {

            return vxm.quiz.getQuizUtil.editMode;

        }

        get error() {

            return vxm.quiz.getValidationError;

        }

        validateQuestionLength(): boolean {

            if ((this.temp_question.length < Limits.min_question_length)
                || (this.temp_question.length > Limits.max_question_length)) {

                return false;

            } else {

                return true;

            }

        }

        saveTheQuiz(): void {

            if (!this.validateQuestionLength()) {

                vxm.quiz.setValidationError({ value: true, content: 'The length of the question is either too short or too long.' });

            } else {

                vxm.quiz.setValidationError({ value: false, content: '' });

                this.notif_content = 'Your changes to the quiz will be saved.';
                this.notif_on = true;

                APIWrapper.updateQuizQuestion(this.questions_array[this.question]);

                // post request here

            }

        }

        // Notification Config

        notif_on: boolean = false;
        notif_content: string = '';

        closeNotification(): void {

            this.notif_on = false;
            this.notif_content = '';

        }

        beforeDestroy() {

            this.notif_on = false;
            this.notif_content = '';

            vxm.quiz.setValidationError({ value: false, content: '' });

        }

    }

</script> 