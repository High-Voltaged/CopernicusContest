<template>
   
   <div>

      <ArticleContent :editOn="true">
      
         <template #editTitle>

            <div class="flex items-end justify-between w-full">

               <div class="flex-auto inline-block mx-2">
                  <input v-model="article.title" placeholder="Edit the title" type="text" class="w-full md:w-48 xl:w-72 bg-gray-tertiary bg-opacity-75 text-sm text-gray-200 py-2 px-3 overflow-hidden focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 15px 15px 0 0" />
               </div>

               <div class="inline-flex items-end space-x-2 ml-2 mr-2">
                  <button @click="saveChanges()" class="p-2 bg-purple-secondary bg-opacity-50 text-white text-center text-sm font-medium capitalize hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 10px 10px 0 0">
                     Save changes
                  </button>

                  <button @click="removeArticle()" class="p-2 bg-red-600 bg-opacity-50 text-white text-center text-sm font-medium hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 10px 10px 0 0">
                     Remove article
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

      get article() {

         return vxm.articles.getUtil.article;
      
      };

      async saveChanges(): Promise<void> {

         // let result = await ApiUtils.postArticleChanges({ article: this.article }); 
         
         // console.log(result.data);

         this.$router.push('/edit');

      }

      async removeArticle(): Promise<void> {

         // let result = await ApiUtils.removeArticle({ id: this.article.id }); 
         
         // console.log(result.data);

         this.$router.push('/edit');

      }

   }   

</script>