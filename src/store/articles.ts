import { createModule, mutation, action } from 'vuex-class-component';
import moment from 'moment';

import ApiUtils from '../scripts/api_utils';
import IBriefArticle from '../../interfaces/brief_article';
import ICategory from '../../interfaces/category';
import IFullArticle from '../../interfaces/full_article';

const VuexModule = createModule({
    namespaced: 'articles',
    strict: false,
    target: 'nuxt',
})

export default class Articles extends VuexModule {

    article = [];

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

        this.article = (await ApiUtils.fetchArticle(Number(article_id)))[0];

        this.article.timestamp = moment(this.article.timestamp).format('YYYY-MM-DD HH:mm:s');

        this.article.content = this.article.content.split("\n");

        let popular_articles = await ApiUtils.fetchPopularArticles();

        for (let i = 0; i < popular_articles.length; ++i) {

            let temp_article: IBriefArticle = {} as IBriefArticle;

            temp_article.ID = popular_articles[i].id;
            temp_article.TimesRead = popular_articles[i].times_read;
            temp_article.Title = popular_articles[i].title;
            temp_article.Timestamp = moment(popular_articles[i].timestamp).format('YYYY-MM-DD HH:mm:s');

            this.popular_articles.push(temp_article);

        }

        let categories = await ApiUtils.fetchCategories();

        for (let i = 0; i < categories.length; ++i) {

            let temp_category: ICategory = {} as ICategory;
            temp_category.ID = categories[i].id;
            temp_category.Name = categories[i].name;
            this.categories.push(temp_category);

        }
    }
}