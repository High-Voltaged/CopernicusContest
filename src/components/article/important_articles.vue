<template>

    <div v-if="articles.length > 0">

        <div class="flex flex-col lg:flex-row items-center mt-16">

            <div class="flex flex-wrap items-center justify-between ">

                <ImportantArticle v-for="(article, index) in articles"
                  :key="article.ID"
                  :article="article"
                  :picture_right="getPicPosition(index)"
               ></ImportantArticle>

            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import ImportantArticle from './important_article.vue';
    import ApiUtils from '../../scripts/api_utils';

    @Component({
        name: "ImportantArticles",
        components: {
            ImportantArticle,
        }
    })
    export default class ImportantArticles extends Vue {

        articles = [];

        getPicPosition(id: number) {

            if (id >= 2) {

                return true;

            } else {

                return false;

            }

        }

        async beforeMount() {

            let temp = await ApiUtils.fetchImportantArticles();

            for (let i = 0; i < temp.length; ++i) {

                this.articles.push(temp[i]);

            }

        }

    }

</script>