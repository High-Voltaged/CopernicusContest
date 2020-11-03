<template>

    <div class="option-container flex flex-col items-center w-full 2xl:w-120 space-y-3">

        <div class="flex flex-col md:flex-row flex-wrap items-center md:justify-evenly w-full">

            <QuizAnswer v-for="(answer, i) in answers"
                        :key="i"
                        :answer="answer"
                        @selectedAnswer="selectedAnswer"></QuizAnswer>

        </div>

        <div v-if="editMode" class="flex flex-col items-center w-full">

            <button :disabled="disabled"
                    @click="setNewAnswer(true)"
                    :class="{ 'hover:bg-opacity-100': !disabled }"
                    class="flex items-center justify-center space-x-1 px-3 py-1 rounded-full shadow bg-gray-primary bg-opacity-75 transition duration-300 ease focus:outline-none">

                <font-awesome-icon :icon="['fas', 'plus']" class="w-3 h-3 fill-current text-gray-200" />

                <span class="text-sm text-gray-200 font-medium text-left select-none">
                    {{ current_lang.add_an_answer }}
                </span>

            </button>

            <transition name="fade-out">

                <QuizNewAnswer v-if="new_answer"></QuizNewAnswer>

            </transition>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import QuizAnswer from './QuizAnswer.vue';
    import QuizNewAnswer from '../edit_panel/quiz/QuizNewAnswer.vue';
    
   import { Limits } from '../../../app/limits'; 
    import { vxm } from '../../store';

    @Component({
        name: "QuizAnswersContainer",
        components: {
            QuizAnswer,
            QuizNewAnswer,
        }
    })
    export default class QuizAnswersContainer extends Vue {

        @Prop() private answers;

        // Edit Mode

        new_answer = false;

        get editMode() {

            return vxm.quiz.getQuizUtil.editMode;

        }

        get questions_array() {

            return vxm.quiz.getQuizUtil.questions;

        }

        get question() {

            return vxm.quiz.getQuizUtil.question;

        }

        get quiz_answers() {

            return this.questions_array[this.question].answers;

        }

        get disabled() {

            if (this.quiz_answers.length == Limits.max_amount_of_answers) {

                this.setNewAnswer(false); // hide the container for new answer input

            }

            if ((this.quiz_answers.length == 4) || this.new_answer) {

                return true;

            } else {

                return false;

            }

        }

         get current_lang() {

            return vxm.lang.getCurrentLangStrings;

         }

        setNewAnswer(value: boolean) {

            this.new_answer = value;

        }

        // Answer Configuration

        selectedAnswer(id: number): void {

            this.$emit("selectedAnswer", id);

        }

    }

</script>