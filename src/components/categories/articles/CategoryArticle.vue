<template>

   <div v-if="article">

      <div class="article-digest">

         <div class="flex flex-col px-4">

            <div @click="goToArticle()" class="py-3 px-4 mb-2 bg-gray-tertiary cursor-pointer shadow-md transform hover:translate-x-4 transition duration-300 linear" style="border-radius: 10px">
               
               <div class="flex items-center capitalize">
                     
                  <div class="w-2 h-2 flex-shrink-0">
                  
                     <font-awesome-icon :icon="['fas', 'circle']" class="h-full w-full fill-current text-purple-secondary" />
                  
                  </div>
                  
                  <div class="pl-2 text-lg text-gray-300 font-semibold"> {{ article.title }} </div>
               
               </div>
               
               <div class="flex flex-col sm:flex-row items-start sm:items-center sm:justify-between my-2">
                     
                  <div class="flex-grow flex items-center text-white">
                     
                     <font-awesome-icon :icon="['fas', 'eye']" class="flex-shrink-0 w-3 h-3 fill-current" />
                     
                     <div class="ml-2 flex items-center">
                        <span class="flex-shrink-0 text-xs">
                           {{ current_lang.times_viewed }}
                        </span>
                        <span class="ml-1 text-xs"> {{ article.times_read }} </span>
                     </div>
                  
                  </div>
                  
                  <div class="flex-shrink w-full">
                  
                     <div class="text-xs text-gray-400 text-right"> {{ article.timestamp }} </div>
            
                  </div>
            
               </div>
         
            </div>

         </div>

      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import { vxm } from '../../../store';

   @Component({
      name: "CategoryArticle",
   })
   export default class CategoryArticle extends Vue {

      @Prop() private article;

      goToArticle(): void {

         this.$router.push("/article/" + this.article.id);

      }

      get current_lang() {

         return vxm.lang.getCurrentLangStrings;

      }

   }

</script>