<template>

    <div v-if="articles.length > 0">

            <div v-for="article in articles">

                <CategoryArticle :article="article"> </CategoryArticle>

            </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import APIWrapper from "../../../scripts/api_wrapper";
    import CategoryArticle from './CategoryArticle.vue';

    @Component({
        name: "CategoryArticles",
        components: {
            CategoryArticle,
        }
    })
    export default class CategoryArticles extends Vue {

        @Prop() private category_id;

        articles = [];

        async beforeMount() {

            this.articles = await APIWrapper.fetchArticlesByCategory(this.category_id);

        }

    }

</script>