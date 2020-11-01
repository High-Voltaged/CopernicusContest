import Vue from 'vue';
import Vuex from 'vuex';
import { extractVuexModule, createProxy } from 'vuex-class-component'; 
import Articles from './articles'; 
import Quiz from './quiz';
import Categories from './categories';

Vue.use(Vuex);

export const store = new Vuex.Store({
   strict: false,
   modules: {
      ...extractVuexModule(Articles),
      ...extractVuexModule(Quiz),
      ...extractVuexModule(Categories),
   }

}); 

export const vxm = {
   articles: createProxy(store, Articles),
   quiz: createProxy(store, Quiz),
   categories: createProxy(store, Categories),
}