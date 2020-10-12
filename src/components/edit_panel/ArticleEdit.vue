<template>
   
   <div class="article-edit-container relative">

      <ArticleContent :editOn="true">
      
         <template #editTitle>

            <div class="flex items-end justify-between w-full">

               <div class="flex-auto inline-block mx-2">
                  
                  <input v-model="article.title" placeholder="Edit the title" type="text" class="w-full md:w-48 xl:w-72 bg-gray-tertiary bg-opacity-75 text-sm text-gray-200 py-2 px-3 overflow-hidden focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 15px 15px 0 0" />

               </div>

               <div class="inline-flex items-end space-x-2 ml-2 mr-2">
                  
                  <button @click="discardChanges" class="p-2 bg-red-600 bg-opacity-50 text-white text-center text-sm font-medium hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 10px 10px 0 0">
                     Discard changes
                  </button>

                  <button @click="saveChanges" class="p-2 bg-purple-secondary bg-opacity-50 text-white text-center text-sm font-medium hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 10px 10px 0 0">
                     Save changes
                  </button>

               </div>

            </div>

         </template>

         <template #editContent>

            <div class="w-full">
               <textarea v-model="article.content" placeholder="Edit the content" rows="10" class="w-full p-3 bg-gray-tertiary bg-opacity-75 text-sm text-gray-200 overflow-y-auto overflow-x-hidden focus:outline-none resize-none" style="border-radius: 15px"></textarea>
            </div>

         </template>

         <template #editCategory>

            <select type="text" v-model="article.category" placeholder="Article's category" class="w-full mt-1 bg-gray-400 text-sm py-1 px-2 rounded-lg overflow-hidden focus:outline-none border-transparent border-2 focus:border-gray-main transition duration-200 ease">
               <option
                  v-for="c in categories"
                  :key="c.id"
                  :value="c"
               >
                  {{ c.name }}
               </option>
            </select>

         </template>

         <template #editImg>

            <input 
               type="text" 
               v-model="article.picture_link" 
               placeholder="Article's picture src" 
               class="w-full bg-gray-tertiary bg-opacity-75 text-sm text-gray-200 py-2 px-3 overflow-hidden focus:bg-opacity-100 transition duration-200 ease focus:outline-none"
               style="border-radius: 15px" 
            />

         </template>

         <!-- <template #imgPlaceholder>

            <div class="img-placeholder absolute inset-0  flex items-center justify-center w-full h-full">

               <font-awesome-icon :icon="['fas', 'plus']" class="w-10 h-10 fill-current text-white" />

            </div>

         </template> -->

         <template #error>
            
            <transition name="fade-out">

               <div v-if="error" class="flex items-center justify-center w-full px-2 mb-2">

                  <span class="text-center text-sm font-medium text-red-primary">
                     Don't leave the input fields empty.
                  </span>

               </div>

            </transition>

         </template>

         <!-- <template #removeBtn>

            <div class="absolute right-4 bottom-4">

               <button @click="removeArticle" class="inline-flex items-center space-x-1 p-2 bg-red-primary opacity-50 hover:opacity-100 transition duration-300 ease rounded-lg focus:outline-none">

                  <font-awesome-icon :icon="['fas', 'trash']" class="w-4 h-4 fill-current text-gray-300" />

               </button>

            </div>

         </template> -->

      </ArticleContent>      

      <transition name="fade-out">

         <Notification 
            v-if="notif_on"
            :content="changes"
            @click="closeNotification"
         />

      </transition>

   </div>

</template>

<script lang="ts">
   
   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import APIWrapper from '../../scripts/api_wrapper';
   import { vxm } from '../../store';
   import ICategory from '../../../interfaces/category';

   import ArticleContent from '../../pages/content.vue';
   import Notification from './Notification.vue';

   @Component({
      name: "ArticleEdit",
      components: {
         ArticleContent,
         Notification,
      }
   })

   export default class ArticleEdit extends Vue {

      // Base Config

      categories: ICategory[] = [];

      error = false;

      
      async beforeMount() {

         this.categories = await APIWrapper.fetchCategories();

      }

      get article() {
         
         return vxm.articles.getUtil.article;
      
      };


      // Editing / Discarding  

      async saveChanges(): Promise<void> {

         if(!this.article.title || !this.article.content || !this.article.category_name || !this.article.picture_link) {

            this.error = true;
            return;
         
         } else {

            this.error = false;

         }

         // let result = await ApiUtils.postArticleChanges({ article: this.article }); 
         
         // console.log(result.data);

         this.notif_on = true;
         this.changes = 'Your changes to the article were saved.';

      }

      async discardChanges(): Promise<void> {

         vxm.articles.fetchArticle(this.$route.params.id);

         this.notif_on = true;
         this.changes = 'Your changes to the article were discarded.';

      }


      // Removing 

      async removeArticle(): Promise<void> {

         // let result = await APIWrapper.removeArticle(this.article.id);

         // console.log(result.data);

      }


      // Notification Config

      notif_on = false;

      changes: string = '';

      closeNotification(): void {

         this.notif_on = false;

         this.changes = '';

      }

   }   

</script>