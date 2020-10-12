<template>

   <div class="flex-auto flex flex-col items-center justify-center relative w-full h-full space-y-6 lg:space-y-0 p-10 bg-gray-secondary">
      
      <button class="lg:absolute right-8 top-8 flex items-center justify-center px-4 py-2 bg-gray-tertiary rounded-lg shadow bg-opacity-75 hover:bg-opacity-100 transition duration-300 ease focus:outline-none">

         <span class="inline-block p-1">
            <font-awesome-icon :icon="['fas', 'plus']" class="w-4 h-4 fill-current text-white" />
         </span>

         <span class="text-left text-lg font-semibold text-white select-none">
            Add an article
         </span>

      </button>

     <div class="flex flex-col items-center justify-center w-full space-y-6">

         <div class="inline-block">
            <span class="text-left text-xl font-semibold text-white capitalize select-none">
               Articles configuration
            </span>
         </div>

         <div class="flex-auto flex flex-wrap items-center justify-center max-w-full">

            <EditPanelItem
               v-for="item in items"
               :key="item.id"
               :item="item"
               @click="goToArticle(item.id)"
            ></EditPanelItem>

         </div>

      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import EditPanelItem from './EditPanelItem.vue';

   @Component({
      name: "EditArticles",
      components: {
         EditPanelItem,
      }
   })

   export default class EditArticles extends Vue {

      items = [

         { id: 10, title: 'Some title', info: 'This is a brief description of the article.' },
         { id: 20, title: 'Big title', info: 'This is a brief info of the article.' },
         { id: 30, title: 'Medium title', info: 'This is a short info of this.' },
         { id: 40, title: 'Some title', info: 'This will be very short.' },
         { id: 5, title: 'Big title', info: 'I\'m running out of ideas.' },
         { id: 6, title: 'Medium title', info: 'Okay, this is short.' },
         { id: 7, title: 'Some title', info: 'Something here is not so brief.' },
         { id: 8, title: 'Big title', info: 'This is quite short.' },
         { id: 9, title: 'Medium title', info: 'This info is relatively long.' },

      ];

      goToArticle(id: number) {

         this.$router.push(`/edit/article/${id}`);

      }

   }

</script>