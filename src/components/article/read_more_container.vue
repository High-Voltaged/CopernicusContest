<template>

   <div class="read-more-container w-full lg:w-9/20 max-w-full lg:max-w-1/2 mx-4 my-8 lg:m-4">

      <!-- <ImportantArticle :article="article"></ImportantArticle> -->

      <div class="flex flex-col md:flex-row items-center lg:items-end">

         <div :class="{ 'order-2': picture_right }" class="read-more-image flex-shrink-0 w-full sm:w-2/3 h-full md:w-40 md:h-64 2xl:w-48 2xl:h-72 rounded-lg shadow-md overflow-hidden md:-mb-6 lg:-mb-2 xl:-mb-8 z-10 lg:transition lg:duration-300 lg:ease-in">
            <img :src="article.src" class="h-full w-full object-cover" />
         </div>

         <div :class="picture_right ? ['order-1', 'md:mr-3',  '2xl:mr-5'] : ['md:ml-3',  '2xl:ml-5']" class="flex flex-col mt-8 md:mt-0 lg:w-1/2 xl:w-2/3 max-h-72 overflow-hidden">
            <span class="text-gray-200 font-semibold text-3xl tracking-wide capitalize">
               {{ article.Title }}
            </span>
            <span class="text-gray-300 font-light text-sm leading-relaxed text-justify">
               {{ article.content }}
            </span>
         </div>

      </div>

      <div :class="picture_right ? 'justify-start' : 'justify-end'" class="rounded-md bg-gray-400 -mx-2 mt-4 p-2 flex items-center">
         
         <span class="mr-4">
            {{ article.timestamp }}
         </span>

         <button class="arrow-container flex items-center px-3 py-2 rounded hover:opacity-75 transition duration-300 linear focus:outline-none">
            
            <a href="#" class="text-xs xl:text-sm font-semibold tracking-wide text-gray-200 cursor-pointer pr-2">Read more</a>
            
            <span class="arrow-icon w-3 h-3">
               <font-awesome-icon :icon="['fas', 'arrow-right']" class="w-full h-full fill-current text-gray-200" />
            </span>
      
         </button>
      
      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';

   @Component({
      name: "ReadMoreContainer",
   })
   export default class ReadMoreContainer extends Vue {
      
      @Prop() private article;

      @Prop({ default: false }) private picture_right?: boolean;
   
   }

</script>