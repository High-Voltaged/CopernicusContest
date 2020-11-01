<template>

   <div v-if="article" class="flex flex-col items-start w-full space-y-3">

      <div class="article-header flex items-center w-full lg:transition duration-300 ease capitalize">

         <div class="hidden lg:block w-4 h-4 flex-shrink-0">

            <font-awesome-icon :icon="['fas', 'angle-right']" class="h-full w-full fill-current text-purple-secondary" />

         </div>

         <div class="lg:hidden w-2 h-2 flex-shrink-0">

            <font-awesome-icon :icon="['fas', 'circle']" class="h-full w-full fill-current text-purple-secondary" />

         </div>

         <router-link tag="div" :to="`/article/${article.id}`" class="cursor-pointer ml-2"> 
            
            <span>
               {{ article.title }} 
            </span>
            
         </router-link>

      </div>

      <div class="flex flex-col xl:flex-row items-start xl:items-center xl:justify-between space-y-1 xl:space-y-0 w-full my-2 mx-1">

         <div class="flex-grow flex items-center text-white">

            <font-awesome-icon :icon="['fas', 'eye']" class="flex-shrink-0 w-3 h-3 fill-current" />

            <div class="ml-2 flex items-center">
               
               <span class="flex-shrink-0 text-xs">
                  Times viewed:
               </span>
               
               <span class="ml-1 text-xs"> 
                  {{ article.times_read }} 
               </span>
            
            </div>

         </div>

         <div class="flex-shrink w-full">

            <div class="text-xs font-light text-gray-400 text-right"> 
               {{ article.timestamp }} 
            </div>

         </div>

      </div>

   </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';

    @Component({
        name: "PopularArticle",
    })
    export default class PopularArticle extends Vue {

        @Prop() private article;

    }

</script>