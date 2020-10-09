<template>

    <div class="flex quiz-container flex-shrink-0 flex justify-center h-full w-full max-h-screen overflow-y-auto overflow-x-hidden py-8 transition duration-500 ease transform">
        
        <div class="quiz-card flex flex-col items-center m-auto w-19/20 sm:w-9/10 md:w-4/5 lg:w-2/3 xl:w-1/2 rounded-lg px-8 py-4 shadow-md">

            <div class="header w-full flex items-center justify-between pb-2 md:px-0 lg:px-2">
            
                <button class="text-center font-semibold text-gray-200 hover:text-gray-secondary transition duration-300 ease focus:outline-none">MAIN</button>
                
                <span class="text-base md:text-sm text-center font-normal text-gray-300">Question #{{ question + 1 }} out of {{ questions_array.length }}</span>
                
                <button class="w-8 h-8 focus:outline-none transition transform hover:scale-125 duration-500 linear">
                
                    <font-awesome-icon :icon="['fas', 'question-circle']" class="w-full h-full fill-current text-gray-400 hover:text-gray-200" />
                
                </button>
            
            </div>

            <div class="content py-2 md:px-0 lg:px-2 w-full 2xl:flex 2xl:flex-col 2xl:items-center">
                
                <div class="flex flex-col items-center justify-center w-full">
                    
                    <div v-if="questions_array[question]">

                        <span class="text-xl md:text-2xl text-center font-normal text-gray-200 md:px-2 lg:px-12 xl:px-8"> {{ questions_array[question]["question"] }} </span>

                    </div>

                    <div class="divider relative h-px my-5 min-w-full">

                        <div class="div-quiz-transparent absolute top-0 left-1/20 right-1/20 h-px">
                        </div>

                    </div>

                </div>

                <QuizAnswersContainer @selectedAnswer="selectedAnswer" :answers="questions_array[question]['answers']"></QuizAnswersContainer>


            </div>

            <div class="divider-full w-full min-w-full h-px my-4 bg-white"></div>

            <div class="footer w-full flex items-center justify-end md:px-0 lg:px-2">
            
                <button @click="nextQuestion()" class="text-center font-semibold text-gray-200 hover:text-gray-secondary transition duration-300 ease focus:outline-none">Next</button>
            
            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import QuizAnswer from './quiz_answer.vue';
    import QuizAnswersContainer from './quiz_answers_container.vue';

    @Component({
        name: "QuizQuestion",
        components: {
            QuizAnswer,
            QuizAnswersContainer,
        }
    })
    export default class QuizQuestion extends Vue {

        @Prop() private questions_array;
        @Prop() private question;

        nextQuestion(): void {

            this.$emit("nextQuestion", this.question + 1);

        }

        selectedAnswer(id): void {

            this.$emit("selectedAnswer", [id, this.questions_array[this.question].id]);

        }

        mounted() {

            this.questions_array[this.question];

        }

    }

</script>