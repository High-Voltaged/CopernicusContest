<template>

   <div class="flex-auto flex flex-col items-center justify-center relative space-y-6 lg:space-y-0 m-auto p-8 bg-gray-secondary">

      <button @click="goToAddArticle" class="lg:absolute lg:right-8 lg:top-8 flex items-center justify-center px-4 py-2 bg-gray-tertiary rounded-lg shadow bg-opacity-75 hover:bg-opacity-100 transition duration-300 ease focus:outline-none">

         <span class="inline-block p-1">
            <font-awesome-icon :icon="['fas', 'plus']" class="w-4 h-4 fill-current text-white" />
         </span>

         <span class="text-left text-lg font-semibold text-white select-none">
            Add an article
         </span>

      </button>

     <div class="flex flex-col items-center justify-start w-full space-y-6">

         <div class="inline-block">
            <span class="text-left text-xl font-semibold text-white capitalize select-none">
               Articles configuration
            </span>
         </div>

         <div class="flex-auto flex flex-wrap items-center justify-center max-w-full">

            <EditPanelItem 
               v-for="article in articles"
               :key="article.id"
               :article="article"
               @click="goToArticle(article.id)"
            ></EditPanelItem>

         </div>

      </div>

    </div>

</template>

<script lang="ts">
   
   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import EditPanelItem from './EditPanelItem.vue';
   import IBriefArticle from "../../../interfaces/brief_article";
   import APIWRapper from "../../scripts/api_wrapper";
   
   @Component({
      name: "EditArticles",
      components: {
         EditPanelItem,
      }
   })
   
   export default class EditArticles extends Vue {
      
      articles: IBriefArticle[] = [];
      
      async beforeMount() {
      
         console.log("hereeee");
         this.articles = await APIWRapper.fetchEditArticlesList();
         console.log(this.articles);
      
      }
      
      goToArticle(id: number) {
      
         this.$router.push(`/edit/article/${id}`);
      
      }

      goToAddArticle() {

         this.$router.push('/add_article');

      }
   
   }
</script>