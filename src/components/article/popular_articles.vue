<template>

    <div v-if="articles.length > 0">

        <div class="article-link-container mt-4 flex flex-col lgMax:items-center">

            <span class="block text-gray-200 text-xl xl:text-2xl tracking-wide font-semibold lgMax:text-center my-2">Popular articles</span>

            <div class="flex flex-wrap justify-evenly lg:block">
                
                <div class="article article-link py-3 my-2 text-gray-300 leading-tight tracking-tight font-light rounded lgMax:mx-3 lgMax:min-w-1/3" v-for="article in articles">

                    <PopularArticle :article="article"></PopularArticle>

                </div>
            
            </div>


        </div>

        <!-- <div class="tag-container mt-4 flex flex-col lgMax:items-center">

        <span class="block text-gray-200 text-xl xl:text-2xl tracking-wide font-semibold lgMax:text-center my-2">Tags</span>

        <div class="flex flex-wrap lgMax:justify-center ml-1">

            <span class="px-3 py-1 m-1 text-gray-300 rounded-lg border-2 border-purple-secondary hover:bg-purple-secondary transition duration-300 ease cursor-pointer"><a href="#">Tag</a></span>

            <span class="px-3 py-1 m-1 text-gray-300 rounded-lg border-2 border-purple-secondary hover:bg-purple-secondary transition duration-300 ease cursor-pointer"><a href="#">Here</a></span>

            <span class="px-3 py-1 m-1 text-gray-300 rounded-lg border-2 border-purple-secondary hover:bg-purple-secondary transition duration-300 ease cursor-pointer"><a href="#">Inline element</a></span>

            <span class="px-3 py-1 m-1 text-gray-300 rounded-lg border-2 border-purple-secondary hover:bg-purple-secondary transition duration-300 ease cursor-pointer"><a href="#">Stuff</a></span>

            <span class="px-3 py-1 m-1 text-gray-300 rounded-lg border-2 border-purple-secondary hover:bg-purple-secondary transition duration-300 ease cursor-pointer"><a href="#">Tag here</a></span>

        </div>

    </div> -->

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import PopularArticle from './popular_article.vue';

    @Component({
        name: "PopularArticles",
        components: {
            PopularArticle,
        }
    })
    export default class PopularArticles extends Vue {
        @Prop() private articles;
    }

</script>