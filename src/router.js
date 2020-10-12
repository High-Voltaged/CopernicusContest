import Vue from 'vue'
import Router from 'vue-router'
import { vxm } from './store';

import index from '~/pages/index.vue'
import quiz from '~/pages/quiz.vue'
import contentPage from '~/pages/content.vue'
import categories from '~/pages/CategoriesPage.vue'

import AdminPage from '~/pages/AdminPage.vue'
import ArticleEdit from '~/components/edit_panel/ArticleEdit.vue';
import AddArticle from '~/components/edit_panel/add_article/AddArticle.vue';

Vue.use(Router)

export function createRouter() {
   return new Router({
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
         {
            path: '/addArticle',
            component: AddArticle,
         }
      ]
   })
}
