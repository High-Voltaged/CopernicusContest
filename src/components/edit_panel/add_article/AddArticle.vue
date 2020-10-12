<template>

   <div class="article-add-container relative">

      <ArticleContent :addArticle="true">

         <template #editTitle>

            <div class="flex items-end justify-between w-full">

               <div class="flex-auto inline-block mx-2">
                  
                  <input v-model="article.title" placeholder="Article's title" type="text" class="w-full md:w-48 xl:w-72 bg-gray-tertiary bg-opacity-75 text-sm py-2 px-3 overflow-hidden focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 15px 15px 0 0" />

               </div>

               <div class="inline-flex items-end space-x-2 ml-2 mr-2">
                  
                  <button @click="cancelAddition" class="p-2 bg-red-600 bg-opacity-50 text-white text-center text-sm font-medium hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 10px 10px 0 0">
                     Cancel
                  </button>

                  <button @click="addArticle" class="p-2 bg-purple-secondary bg-opacity-50 text-white text-center text-sm font-medium hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 10px 10px 0 0">
                     Add article
                  </button>

               </div>

            </div>

         </template>

         <template #editContent>

            <div class="w-full">
               <textarea v-model="article.content" placeholder="Article's content" rows="10" class="w-full p-3 bg-gray-tertiary bg-opacity-75 text-sm overflow-y-auto overflow-x-hidden focus:outline-none resize-none" style="border-radius: 15px"></textarea>
            </div>

         </template>

         <template #addCategory>

            <label class="text-sm text-gray-500">
               Article's category
            </label>

            <select type="text" v-model="article.category" class="w-48 mt-1 bg-gray-tertiary bg-opacity-75 text-sm py-1 px-2 rounded-lg overflow-hidden focus:outline-none border-transparent border-2 focus:border-gray-main transition duration-200 ease">
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
               class="w-full bg-gray-tertiary bg-opacity-75 text-sm py-2 px-3 overflow-hidden focus:bg-opacity-100 transition duration-200 ease focus:outline-none"
               style="border-radius: 15px" 
            />

             <transition name="fade-out">

               <div v-if="article.picture_link" class="flex-auto flex items-center justify-center w-full mt-4 bg-gray-main overflow-hidden rounded-lg shadow cursor-pointer">
                     
                  <img :src="article.picture_link" class="object-cover h-full w-full" />
               
               </div>

            </transition>

         </template>

         <template #imgPlaceholder>

            <div class="img-placeholder absolute inset-0  flex items-center justify-center w-full h-full">

               <font-awesome-icon :icon="['fas', 'plus']" class="w-10 h-10 fill-current text-white" />

            </div>

         </template>

         <template #error>
            
            <transition name="fade-out">

               <div v-if="error" class="flex items-center justify-center w-full px-2 mb-2">

                  <span class="text-center text-sm font-medium text-red-primary">
                     Don't leave the input fields empty.
                  </span>

               </div>

            </transition>

         </template>

      </ArticleContent>

      <transition name="fade-out">

         <Notification 
            v-if="notif_on"
            :content="notif_content"
            @click="closeNotification"
         />

      </transition>

   </div>

</template>

<script lang="ts">
   
   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import APIWrapper from '../../../scripts/api_wrapper';
   import ICategory from '../../../../interfaces/category';

   import ArticleContent from '../../../pages/content.vue';
   import Notification from '../Notification.vue';
   
   @Component({
      name: "AddArticle",
      components: {
         ArticleContent,
         Notification,
      }
   })
   
   export default class AddArticle extends Vue {
      
      article = {

         title: '',
         content: '',
         category: null,
         picture_link: '',

      };

      categories: ICategory[] = [];

      error: boolean = false;

      async beforeMount() {

         this.categories = await APIWrapper.fetchCategories();

      }


      // Img Config

         img_removed: number = -1;

         setImg(): void {

            this.img_removed = 0;

         }

         removeImg(): void {
            
            this.article.picture_link = '';

            this.img_removed = 1;

         }


      // Add Article / Cancel

         async addArticle(): Promise<void> {

            for(let i in this.article) {

               if(!this.article[i]) {

                  this.error = true;
                  return;

               } else {

                  this.error = false;

               }

            }

            this.notif_content = 'Your article will be saved and added.';
            this.notif_on = true;

            // let result = await APIWrapper.addArticle(this.article.id);

            // console.log(result.data);

            this.resetArticle();            

         }

         cancelAddition(): void {

            this.notif_content = 'Your article\'s content will be discarded.';
            this.notif_on = true;

            this.resetArticle();

         }

         resetArticle(): void {

            for(let i in this.article) {

               this.article[i] = '';

            }

         }

      // Notification Config

         notif_on: boolean = false;
         notif_content: string = '';

         closeNotification(): void {

            this.notif_on = false;

            this.notif_content = '';

         }


      // Router Config

         goToAdmin(): void {

            this.$router.push('/admin');

         }
   
   }

</script>