<template>

   <div v-if="articles.length > 0" class="flex flex-col xl:flex-row items-center mt-16">

      <div class="flex flex-wrap items-center justify-between ">

            <ImportantArticle v-for="(article, index) in articles"
            :key="article.id"
            :article="article"
            :picture_right="getPicPosition(index)"
         ></ImportantArticle>

      </div>

   </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import ImportantArticle from './ImportantArticle.vue';
    import ApiWrapper from '../../scripts/api_wrapper';
    import IBriefArticle from '../../../interfaces/brief_article';

    @Component({
        name: "ImportantArticles",
        components: {
            ImportantArticle,
        }
    })
    export default class ImportantArticles extends Vue {

        articles: IBriefArticle[] = [];

        getPicPosition(id: number) {

            if (id >= 2) {

                return true;

            } else {

                return false;

            }

        }

        async beforeMount() {

            this.articles = await ApiWrapper.fetchImportantArticles();

            console.log(this.articles);

        }

    }

</script>