<template>

    <div class="flex-col lg:flex-row flex justify-center lg:justify-around items-center mt-16">

        <div :class="{ 'lg:order-last': left_position }" class="w-full lg:w-1/2 px-4">

            <div class="flex justify-center md:justify-start">
                <span class="text-3xl font-semibold capitalize text-center md:text-left leading-tight text-gray-200">
                    {{ article.title }}
                </span>
            </div>

            <div class="sub-divider relative h-px my-5">
                <div class="sub-transparent-xs md:hidden absolute top-0 left-1/20 right-1/20 h-px flex justify-center items-center">
                </div>
                <div class="hidden md:block sub-transparent-desktop absolute top-0 right-1/20 h-px flex justify-center items-center">
                </div>
            </div>

            <div 
               v-for="(paragraph, i) in article.content"
               :key="i"
               class="inline-block">

               <p
                  v-html="paragraph"
                  class="text-styled text-justify lg:text-left text-sm leading-relaxed font-light text-gray-300">
               </p>

            </div>
            

        </div>

        <div :class="{ 'lg:order-first': left_position }" class="w-full sm:w-2/3 lg:w-1/3 2xl:w-1/4 pt-8 pb-8 lg:py-0 lg:px-2 md:h-full flex items-center">
            <img :src="article.picture_link" class="w-full h-full object-cover rounded-lg overflow-hidden shadow-lg">
        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from "nuxt-property-decorator";

    @Component({
        name: "MajorArticle",
        components: {
        },
    })
    export default class MajorArticle extends Vue {

        @Prop() private article;

        @Prop() private index;

        get left_position() {

            return (this.index % 2 == 0);

        }

    }

</script>