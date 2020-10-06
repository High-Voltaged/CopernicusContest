<template>

   <div class="h-screen w-screen flex flex-col bg-gray-main">

      <Navbar />

      <div v-if="!current" class="flex-auto flex items-center justify-center w-full space-x-10 overflow-x-hidden overflow-y-auto p-10">

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

      <component :is="getCurrent"></component>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import { Wrapper as ApiUtils } from '../scripts/api_utils';
   import Navbar from '../components/navbar/Navbar.vue';
   import EditPanelItem from '../components/edit_panel/EditPanelItem.vue';
   import EditArticles from '../components/edit_panel/EditArticles.vue';

   @Component({
      name: "edit",
      components: {
         Navbar,
         EditPanelItem,
         EditArticles,
      },
   })

   export default class edit extends Vue {

      articles = 'Articles';
      quiz = 'Quiz';

      current: string = null; 

      get getCurrent() {

         return `Edit${this.current}`;

      }

      setCurrent(c: string) {

         this.current = c;

      }

   }

</script>