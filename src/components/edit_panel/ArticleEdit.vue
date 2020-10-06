<template>
   
   <div>

      <ArticleContent :editOn="true">
      
         <template #editTitle>

            <div class="flex items-end justify-between w-full">

               <div class="inline-block ml-2">
                  <input v-model="article.title" placeholder="Edit the title" type="text" class="w-72 bg-gray-tertiary bg-opacity-75 text-sm text-gray-200 py-2 px-3 overflow-hidden focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 15px 15px 0 0" />
               </div>

               <div class="inline-block ml-4 mr-8">
                  <button @click="saveChanges()" class="w-40 p-2 bg-purple-secondary bg-opacity-50 text-white text-center text-sm font-medium capitalize hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 10px 10px 0 0">
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

      </ArticleContent>      

   </div>

</template>

<script lang="ts">
   
   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import ApiUtils from '../../scripts/api_utils';
   import { vxm } from '../../store';

   import ArticleContent from '../../pages/content.vue';

   @Component({
      name: "ArticleEdit",
      components: {
         ArticleContent,
      }
   })

   export default class ArticleEdit extends Vue {

      // temp_article = null;

      async beforeMount() {

         vxm.articles.fetchArticle(this.$route.params.id);

         console.log(this.article);

         vxm.articles.setTempArticle();

      }

      get article() {

         return vxm.articles.getUtil.article;
      
      };

      get temp_article() {

         return vxm.articles.getUtil.temp_article;

      }

      async saveChanges(): Promise<void> {

         // let result = await ApiUtils.postArticleChanges({ article: this.temp_article }); 
         
         // console.log(result.data);

         this.$router.push('/edit');

      }

      beforeDestroy() {

         vxm.articles.setArticle(null);

      }

   }   

</script>