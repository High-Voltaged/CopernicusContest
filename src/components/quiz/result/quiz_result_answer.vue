<template>

    <div v-if="answer">

        <div v-if="color == 'correct'">

            <button class="button-container-correct flex items-center w-56 flex-shink-0 flex-grow-0 rounded-xl focus:outline-none bg-green-400 p-2 m-2 transition duration-300 ease-in hover:shadow-solid">

                <div class="w-6 min-w-6 h-6 min-h-6 mr-2 flex justify-center items-center rounded-full bg-white">

                    <span class="text-gray-secondary text-sm leading-loose select-none"> {{ answer.letter_label  }} </span>

                </div>

                <div class="text-sm text-gray-secondary tracking-wider pr-2"> {{ answer.answer }} </div>

            </button>

        </div>
        <div v-else-if="color == 'incorrect'">

            <button class="button-container-incorrect flex items-center w-56 flex-shink-0 flex-grow-0 rounded-xl focus:outline-none bg-red-primary p-2 m-2 transition duration-300 ease-in hover:shadow-solid">

                <div class="w-6 min-w-6 h-6 min-h-6 mr-2 flex justify-center items-center rounded-full bg-white">

                    <span class="text-gray-secondary text-sm leading-loose select-none"> {{ answer.letter_label  }} </span>

                </div>

                <div class="text-sm text-gray-secondary tracking-wider pr-2"> {{ answer.answer }} </div>

            </button>

        </div>
        <div v-else>

            <button class="button-container flex items-center w-56 flex-shink-0 flex-grow-0 rounded-xl focus:outline-none bg-gray-200 p-2 m-2 transition duration-300 ease-in hover:shadow-solid">

                <div class="w-6 min-w-6 h-6 min-h-6 mr-2 flex justify-center items-center rounded-full bg-purple-400">

                    <span class="text-white text-sm leading-loose select-none"> {{ answer.letter_label  }} </span>

                </div>

                <div class="text-sm text-gray-secondary tracking-wider pr-2"> {{ answer.answer }} </div>

            </button>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';

    @Component({
        name: "QuizResultAnswer",
    })
    export default class QuizResultAnswer extends Vue {

        @Prop() private answer;
        @Prop() private color;

    }

</script>