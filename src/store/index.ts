import Vue from 'vue';
import Vuex from 'vuex';
import { extractVuexModule, createProxy } from 'vuex-class-component'; 
import Articles from './articles'; 

Vue.use(Vuex);


export const store = new Vuex.Store({
   strict: false,
   modules: {
      ...extractVuexModule(Articles),
   }

}); 

export const vxm = {
   articles: createProxy(store, Articles),
}