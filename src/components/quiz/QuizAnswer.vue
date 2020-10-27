<template>

    <transition name="fade-away">

        <div v-if="answer" class="inline-block relative m-2">

            <button @click="selectedAnswer()"
                    :class="[
                        { 'transform hover:-translate-y-2 focus:shadow-solidDark focus:opacity-50': !editMode }, 
                        { 'bg-green-400': (correct_answer_id == answer.id) && editMode }, 
                        { 'hover:bg-green-400': editMode }
                     ]"
                    class="button-container flex items-center w-56 flex-shink-0 flex-grow-0 rounded-lg focus:outline-none bg-gray-200 p-2 transition duration-300 ease">

                <div class="flex-0 w-6 min-w-6 h-6 min-h-6 mr-2 flex justify-center items-center rounded-full" :class="(correct_answer_id == answer.id) && editMode ? 'bg-white' : 'bg-purple-400'">

                    <span class="text-sm leading-loose select-none" :class="(correct_answer_id == answer.id) && editMode ? 'text-gray-secondary' : 'text-white'">
                        {{ answer.letter_label }}
                    </span>

                </div>

                <div class="text-sm text-gray-secondary tracking-wider pr-2">
                    {{ answer.answer }}
                </div>

            </button>

            <button v-if="editMode"
                  @click="removeAnswer()"
                  class="inline-flex items-center justify-center absolute -right-2 -top-2 w-4 h-4 rounded-full shadow bg-red-primary transform hover:scale-125 transition duration-300 ease focus:outline-none">

               <font-awesome-icon :icon="['fas', 'times']" class="flex-0 w-2 h-2 fill-current text-gray-200" />

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

         get correct_answer_id() {

            return this.questions_array[this.question].correct_answer_id;

         }

        selectedAnswer(): void {

           if(!this.editMode) {

              this.$emit('selectedAnswer', this.answer.id);
              
           } else {

               vxm.quiz.setCorrectAnswer(this.answer.id);

           }

        }

        removeAnswer(): void {

            vxm.quiz.removeAnswer(this.answer.id);

            vxm.quiz.assignLetterLabels();

        }

    }

</script>