<template>

    <div v-if="answers.length > 0">

        <div class="option-container flex flex-col md:flex-row flex-wrap items-center md:justify-evenly w-full 2xl:w-120">

            <div v-for="answer in answers">

                <QuizAnswer @selectedAnswer="selectedAnswer" :answer="answer"></QuizAnswer>

            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import QuizAnswer from './quiz_answer.vue';

    @Component({
        name: "QuizAnswersContainer",
        components: {
            QuizAnswer,
        }
    })
    export default class QuizAnswersContainer extends Vue {

        @Prop() private answers;

        selectedAnswer(id: number): void {

            this.$emit("selectedAnswer", id); 

        }

    }

</script>