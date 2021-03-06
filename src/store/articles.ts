import { createModule, mutation, action } from 'vuex-class-component';

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

    article: IFullArticle | {} = {};

    categories: ICategory[] = [];

    popular_articles: IBriefArticle[] =  [];

    get getUtil() {

        return {
            article: this.article as IFullArticle,
            categories: this.categories,
            popular_articles: this.popular_articles,
        };

    }

    @mutation setArticle(article) {

        this.article = article;

    }

    @mutation setCategory(category: ICategory) {

      (this.article as IFullArticle).category = category;

    }

    @action async fetchArticle(payload: { article_id: string, stealth: boolean }): Promise<void> {

        this.article = (await ApiWrapper.fetchArticle(Number(payload.article_id), payload.stealth))[0];

        this.popular_articles = await ApiWrapper.fetchPopularArticles();

        this.categories = await ApiWrapper.fetchCategories();

    }

    @mutation resetArticleUtil() {

      this.article = {} as any;

      this.categories = [];

      this.popular_articles = [];

      this.validationError.value = false;
      this.validationError.content = '';

    }

    // Adding / Editing an Article

    validationError = {
        value: false,
        content: '',
    }

    get getValidationError() {

        return this.validationError;

    }

    @mutation setValidationError(payload: { value: boolean, content: string }) {

        this.validationError.value = payload.value;
        this.validationError.content = payload.content;

    }

}