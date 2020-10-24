<template>

   <div v-if="articles.length > 0" class="article-link-container mt-4 flex flex-col lgMax:items-center">

      <span class="block text-gray-200 text-xl xl:text-2xl tracking-wide font-semibold lgMax:text-center my-2">Popular articles</span>

      <div class="flex flex-wrap justify-evenly lg:block">
            
         <div 
            v-for="(article, i) in articles"
            :key="i"
            class="article article-link py-3 my-2 text-gray-300 leading-tight tracking-tight font-light rounded lgMax:mx-3 lgMax:min-w-1/3" 
         >

            <PopularArticle :article="article"></PopularArticle>

         </div>
      
      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import PopularArticle from './PopularArticle.vue';

   @Component({
      name: "PopularArticles",
      components: {
         PopularArticle,
      }
   })
   export default class PopularArticles extends Vue {
      
      @Prop() private articles;
   
   }

</script>