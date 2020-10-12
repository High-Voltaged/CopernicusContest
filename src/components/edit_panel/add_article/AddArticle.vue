<template>

   <div class="flex items-center justify-center relative overflow-y-auto h-screen w-screen py-10 bg-gray-secondary">

      <button @click="goToAdmin" class="absolute inset-x-4 lg:right-auto lg:left-8 top-8 flex items-center justify-center mx-auto px-4 py-2 bg-gray-tertiary rounded-lg shadow bg-opacity-75 hover:bg-opacity-100 transition duration-300 ease focus:outline-none">

         <span class="inline-block p-1">
            <font-awesome-icon :icon="['fas', 'chevron-left']" class="w-4 h-4 fill-current text-white" />
         </span>

         <span class="text-left text-lg font-semibold text-white select-none">
            Back to Admin panel
         </span>

      </button>

      <div class="flex-0 flex items-center justify-center w-9/10 sm:w-80 px-6 py-8 m-auto mt-12 lg:mt-0 rounded-lg shadow bg-gray-tertiary">

         <form @submit.prevent="" class="flex-auto flex flex-col items-center justify-center w-full h-full space-y-6"> 

            <div class="flex-0 flex items-center justify-center w-full">
               <span class="text-xl font-semibold text-center capitalize text-white select-none">
                  A new article
               </span>
            </div>

            <div class="flex flex-col items-center w-full">

               <span class="text-sm font-semibold text-left capitalize text-white italic tracking-wide select-none">
                  Picture
               </span>

               <div class="flex flex-col items-center justify-center w-full relative mt-1">

                  <input type="text" v-model="article.picture_link" placeholder="Article's picture src" class="w-full mt-1 bg-gray-400 text-sm placeholder-gray-600 py-1 px-2 rounded-lg overflow-hidden focus:outline-none border-transparent border-2 focus:border-gray-main transition duration-200 ease" />

                  <transition name="fade-out">
                     <div v-if="article.picture_link" class="flex items-center justify-center w-48 h-48 mt-4 bg-gray-main overflow-hidden rounded-lg shadow cursor-pointer">
                        
                        <img ref="img" :src="article.picture_link" class="object-cover h-full w-full" />
                    
                     </div>
                  </transition>

               </div>

            </div>

            <div class="add-article__input-fields flex-auto flex flex-col items-center w-full space-y-5">

               <div class="inline-flex flex-col items-start w-full">
              
                  <label class="w-full text-sm font-semibold text-center capitalize text-white italic tracking-wide select-none">
                     Title
                  </label>

                  <input type="text" v-model="article.title" placeholder="Article's title" class="w-full mt-1 bg-gray-400 text-sm placeholder-gray-600 py-1 px-2 rounded-lg overflow-hidden focus:outline-none border-transparent border-2 focus:border-gray-main transition duration-200 ease" />
              
               </div>

               <div class="inline-flex flex-col items-start w-full">
                 
                  <label class="w-full text-sm font-semibold text-center capitalize text-white italic tracking-wide select-none">
                     Content
                  </label>
                 
                  <textarea rows="5" v-model="article.content" placeholder="Article's content" class="w-full mt-1 bg-gray-400 text-sm placeholder-gray-600 py-1 px-2 rounded-lg overflow-x-hidden overflow-y-auto focus:outline-none border-transparent border-2 focus:border-gray-main transition duration-200 ease resize-none"></textarea>
               
               </div>

               <div class="inline-flex flex-col items-start w-full">
               
                  <label class="w-full text-sm font-semibold text-center capitalize text-white italic tracking-wide select-none">
                     # Category
                  </label>
               
                  <select type="text" v-model="article.category" placeholder="Article's category" class="w-full mt-1 bg-gray-400 text-sm py-1 px-2 rounded-lg overflow-hidden focus:outline-none border-transparent border-2 focus:border-gray-main transition duration-200 ease">
                     <option
                        v-for="(option, i) in options"
                        :key="i"
                        :value="option.value"
                        :disabled="i == 0"
                     >
                        {{ option.category }}
                     </option>
                  </select>
               
               </div>

            </div>

            <transition name="fade-out">

               <div v-if="error" class="add-article__error flex items-center justify-center w-full px-2 mb-2">

                  <span class="text-center text-sm font-medium text-red-primary">
                     Don't leave the input fields empty.
                  </span>

               </div>

            </transition>

            <div class="add-article__config flex items-center space-x-6">

               <button @click="cancelAddition" type="submit" class="flex-0 inline-block py-1 px-4 rounded-lg bg-transparent border-2 border-gray-main border-opacity-75 hover:border-opacity-100 text-white font-medium transition duration-200 ease focus:outline-none select-none">
                  Cancel
               </button>

               <button @click="addArticle" type="submit" class="flex-0 inline-block py-1 px-4 rounded-lg bg-gray-main bg-opacity-75 text-white font-medium hover:bg-opacity-100 transition duration-200 ease focus:outline-none select-none">
                  Add article
               </button>

            </div>

         </form>

      </div>

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

   import Notification from '../Notification.vue';
   
   @Component({
      name: "AddArticle",
      components: {
         Notification,
      }
   })
   
   export default class AddArticle extends Vue {
      
      article = {

         title: '',
         content: '',
         category: '',
         picture_link: '',

      };

      options = [

         { category: 'Article\'s category', value: '' }, // do not remove
         { category: 'Biography', value: 'bio' },
         { category: 'Science', value: 'science' },
         { category: 'Facts', value: 'facts' },
         { category: 'Analysis', value: 'analysis' },
         { category: 'History', value: 'history' },

      ];

      error: boolean = false;


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