<template>

   <div>

      <Navbar />

      <div class="antialiased">

         <div class="main-container overflow-y-auto">

            <div class="main-title relative w-full h-104 md:h-88 p-5 flex flex-col items-center md:flex-row md:justify-around shadow-lg">

               <div class="absolute inset-0">
                  <img src="../img/banner.jpg" class="h-full w-full object-cover opacity-25" />
               </div>

               <div class="flex flex-col justify-center items-center w-full md:w-2/3  px-2 md:px-4 z-10">

                  <MainTitle
                     :content="main_titles[0]"
                     :divider="false"
                     key="4"
                  ></MainTitle>

                  <div class="mt-8">
                     <router-link to="/quiz">

                        <button class="arrow-container flex items-center px-6 py-3 2xl:py-4 2xl:px-8 rounded-full lg:transition duration-300 ease-in transform lg:hover:translate-x-6 shadow-md focus:outline-none">
                           
                           <p class="font-semibold tracking-wide text-gray-200 cursor-pointer pr-2">
                              Take A Quiz Here
                           </p>
                           
                           <span class="arrow-icon w-3 h-3">
                              <font-awesome-icon :icon="['fas', 'arrow-right']" class="w-full h-full fill-current text-gray-200" />
                           </span>
                        
                        </button>

                     </router-link>
                  </div>

               </div>

               <div class="w-full sm:w-7/10 md:w-1/3 2xl:w-1/4 flex items-start justify-center z-10 mt-8 sm:mt-4 md:mt-0 md:-mb-28 lg:-mb-40">
                  <div class="rounded-lg 2xl:rounded-xl shadow-md overflow-hidden 2xl:w-4/5 2xl:h-4/5 w-full h-full">
                        <img src="https://medcitynews.com/uploads/2017/03/GettyImages-545864039.jpg" class="w-full h-full max-h-80 overflow-hidden object-cover">
                  </div>
               </div>

            </div>

            <div class="mt-20 md:mt-12 xl:mt-16 px-5 md:px-24 py-10">

               <div class="container-main mdMax:overflow-x-hidden 2xl:w-4/5 2xl:mx-auto px-4 md:px-8 py-6 bg-gray-main shadow-md rounded-md">

                  <div class="w-full">

                     <div class="flex flex-col w-full">

                        <MainTitle
                           :content="main_titles[1]"
                           key="0"
                        ></MainTitle>

                        <MajorArticles> </MajorArticles>

                     </div>

                  </div>

                  <div class="mt-16 flex flex-col items-stretch justify-center 2xl:max-w-4/5 mx-auto w-full">
                        
                     <MainTitle
                        :content="main_titles[2]"
                        key="1"
                     ></MainTitle>

                     <Timeline></Timeline>

                  </div>

                  <div class="mt-4 2xl:max-w-4/5 mx-auto">
                        
                     <MainTitle
                        :content="main_titles[3]"
                        key="2"
                     ></MainTitle>

                     <ImportantArticles></ImportantArticles>

                  </div>

                  <DigestList> </DigestList>

               </div>

            </div>

            <Footer />

         </div>

      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import Navbar from '../components/navbar/Navbar.vue';
   import Footer from '../components/navbar/Footer.vue';
   import MajorArticles from '../components/article/MajorArticles.vue';
   import ImportantArticles from '../components/article/ImportantArticles.vue';
   import DigestList from '../components/digest/DigestList.vue';
   import Timeline from '../components/timeline/Timeline.vue';
   import MainTitle from '../components/other/MainTitle.vue';

   @Component({
      name: "index",
      components: {
         Navbar,
         Footer,
         MajorArticles,
         ImportantArticles,
         DigestList,
         Timeline,
         MainTitle,
      },
   })
   export default class index extends Vue {

      main_titles = [

          { subtitle: ' ', title: 'Blog na temat Mikołaja Kopernika', paragraph: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit' },
          { subtitle: ' ', title: 'Główne informacje', paragraph: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit' },
          { subtitle: ' ', title: 'Oś czasu', paragraph: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit' },
          { subtitle: ' ', title: 'Wyróżnione artykuły', paragraph: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit' },

      ]

   }

</script>