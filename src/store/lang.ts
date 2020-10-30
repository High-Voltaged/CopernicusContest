import { createModule, mutation, action } from 'vuex-class-component';

import ApiWrapper from '../scripts/api_wrapper';
import IBriefArticle from '../../interfaces/brief_article';
import ICategory from '../../interfaces/category';
import IFullArticle from '../../interfaces/full_article';

const VuexModule = createModule({
    namespaced: 'lang',
    strict: false,
    target: 'nuxt',
})

export default class Lang extends VuexModule {

   current_lang = 0; 

   get currentLang() {

      return this.current_lang;

   }

   @mutation setLang(value: number) {

      this.current_lang = value;

   }

} 