<template>
   
   <div class="article-edit-container relative">

      <ArticleContent :editMode="true" @remove="setDialog">
      
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

            <div class="flex flex-col items-center w-full space-y-2">

               <SelectMenu
                  :category="article.category"
                  @input="setCategory($event)"
                  :color="'bg-gray-main'"
                  :border="'gray-tertiary'"
               ></SelectMenu>

            </div>

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

         <template #error>
            
            <transition name="fade-out">

               <div v-if="error.value" class="flex items-center justify-center w-full px-2 mb-2">

                  <span class="text-center text-sm font-medium text-red-primary">
                     {{ error.content }}
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

      <transition name="scale-out">

         <VerificationDialog
            v-if="verify_on"
            :content="verify_content"
            @cancel="handleModal(false)"
            @continue="handleModal(true)"
         />

      </transition>

   </div>

</template>

<script lang="ts">
   
   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import APIWrapper from '../../../scripts/api_wrapper';
   import { Limits } from '../../../../app/limits';
   import { vxm } from '../../../store';
   import ICategory from '../../../../interfaces/category';

   import ArticleContent from '../../../pages/content.vue';
   import Notification from '../Notification.vue';
   import VerificationDialog from '../VerificationDialog.vue';
   import SelectMenu from '../../other/SelectMenu.vue';

   @Component({
      name: "ArticleEdit",
      components: {
         ArticleContent,
         Notification,
         VerificationDialog,
         SelectMenu,
      }
   })

   export default class ArticleEdit extends Vue {

      // Base Config

      categories: ICategory[] = [];

      
      async beforeMount() {

         this.categories = await APIWrapper.fetchCategories();

      }

      beforeDestroy() {

         vxm.articles.setValidationError({ value: false, content: '' });
         
         this.notif_content = '';
         this.notif_on = false;

      }

      mounted() {

         this.$nextTick(() => {

            this.$nuxt.$loading.finish();

         });

      }

      destroyed() {

         this.$nuxt.$loading.start();

      }

      get article() {
            
         return vxm.articles.getUtil.article;
      
      };


      // Editing / Discarding  

      setCategory(category): void {

         vxm.articles.setCategory(category);

      }

      async saveChanges(): Promise<void> {

         if(this.validateChanges() && this.validateTitle() && this.validateContent() && this.validatePicture()) {

            vxm.articles.setValidationError({ value: false, content: '' });
         
         } else {

            return;

         }

         // let result = await ApiUtils.postArticleChanges({ article: this.article }); 
         
         // console.log(result.data);

          await APIWrapper.editArticle(this.article.id, this.article.title, this.article.content.join("\n"), this.article.picture_link, this.article.important, this.article.category.id);

         this.notif_on = true;
         this.notif_content = 'Your changes to the article were saved.';

      }

      async discardChanges(): Promise<void> {

         vxm.articles.fetchArticle({ article_id: this.$route.params.id, stealth: true });

         vxm.articles.setValidationError({ value: false, content: '' });

         this.notif_on = true;
         this.notif_content = 'Your changes to the article were discarded.';

      }

      // Removing 

      async removeArticle(): Promise<void> {

         await APIWrapper.deleteArticle(this.article.id);

         this.notif_on = true;
         this.notif_content = 'The artilce was removed.';

      }

      // Validation for Editing the Article
      
      get error() {

         return vxm.articles.getValidationError;

      }
      
      validateChanges(): boolean {

         let temp = {
            title: vxm.articles.getUtil.article.title,
            content: vxm.articles.getUtil.article.content,
            category: vxm.articles.getUtil.article.category,
            picture_link: vxm.articles.getUtil.article.picture_link,
         }

         for(let i in temp) {

            if(!temp[i]) {

               vxm.articles.setValidationError({ value: true, content: 'Don\'t leave the input fields empty.' });
               return false;

            } 

         }

         vxm.articles.setValidationError({ value: false, content: '' });
         return true;

      }

      validateTitle(): boolean {

         if(this.article.title.length < Limits.min_title_length) {

            vxm.articles.setValidationError({ value: true, content: 'The article\'s title\'s length is too short.' });
            return false;

         } else if(this.article.title.length > Limits.max_title_length) {

            vxm.articles.setValidationError({ value: true, content: 'The article\'s title\'s length is too long.' });
            return false;

         } else {

            return true;

         }

      }

      validateContent(): boolean {

          let sum_length: number = 0;

          console.log(this.article);

         if(this.article.content.length < Limits.min_content_length) {

            vxm.articles.setValidationError({ value: true, content: 'The article\'s content\'s length is too short.' });
            return false;

         } else if(this.article.title.length > Limits.max_content_length) {

            vxm.articles.setValidationError({ value: true, content: 'The article\'s content\'s length is too long.' });
            return false;

         } else {

            return true;

         }

      }

      validatePicture(): boolean {

         if(this.article.picture_link.length > Limits.max_picture_length) {

            vxm.articles.setValidationError({ value: true, content: 'The article\'s picture\'s link is invalid.' });
            return false;

         } else {

            return true;

         }

      }

      // Notification / Verify Config

      notif_on = false;
      notif_content: string = '';

      verify_on = false;
      verify_content: string = '';

      closeNotification(): void {

         this.notif_on = false;

         this.notif_content = '';

      }

      setDialog() {

         this.verify_on = true;
         this.verify_content = 'Are you sure you want to remove this article?';

      }

      handleModal(confirm: boolean): void {

         if(confirm) {

            this.removeArticle(); 
            this.verify_on = false;
            this.$router.push('/admin');

         } else {

            this.verify_on = false;

         }   

      }

   }   

</script>