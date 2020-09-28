import Vue from 'vue'
import Router from 'vue-router'

import index from '~/pages/index.vue'
import quiz from '~/pages/quiz.vue'
import contentPage from '~/pages/content.vue'
import categories from '~/pages/categories.vue'

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
                path: '/quiz',
                component: quiz,
            },
            {
                path: '/article/:id',
                component: contentPage,
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