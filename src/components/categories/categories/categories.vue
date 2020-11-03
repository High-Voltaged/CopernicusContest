<template>

   <div class="flex flex-col items-center w-full h-full py-8 overflow-y-auto overflow-x-hidden">

      <div class="flex flex-col items-center justify-center w-full md:w-3/4 lg:w-3/5 2xl:w-2/5 m-auto px-5 md:px-0 z-10">

         <div v-if="categories.length > 0" class="article-sort flex flex-col items-center w-full relative bg-gray-main space-y-6 p-3 md:p-5 xl:p-10 shadow-lg" style="border-radius: 15px">

            <button v-if="editMode" @click="$emit('setNewCategory')" class="inline-flex items-center justify-center mt-3 xl:mt-0 px-2 py-1 lg:px-4 lg:py-2 bg-gray-tertiary shadow bg-opacity-50 hover:bg-opacity-75 transition duration-300 ease focus:outline-none" style="border-radius: 15px">

               <span class="inline-block p-1">
                  <font-awesome-icon :icon="['fas', 'plus']" class="w-4 h-4 fill-current text-white" />
               </span>

               <span class="text-left text-base xl:text-lg font-semibold text-white select-none">
                  {{ current_lang.add_a_category }}
               </span>

            </button>

            <CategoryItem 
               v-for="(category, i) in categories"
               :key="category.id"   
               :category="category"
               @edit="$emit('edit', i)"
               :edit_menu="edit_menu"
            ></CategoryItem>

         </div>

         <div v-else-if="(categories.length == 0) && !editMode" class="article-sort flex flex-col w-full bg-gray-main p-3 md:p-5 xl:p-10 shadow-lg" style="border-radius: 15px">

            <CategoryItem :category="category" :edit_menu="edit_menu"></CategoryItem>

         </div>

      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import { vxm } from '../../../store';
   
   import CategoryItem from './Category.vue';
   import APIWrapper from "../../../scripts/api_wrapper";
   import ICategory from '../../../../interfaces/category';

   @Component({
      name: "CategoriesList",
      components: {
         CategoryItem,
      }
   })
   export default class Categories extends Vue {

      @Prop() private edit_menu?: number;

      async beforeMount() {

         if (this.$route.params.id != undefined) {

            await vxm.categories.fetchCategory(this.$route.params.id);

         } else {

            await vxm.categories.fetchCategories();

         }

      }

      get categories() {

         return vxm.categories.getMainUtil.categories;

      }

      get category() {

         return vxm.categories.getMainUtil.category;

      }

      get editMode() {

         return vxm.categories.getMainUtil.editMode;

      }

      get current_lang() {

         return vxm.lang.getCurrentLangStrings;

      }

   }

</script>