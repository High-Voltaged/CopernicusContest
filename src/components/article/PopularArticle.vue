<template>

    <div v-if="article">

        <div>

            <div class="article-header flex items-center lg:transition duration-300 ease capitalize">

                <div class="hidden lg:block w-4 h-4 flex-shrink-0">

                    <font-awesome-icon :icon="['fas', 'angle-right']" class="h-full w-full fill-current text-purple-secondary" />

                </div>

                <div class="lg:hidden w-2 h-2 flex-shrink-0">

                    <font-awesome-icon :icon="['fas', 'circle']" class="h-full w-full fill-current text-purple-secondary" />

                </div>

                <a :href="article.id" class="ml-2"> {{ article.title }} </a>

            </div>

            <div class="flex flex-col xl:flex-row items-start xl:items-center xl:justify-between my-2 mx-1">

                <div class="flex-grow flex items-center text-white">

                    <font-awesome-icon :icon="['fas', 'eye']" class="flex-shrink-0 w-3 h-3 fill-current" />

                    <div class="ml-2 flex items-center">
                        <span class="flex-shrink-0 text-xs font-light tracking-wide">Times viewed:</span>
                        <span class="ml-1 text-xs font-light tracking-wide"> {{ article.times_read }} </span>
                    </div>

                </div>

                <div class="flex-shrink w-full">

                    <div class="text-xs font-light text-gray-400 text-right italic"> {{ article.timestamp }} </div>

                </div>

            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';

    @Component({
        name: "PopularArticle",
    })
    export default class PopularArticle extends Vue {

        @Prop() private article;

    }

</script>