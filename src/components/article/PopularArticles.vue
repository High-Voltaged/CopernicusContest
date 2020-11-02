<template>

   <div v-if="articles.length > 0" class="article-link-container mt-4 flex flex-col">

      <span class="block text-gray-200 text-xl xl:text-2xl font-semibold lgMax:text-center my-2">
         Popular articles
      </span>

      <div class="flex flex-wrap justify-evenly lg:block space-y-4">
            
         <div 
            v-for="(article, i) in articles"
            :key="i"
            class="article article-link py-3 my-2 text-gray-300 leading-tight font-medium rounded lgMax:mx-3 w-full" 
         >

            <PopularArticle :article="article"></PopularArticle>

         </div>
      
      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import { vxm } from '../../store';

   import PopularArticle from './PopularArticle.vue';

   @Component({
      name: "PopularArticles",
      components: {
         PopularArticle,
      }
   })
   export default class PopularArticles extends Vue {
      
      @Prop() private articles;

      get current_lang() {

         return vxm.lang.getCurrentLangStrings;

      }
   
   }

</script>