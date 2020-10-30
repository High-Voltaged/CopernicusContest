<template>

    <div class="flex flex-col items-center w-full mt-4" v-if="question">

        <div class="inline-block w-full md:text-lg text-center font-normal text-gray-200"> 
           {{ question.question }} 
         </div>

        <QuizResultAnswers :question="question"></QuizResultAnswers>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import QuizResultAnswers from './QuizResultAnswers.vue';

    @Component({
        name: "QuizResultQuestion",
        components: {
            QuizResultAnswers,
        }
    })
    export default class QuizResultQuestion extends Vue {

        @Prop() private question;

    }

</script>