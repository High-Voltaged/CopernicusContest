import Vue from 'vue'
import Router from 'vue-router'
import { vxm } from './store';
import { LangUtil } from './scripts/lang/utils';

import index from '~/pages/index.vue'
import quiz from '~/pages/quiz.vue'
import contentPage from '~/pages/content.vue'
import categories from '~/pages/CategoriesPage.vue'

import AdminPage from '~/pages/AdminPage.vue'
import ArticleEdit from '~/components/edit_panel/article/ArticleEdit.vue';
import ArticleAdd from '~/components/edit_panel/article/ArticleAdd.vue';
import QuizEdit from '~/components/edit_panel/quiz/QuizEdit.vue';
import CategoriesEdit from '~/components/edit_panel/categories/CategoriesEdit.vue';

Vue.use(Router);

export function createRouter() {
   const router = new Router({
        mode: 'history',
        routes: [
            {
                path: '*',
                component: index,
            },
            {
               path: '/',
               component: index,
            },
            {
                path: '/admin',
                component: AdminPage,
            },
            {
                path: '/quiz',
                component: quiz,
            },
            {
                path: '/article/:id',
                component: contentPage,
                name: "article_user_view",
            },
            {
                path: '/edit/article/:id',
                component: ArticleEdit,
            },
            {
                path: '/edit/quiz',
                component: QuizEdit,
                name: "quiz_admin_view",
            },
            {
               path: '/edit/categories',
               component: CategoriesEdit,
            },
            {
                path: '/categories',
                component: categories,
            },
            {
                path: '/category/:id',
                component: categories,
            },
            {
                path: '/add_article',
                component: ArticleAdd,
            },
        ]
    });

    return router;

}