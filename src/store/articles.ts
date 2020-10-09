import { createModule, mutation, action } from 'vuex-class-component';
import moment from 'moment';

import ApiWrapper from '../scripts/api_wrapper';
import IBriefArticle from '../../interfaces/brief_article';
import ICategory from '../../interfaces/category';
import IFullArticle from '../../interfaces/full_article';

const VuexModule = createModule({
    namespaced: 'articles',
    strict: false,
    target: 'nuxt',
})

export default class Articles extends VuexModule {

    article: IFullArticle = {};

    categories: ICategory[] = [];

    popular_articles: IBriefArticle[] = [];

    get getUtil() {

        return {
            article: this.article,
            categories: this.categories,
            popular_articles: this.popular_articles,
        };

    }

    @mutation setArticle(article) {

        this.article = article;

    }

    @action async fetchArticle(article_id: string) {

        this.article = (await ApiWrapper.fetchArticle(Number(article_id)))[0];

        this.article.timestamp = moment(this.article.timestamp).format('YYYY-MM-DD HH:mm:s');

        this.article.content = this.article.content.split("\n");

        this.popular_articles = await ApiWrapper.fetchPopularArticles();

        this.categories = await ApiWrapper.fetchCategories();

    }
}