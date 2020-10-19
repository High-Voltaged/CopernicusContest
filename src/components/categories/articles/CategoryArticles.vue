<template>

    <div v-if="articles.length > 0">

        <div v-for="article in articles"
             :key="article.id">

            <CategoryArticle :article="article"> </CategoryArticle>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import APIWrapper from "../../../scripts/api_wrapper";
    import IBriefArticle from '../../../../interfaces/brief_article';
    import CategoryArticle from './CategoryArticle.vue';

    @Component({
        name: "CategoryArticles",
        components: {
            CategoryArticle,
        }
    })
    export default class CategoryArticles extends Vue {

        @Prop() private category_id;

        articles: IBriefArticle[] = [];

        async beforeMount() {

            this.articles = await APIWrapper.fetchArticlesByCategory(this.category_id);

        }

    }

</script>