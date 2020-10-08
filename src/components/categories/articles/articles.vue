<template>

    <div v-if="articles.length > 0">

            <div v-for="article in articles">

                <CategoryArticle :article="article"> </CategoryArticle>

            </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import ApiUtils from "../../../scripts/api_utils";
    import CategoryArticle from './article.vue';

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

            this.articles = await ApiUtils.fetchArticlesByCategory(this.category_id);

        }

    }

</script>