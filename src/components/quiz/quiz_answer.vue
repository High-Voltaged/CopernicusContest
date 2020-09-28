<template>

    <div v-if="answer">

        <button @click="selectedAnswer()" class="button-container flex items-center w-56 flex-shink-0 flex-grow-0 rounded-xl focus:outline-none bg-gray-200 p-2 m-2 transition transform duration-300 ease-in hover:-translate-y-2 focus:shadow-solidDark focus:opacity-50">

            <div class="w-6 min-w-6 h-6 min-h-6 mr-2 flex justify-center items-center rounded-full bg-purple-400">

                <span class="text-white text-sm leading-loose select-none"> {{ answer.letter_label }} </span>

            </div>

            <div class="text-sm text-gray-secondary tracking-wider pr-2"> {{ answer.answer }} </div>

        </button>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';

    @Component({
        name: "QuizAnswer",
    })
    export default class QuizAnswer extends Vue {

        @Prop() private answer;

        selectedAnswer(): void {

            this.$emit("selectedAnswer", this.answer.id);

        }

    }

</script>