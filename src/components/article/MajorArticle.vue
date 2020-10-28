<template>

    <div class="flex-col lg:flex-row flex justify-center lg:justify-around items-center mt-16">

        <div :class="{ 'lg:order-last': left_position }" class="w-full lg:w-1/2 px-4">

            <div class="flex justify-center md:justify-start">
                <span class="text-3xl font-semibold tracking-wide capitalize text-center md:text-left leading-tight text-gray-200">
                    {{ article.title }}
                </span>
            </div>

            <div class="sub-divider relative h-px my-5">
                <div class="sub-transparent-xs md:hidden absolute top-0 left-1/20 right-1/20 h-px flex justify-center items-center">
                </div>
                <div class="hidden md:block sub-transparent-desktop absolute top-0 right-1/20 h-px flex justify-center items-center">
                </div>
            </div>

            <p v-for="(paragraph, i) in article.content"
               :key="i"
               class="text-justify lg:text-left text-sm leading-relaxed font-light text-gray-300">
                {{ paragraph }}
            </p><br>

            <div class="flex items-center justify-end mt-5">

                <router-link :to="`/article/${article.id}`" class="arrow-container flex items-center px-3 py-2 rounded-full lg:transition duration-300 ease-in lg:transform hover:translate-x-6 shadow focus:outline-none">

                    <span class="text-xs xl:text-sm tracking-wide text-gray-200 cursor-pointer pr-2">
                        Continue reading here
                    </span>

                    <span class="arrow-icon w-3 h-3">
                        <font-awesome-icon :icon="['fas', 'arrow-right']" class="w-full h-full fill-current text-gray-200" />
                    </span>

                </router-link>

            </div>

        </div>

        <div :class="{ 'lg:order-first': left_position }" class="w-full sm:w-2/3 lg:w-1/3 2xl:w-1/4 pt-8 pb-8 lg:py-0 lg:px-2 md:h-full flex items-center">
            <img src="https://images.unsplash.com/photo-1515405295579-ba7b45403062?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80" class="w-full h-full object-cover rounded-lg overflow-hidden shadow-lg">
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