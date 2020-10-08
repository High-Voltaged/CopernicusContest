<template>
   
   <div class="relative">

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

         <template #editImg>

            <button v-if="!img_removed" @click="removeImg" class="right-2 top-2 absolute inline-flex items-center justify-center p-1 rounded-full bg-purple-secondary transform transition duration-300 ease hover:scale-125 focus:outline-none">

               <font-awesome-icon :icon="['fas', 'minus']" class="w-3 h-3 fill-current text-white" />

            </button>

         </template>

         <template #imgPlaceholder>

            <div class="img-placeholder flex items-center justify-center w-full h-full">

               <font-awesome-icon :icon="['fas', 'plus']" class="w-10 h-10 fill-current text-white" />

            </div>

         </template>

         <template #error>
            
            <transition name="fade-out">

               <div v-if="errors.empty_title || errors.empty_content" class="flex items-center justify-center w-full px-2 mb-2">

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
            :content="changes"
            @click="closeNotification"
         />

      </transition>


   </div>

</template>

<script lang="ts">
   
   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import ApiUtils from '../../scripts/api_utils';
   import { vxm } from '../../store';

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

      errors = {
         empty_title: false,
         empty_content: false,
      };

      img_removed = false;

      $refs: {
         img: HTMLImageElement;
      }

      get article() {
         
         return vxm.articles.getUtil.article;
      
      };


      // Editing / Discarding  

      removeImg(): void {
         
         let img = this.$children[0].$refs.img as HTMLImageElement; 
         
         img.src = '';
         this.article.picture_key = '';

         this.img_removed = true;

      }

      async saveChanges(): Promise<void> {

         if(!this.article.title || !this.article.content) {

            if(!this.article.title) {
   
               this.errors.empty_title = true;
   
            }
            
            if(!this.article.content) {
   
               this.errors.empty_content = true;
   
            } 

            return;

         } else {

            this.errors.empty_title = false;
            this.errors.empty_content = false;

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


      // Notification Config

      notif_on = false;

      changes: string = null;

      closeNotification(): void {

         this.notif_on = false;

      }

   }   

</script>