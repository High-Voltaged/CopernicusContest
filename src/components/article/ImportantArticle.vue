<template>

   <div class="read-more-container w-full xl:w-9/20 max-w-full xl:max-w-1/2 mx-4 my-8 lg:m-4">

      <div :class="{ 'justify-between': picture_right }" class="flex flex-col lg:flex-row items-center lg:items-end lg:min-h-56 xl:h-88">

         <div :class="{ 'lg:order-2': picture_right }" class="read-more-image flex-0 w-full sm:w-2/3 lg:w-40 2xl:w-48 h-80 lg:h-56 xl:h-72 rounded-lg shadow-md overflow-hidden lg:-mb-2 xl:-mb-8 z-10 lg:transition lg:duration-300 lg:ease-in">
            <img :src="article.picture_link" class="h-full w-full object-cover" />
         </div>

         <div :class="picture_right ? ['lg:order-1', 'lg:mr-3',  '2xl:mr-5'] : ['lg:ml-3',  '2xl:ml-5']" class="flex flex-col lg:justify-end mt-8 lg:mt-0 xl:w-2/3 lg:h-full overflow-hidden">
         
            <span class="text-gray-200 text-center lg:text-left font-semibold text-2xl tracking-wide capitalize">
               {{ article.title }}
            </span>
      
            <p v-html="article_content" class="text-styled text-gray-300 font-light text-sm leading-relaxed text-justify"></p>
         
         </div>

      </div>

      <div :class="{ 'lg:justify-start': picture_right }" class="rounded-md bg-gray-400 -mx-2 mt-4 p-2 flex items-center justify-end w-full">

         <span class="mr-4">
            {{ article.timestamp }}
         </span>

         <button class="arrow-container flex items-center px-3 py-2 rounded hover:opacity-75 transition duration-300 linear focus:outline-none">

            <router-link :to="`/article/${article.id}`" tag="span" class="text-xs xl:text-sm font-semibold tracking-wide text-gray-200 cursor-pointer pr-2">
               Read more
            </router-link>

            <span class="arrow-icon w-3 h-3">
               <font-awesome-icon :icon="['fas', 'arrow-right']" class="w-full h-full fill-current text-gray-200" />
            </span>

         </button>

      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import IBriefArticle from '../../../interfaces/brief_article';

   @Component({
      name: "ImportantArticle",
   })
   export default class ImportantArticle extends Vue {

      @Prop() private article: IBriefArticle;

      get article_content() {

         return this.article.content.slice(0, 340) + '...';

      }

      @Prop({ default: false }) private picture_right?: boolean;

   }

</script>

