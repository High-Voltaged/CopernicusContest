import { createModule, mutation, action } from 'vuex-class-component';

import ApiWrapper from '../scripts/api_wrapper';
import IBriefArticle from '../../interfaces/brief_article';
import ICategory from '../../interfaces/category';
import IFullArticle from '../../interfaces/full_article';

const VuexModule = createModule({
    namespaced: 'categories',
    strict: false,
    target: 'nuxt',
})

export default class Categories extends VuexModule {

   init_categories: ICategory[] = [];
   categories: ICategory[] = [];
   category: ICategory = null;

   current = 0; 
   editMode = false;

   temp_id = -1;

   get getMainUtil() {

      return {
         init_categories: this.init_categories,
         categories: this.categories,
         category: this.category,
         current: this.current,

         editMode: this.editMode,
         error: this.validationError,
         savedCategory: this.saved_category,
      }

   }

   @mutation setEditMode(value: boolean) {

      this.editMode = value;

   }

   @mutation setCurrent(id: number) {

      this.current = id;

   }

   @mutation setCategory(name: string) {

      this.categories[this.current].name = name;

   }

   @mutation setInitConfig(categories: ICategory[]) {

      this.init_categories = categories;

   }

   @mutation addCategory() {

      let temp = {
         id: this.temp_id,
         name: '',
      };

      this.categories.push(temp);

      this.current = this.categories.length - 1;

      --this.temp_id;

   }

   @mutation removeCategory() {

      this.categories.splice(this.current, 1);

   }

   // Fetching categories

   @action async fetchCategory(category_id: string | number) {

      if(typeof category_id == 'number') {

         this.category = (await ApiWrapper.fetchCategory(category_id))[0];

      } else {

         this.category = (await ApiWrapper.fetchCategory(Number(category_id)))[0];

      }

   }

   @action async fetchCategories() {

      this.categories = await ApiWrapper.fetchCategories();

   }

   @mutation resetCategories() {

      this.init_categories = [];
      this.categories = [];
      this.category = null;
      this.current = 0;
      this.editMode = false;

   }


   // Validation

   validationError = {
      value: false,
      content: '',
   };

   saved_category = false;

   @mutation setValidationError(payload: { value: boolean; content: string }) {

      this.validationError.value = payload.value;
      this.validationError.content = payload.content;

   }

   @mutation checkSavedCategory(category: string) {

      if(!this.init_categories[this.current]) {

         this.saved_category = false;
         return;

      }

      if(category != this.init_categories[this.current].name) {

         this.saved_category = false;

      } else {

         this.saved_category = true;

      }

   }

}