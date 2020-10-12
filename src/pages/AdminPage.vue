<template>

   <div class="flex items-center justify-center overflow-y-auto h-screen w-screen py-6 bg-gray-secondary">

      <div v-if="edit_menu == 0" class="flex-auto flex flex-col items-center justify-center h-full py-3 bg-gray-secondary">

         <AdminLogin> </AdminLogin>

      </div>

      <div v-else-if="edit_menu == 1" class="flex-auto flex flex-col md:flex-row items-center justify-center w-full h-full space-y-8 md:space-y-0 md:space-x-10 bg-gray-secondary p-8">

         <div class="flex items-center w-72">

            <div class="inline-block w-full">
               <button @click="setCurrent(articles)" class="w-full p-5 rounded-lg bg-gray-tertiary bg-opacity-75 text-base font-medium text-white select-none hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none">
                  Edit articles
               </button>
            </div>

         </div>

         <div class="flex items-center w-72">

            <div class="inline-block w-full">
               <button @click="setCurrent(quiz)" class="w-full p-5 rounded-lg bg-gray-tertiary bg-opacity-75 text-base font-medium text-white select-none hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none">
                  Edit the quiz
               </button>
            </div>

         </div>

      </div>

      <component :is="getCurrent()"></component>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import ApiWrapper from '../scripts/api_wrapper';
   import Navbar from '../components/navbar/Navbar.vue';
   import EditPanelItem from '../components/edit_panel/EditPanelItem.vue';
   import EditArticles from '../components/edit_panel/EditArticles.vue';
   import AdminLogin from '../components/admin/AdminLogin.vue';

   @Component({
      name: "AdminPage",
      components: {
         Navbar,
         EditPanelItem,
         EditArticles,
         AdminLogin,
      },
   })
   export default class AdminPage extends Vue {

      
      async submitForm(e) {
         
         e.preventDefault();

         // let result = await ApiUtils.processLogin(this.username, this.password);

         // console.log(result.data);

         // if(result.data == 0) {
            
            this.edit_menu = 1;

         // } else {
            
            //    this.error_message = true;

         // }

      }


      // Edit Menu

         edit_menu = 0;

         articles = 'Articles';
         quiz = 'Quiz';

         current: string = null;

         getCurrent() {

            return `Edit${this.current}`;

         }

         setCurrent(c: string) {

            this.current = c;
            this.edit_menu = -1;

         }

   }

</script>