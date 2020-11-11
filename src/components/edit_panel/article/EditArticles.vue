<template>

   <div class="flex-auto flex flex-col items-center justify-center relative space-y-6 lg:space-y-0 m-auto p-8 bg-gray-secondary">

      <button @click="goToAddArticle" class="lg:absolute lg:right-8 lg:top-8 flex items-center justify-center px-4 py-2 bg-gray-tertiary rounded-lg shadow bg-opacity-75 hover:bg-opacity-100 transition duration-300 ease focus:outline-none">

         <span class="inline-block p-1">
            <font-awesome-icon :icon="['fas', 'plus']" class="w-4 h-4 fill-current text-white" />
         </span>

         <span class="text-left text-base xl:text-lg font-semibold text-white select-none">
            {{ current_lang.add_an_article }}
         </span>

      </button>

     <div class="flex flex-col items-center justify-start w-full space-y-6">

         <div class="inline-block">
            <span class="text-left text-xl font-semibold text-white capitalize select-none">
               {{ current_lang.articles_configuration }}
            </span>
         </div>

         <div v-if="!default_menu" class="flex-auto flex flex-wrap items-center justify-center max-w-full">

            <EditPanelItem 
               v-for="article in articles"
               :key="article.id"
               :article="article"
               @click="goToArticle(article.id)"
            ></EditPanelItem>

         </div>

         <div v-else class="inline-block w-full">

             <span class="inline-block w-full text-center font-medium text-gray-300 select-none">

                 {{ current_lang.no_articles }}

             </span>

         </div>

      </div>

    </div>

</template>

<script lang="ts">
   
   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import IBriefArticle from "../../../../interfaces/brief_article";
   import APIWRapper from "../../../scripts/api_wrapper";
   import { vxm } from '../../../store';
   
   import EditPanelItem from './EditPanelItem.vue';
   
   @Component({
      name: "EditArticles",
      components: {
         EditPanelItem,
      }
   })
   
   export default class EditArticles extends Vue {
      
      default_menu = null;

      articles: IBriefArticle[] = [];
      
      async beforeMount() {
      
         this.articles = await APIWRapper.fetchEditArticlesList();

         if(this.articles.length == 0) {

            this.default_menu = true;

         } else {

            this.default_menu = false;

         }

         this.$nuxt.$loading.finish();
      
      }
      
      destroyed() {

         this.$nuxt.$loading.start();

      }

      goToArticle(id: number) {
      
         this.$router.push(`/edit/article/${id}`);
      
      }

      goToAddArticle() {

         this.$router.push('/add_article');

      }

      get current_lang() {

         return vxm.lang.getCurrentLangStrings;

      }
   
   }
</script>