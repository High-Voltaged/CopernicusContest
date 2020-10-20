<template>

    <transition name="fade-away">

        <div v-if="answer">

            <button @click="selectedAnswer()"
                    :class="{ 'transform hover:-translate-y-2 focus:shadow-solidDark focus:opacity-50': !editMode }"
                    class="button-container flex items-center w-56 flex-shink-0 flex-grow-0 relative rounded-lg focus:outline-none bg-gray-200 p-2 m-2 transition duration-300 ease-in">

                <div class="flex-0 w-6 min-w-6 h-6 min-h-6 mr-2 flex justify-center items-center rounded-full bg-purple-400">

                    <span class="text-white text-sm leading-loose select-none">
                        {{ answer.letter_label }}
                    </span>

                </div>

                <div class="text-sm text-gray-secondary tracking-wider pr-2">
                    {{ answer.answer }}
                </div>

                <button v-if="editMode"
                        @click="removeAnswer()"
                        class="inline-flex items-center justify-center absolute -right-2 -top-2 w-4 h-4 rounded-full shadow bg-red-primary transform hover:scale-125 transition duration-300 ease focus:outline-none">

                    <font-awesome-icon :icon="['fas', 'times']" class="flex-0 w-2 h-2 fill-current text-gray-200" />

                </button>

            </button>

        </div>

    </transition>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import { vxm } from '../../store';

    @Component({
        name: "QuizAnswer",
    })
    export default class QuizAnswer extends Vue {

        @Prop() private answer;

        get editMode() {

            return vxm.quiz.getQuizUtil.editMode;

        }

        get questions_array() {

            return vxm.quiz.getQuizUtil.questions;

        }

        get question() {

            return vxm.quiz.getQuizUtil.question;

        }

        get answers() {

            return this.questions_array[this.question].answers;

        }

        selectedAnswer(): void {

            this.$emit("selectedAnswer", this.answer.id);

        }

        removeAnswer(): void {

            vxm.quiz.removeAnswer(this.answer.id);

            vxm.quiz.assignLetterLabels();

        }

    }

</script>