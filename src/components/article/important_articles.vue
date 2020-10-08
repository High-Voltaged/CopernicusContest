<template>

    <div>

        <div class="flex flex-col lg:flex-row items-center mt-16">

            <div class="flex flex-wrap items-center justify-between lg:mr-8">

               <ReadMoreContainer
                  v-for="article in articles"
                  :key="article.ID"
                  :article="article"
                  :picture_right="getPicPosition(article.ID)"
               ></ReadMoreContainer>

            </div>

            <!-- <div class="flex flex-col items-center lg:ml-8">

                <div class="read-more-container max-w-full mt-16 lg:mt-0">

                    <div class="flex flex-col md:flex-row items-center lg:items-end">

                        <div class="read-more-image flex-shrink-0 w-full sm:w-2/3 h-full md:w-40 md:h-64 2xl:w-48 2xl:h-72 rounded-lg shadow-md overflow-hidden md:-mb-6 lg:-mb-2 xl:-mb-8 z-10 lg:transition lg:duration-300 lg:ease-in">
                            <img src="https://images.unsplash.com/photo-1574586594690-db2449286e33?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt="" class="h-full w-full object-cover" />
                        </div>

                        <div class="flex flex-col mt-8 md:mt-0 md:ml-3 2xl:ml-5 lg:w-1/2 xl:w-2/3 max-h-72 overflow-hidden">
                            <span class="text-gray-200 font-semibold text-3xl tracking-wide capitalize">Title here</span>
                            <span class="text-gray-300 font-light text-sm leading-relaxed text-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.</span>
                        </div>

                    </div>

                    <div class="rounded-md bg-gray-400 -mx-2 mt-4 p-2 flex justify-end items-center">
                        <span class="mr-4">Renaissance date</span>

                        <button class="arrow-container flex items-center px-3 py-2 rounded hover:opacity-75 transition duration-300 linear focus:outline-none">

                            <a href="#" class="text-xs xl:text-sm font-semibold tracking-wide text-gray-200 cursor-pointer pr-2">Read more</a>

                            <span class="arrow-icon w-3 h-3">
                                <font-awesome-icon :icon="['fas', 'arrow-right']" class="w-full h-full fill-current text-gray-200" />
                            </span>

                        </button>

                    </div>

                </div>

                <div class="read-more-container max-w-full mt-16">

                    <div class="flex flex-col md:flex-row items-center lg:items-end md:justify-between">

                        <div class="flex flex-col mt-8 md:mt-0 md:mr-3 2xl:mr-5 lg:w-1/2 xl:w-2/3 order-last md:order-first max-h-72 overflow-hidden">
                            <span class="text-gray-200 font-semibold text-3xl tracking-wide capitalize">Title here</span>
                            <span class="text-gray-300 font-light text-sm leading-relaxed text-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.</span>
                        </div>

                        <div class="read-more-image flex-shrink-0 w-full sm:w-2/3 h-full md:w-40 md:h-64 2xl:w-48 2xl:h-72 rounded-lg shadow-md overflow-hidden md:-mb-6 lg:-mb-2 xl:-mb-8 z-10 lg:transition lg:duration-300 lg:ease-in">
                            <img src="https://images.unsplash.com/photo-1499678329028-101435549a4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt="" class="h-full w-full object-cover" />
                        </div>

                    </div>

                    <div class="rounded-md bg-gray-400 -mx-2 mt-4 p-2 flex justify-end md:justify-start items-center">
                        <span class="mr-4">Renaissance date</span>

                        <button class="arrow-container flex items-center px-3 py-2 rounded hover:opacity-75 transition duration-300 linear focus:outline-none">

                            <a href="#" class="text-xs xl:text-sm font-semibold tracking-wide text-gray-200 cursor-pointer pr-2">Read more</a>

                            <span class="arrow-icon w-3 h-3">
                                <font-awesome-icon :icon="['fas', 'arrow-right']" class="w-full h-full fill-current text-gray-200" />
                            </span>

                        </button>

                    </div>

                </div>

            </div> -->

        </div>

    </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import ReadMoreContainer from './read_more_container.vue';
   import ImportantArticle from './important_article.vue';

   @Component({
      name: "ImportantArticles",
      components: {
         ImportantArticle,
         ReadMoreContainer,
      }
   })
   export default class ImportantArticles extends Vue {
      @Prop() private articles;

      getPicPosition(id: number) {

         if((id % 2) == 0) {

            return true;

         } else {

            return false;

         }

      }
   }

</script>