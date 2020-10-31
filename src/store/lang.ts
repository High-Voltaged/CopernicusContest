import { createModule, mutation, action } from 'vuex-class-component';

import LangEnum from "../scripts/lang_enum";

const VuexModule = createModule({
    namespaced: 'lang',
    strict: false,
    target: 'nuxt',
})

export default class Lang extends VuexModule {

    current_lang = LangEnum.Polish; 

   get currentLang() {

      return this.current_lang;

   }

   @mutation setLang(value: number) {

      this.current_lang = value;

   }

} 