<template>

    <div class="flex flex-col">

        <div class="quiz-main-container overflow-y-auto overflow-x-hidden">

            <QuizQuestion v-if="questions_array.length > question"
                          :key="question"
                          @selectedAnswer="selectedAnswer"></QuizQuestion>

            <QuizResult v-else
                        :questions_array="questions_array"
                        :correct_answers="correct_answers"></QuizResult>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from "nuxt-property-decorator";

    import QuizQuestion from '../components/quiz/QuizQuestion.vue';
    import QuizResult from '../components/quiz/result/QuizResult.vue';

    import { vxm } from '../store';

    @Component({
        name: "quiz",
        components: {
            QuizQuestion,
            QuizResult,
        },
    })
    export default class quiz extends Vue {

        get questions_array() {

            return vxm.quiz.getQuizUtil.questions;

        }

        get correct_answers() {

            return vxm.quiz.getQuizUtil.correct_answers;

        }

        get question() {

            return vxm.quiz.getQuizUtil.question;

        }

        selectedAnswer(args): void {

            vxm.quiz.selectedAnswer(args);

            vxm.quiz.nextQuestion();

        }

        async beforeMount(): Promise<void> {

            await vxm.quiz.prepareQuiz(this.$route.name);

        }

        beforeDestroy() {

           vxm.quiz.resetQuiz();

        }

    }

</script>