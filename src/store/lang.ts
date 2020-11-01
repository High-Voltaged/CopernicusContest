import { createModule, mutation, action } from 'vuex-class-component';

import ApiWrapper from '../scripts/api_wrapper';
import { LangEnum } from '../scripts/lang/enum';
import { LangUtil } from '../scripts/lang/utils';
import { Lang as LangStrings } from '../scripts/lang/lang';

const VuexModule = createModule({
    namespaced: 'lang',
    strict: false,
    target: 'nuxt',
})

export default class Lang extends VuexModule {

   current_language = {
      id: 1,
      name: 'PL',
   }; 

   current_lang_strings = LangStrings.Polish;

   get getCurrentLang() {

      return this.current_language;

   }

   get getCurrentLangStrings() {

      return this.current_lang_strings;

   }

   @mutation setLang(language: number) {

      LangUtil.setLanguage(language);

      this.current_language.id = language;
      this.current_language.name = (language == 0) ? 'ENG' : 'PL';

      this.current_lang_strings = LangUtil.getLanguage();

   }

}
