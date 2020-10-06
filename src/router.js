import Vue from 'vue'
import Router from 'vue-router'
import { vxm } from './store';

import index from '~/pages/index.vue'
import login from '~/pages/login.vue'
import quiz from '~/pages/quiz.vue'
import contentPage from '~/pages/content.vue'
import categories from '~/pages/categories.vue'

import edit from '~/pages/edit.vue'
import ArticleEdit from '~/components/edit_panel/ArticleEdit.vue';

Vue.use(Router)

export function createRouter() {
    return new Router({
        mode: 'history',
        routes: [
            {
                path: '/',
                component: index,
            },
            {
               path: '/login',
               component: login,
            },
            {
               path: '/edit',
               component: edit,
            },
            {
                path: '/quiz',
                component: quiz,
            },
            {
                path: '/article/:id',
                component: contentPage,
            },
            {
               path: '/edit/article/:id',
               component: ArticleEdit,
            },
            {
                path: '/categories',
                component: categories,
            },
            {
                path: '/category/:id',
                component: categories,
            },
        ]   
    })
}