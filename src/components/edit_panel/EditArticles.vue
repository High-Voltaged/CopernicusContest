<template>

    <div class="flex-auto flex items-center justify-center w-full h-full space-x-10 p-10 bg-gray-secondary">

        <div class="flex flex-col items-start w-full space-y-6">

            <div class="inline-block ml-2">
                <span class="text-left text-xl font-semibold text-white capitalize select-none">
                    Articles configuration
                </span>
            </div>

            <div class="flex-auto flex flex-wrap items-center max-w-full">

                <EditPanelItem v-for="article in articles"
                               :key="article.id"
                               :article="article"
                               @click="goToArticle(article.id)"></EditPanelItem>

            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from "nuxt-property-decorator";
    import EditPanelItem from './EditPanelItem.vue';
    import IBriefArticle from "../../../interfaces/brief_article";
    import APIWRapper from "../../scripts/api_wrapper";

    @Component({
        name: "EditArticles",
        components: {
            EditPanelItem,
        }
    })
    export default class EditArticles extends Vue {

        items = [

           { id: 10, title: 'Some title', info: 'This is a brief description of the article.' },
           { id: 20, title: 'Big title', info: 'This is a brief info of the article.' },
           { id: 30, title: 'Medium title', info: 'This is a short info of this.' },
           { id: 40, title: 'Some title', info: 'This will be very short.' },
           { id: 5, title: 'Big title', info: 'I\'m running out of ideas.' },
           { id: 6, title: 'Medium title', info: 'Okay, this is short.' },
           { id: 7, title: 'Some title', info: 'Something here is not so brief.' },
           { id: 8, title: 'Big title', info: 'This is quite short.' },
           { id: 9, title: 'Medium title', info: 'This info is relatively long.' },

         ];

        articles: IBriefArticle[] = [];

        async beforeMount() {

            console.log("hereeee");

            this.articles = await APIWRapper.fetchEditArticlesList();

            console.log(this.articles);

        }

        goToArticle(id: number) {

            this.$router.push(`/edit/article/${id}`);

        }

    }

</script>