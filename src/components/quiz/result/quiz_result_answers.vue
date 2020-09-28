<template>

    <div v-if="question['answers'].length > 0">

        <div class="option-container flex flex-col md:flex-row flex-wrap items-center md:justify-evenly w-full mt-4 2xl:w-120">

            <div v-for="answer in question['answers']">

                <div v-if="question.correct_answer_id == question.selected_answer">

                    <div v-if="answer.id == question.selected_answer">

                        <QuizResultAnswer :answer="answer" color="correct"> </QuizResultAnswer>

                    </div>
                    <div v-else>

                        <QuizResultAnswer :answer="answer" color="none"> </QuizResultAnswer>

                    </div>

                </div>
                <div v-else>

                    <div v-if="answer.id == question.correct_answer_id">

                        <QuizResultAnswer :answer="answer" color="correct"> </QuizResultAnswer>

                    </div>
                    <div v-else-if="answer.id == question.selected_answer">

                        <QuizResultAnswer :answer="answer" color="incorrect"> </QuizResultAnswer>

                    </div>
                    <div v-else>

                        <QuizResultAnswer :answer="answer" color="none"> </QuizResultAnswer>

                    </div>

                </div>

            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import QuizResultAnswer from './quiz_result_answer.vue';

    @Component({
        name: "QuizResultAnswers",
        components: {
            QuizResultAnswer,
        }
    })
    export default class QuizResultAnswers extends Vue {

        @Prop() private question;

    }

</script>