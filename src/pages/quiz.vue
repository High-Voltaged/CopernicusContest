<template>

    <div class="flex flex-col">

        <div class="quiz-main-container overflow-y-auto overflow-x-hidden">

            <div v-if="questions_array.length > question">

               <QuizQuestion @selectedAnswer="selectedAnswer" @nextQuestion="nextQuestion" :questions_array="questions_array" :question="question"> </QuizQuestion>

            </div>
            
            <div v-else>

               <QuizResult :questions_array="questions_array" :correct_answers="correct_answers"> </QuizResult>

            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from "nuxt-property-decorator";
    import ApiUtils from '../scripts/api_utils';
    import QuizQuestion from '../components/quiz/quiz_question.vue';
    import QuizResult from '../components/quiz/result/quiz_result.vue';

    @Component({
        name: "quiz",
        components: {
            QuizQuestion,
            QuizResult,
        },
    })
    export default class quiz extends Vue {

        next: boolean = false;
        next1: boolean = false;
        question: number = 0;
        correct_answers: number = 0;

        questions_array = [];

        selectedAnswer(args): void {

            for (let i = 0; i < this.questions_array.length; ++i) {

                if (this.questions_array[i].id == args[1]) {

                    this.questions_array[i].selected_answer = args[0];

                    if (this.questions_array[i].selected_answer == this.questions_array[i].correct_answer_id) {

                        ++this.correct_answers;

                    }

                    break;

                }

            }

            this.nextQuestion();

        }

        getNextLetter(letter: string): string {

            let code: number = letter.charCodeAt(0);

            ++code;

            return String.fromCharCode(code);

        }

        nextQuestion(): void {

            ++this.question;

        }

        async formatQuizJSON(): Promise<void> {

            let quiz = await ApiUtils.fetchQuiz();

            for (let i = 0; i < quiz.length; ++i) {

                let found = false;

                for (let x = 0; x < this.questions_array.length; ++x) {

                    if (this.questions_array[x].id == quiz[i].id) {

                        this.questions_array[x].answers.push({
                            id: quiz[i].answer_id,
                            answer: quiz[i].answer,
                        });

                        found = true;

                        break;

                    }

                }

                if (!found) {

                    this.questions_array.push({
                        id: quiz[i].id,
                        question: quiz[i].question,
                        answers: [{
                            id: quiz[i].answer_id,
                            answer: quiz[i].answer,
                        }],
                        correct_answer_id: quiz[i].correct_answer_id,
                        selected_answer: -1,
                    });

                }

            }

            for (let i = 0; i < this.questions_array.length; ++i) {

                let letter = "A";

                for (let x = 0; x < this.questions_array[i]["answers"].length; ++x) {

                    this.questions_array[i]["answers"][x]["letter_label"] = letter;

                    letter = this.getNextLetter(letter);

                }

            }

        }

        async mounted(): Promise<void> {

            this.formatQuizJSON();

        }

    }

</script>