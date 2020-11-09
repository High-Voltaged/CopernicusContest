<template>

   <div class="antialiased">

      <div class="main-container overflow-y-auto">

         <div class="main-title relative w-full h-104 md:h-88 p-5 flex flex-col items-center md:flex-row md:justify-around shadow-lg">

            <div class="absolute inset-0">
               <img src="../img/banner.jpg" class="h-full w-full object-cover opacity-25" />
            </div>

            <div class="flex flex-col justify-center items-center w-full md:w-2/3 px-2 md:px-4 z-10">

               <MainTitle
                  :content="main_titles[0]"
                  :divider="false"
                  key="4"
               ></MainTitle>

               <div class="mt-8">
                  <router-link to="/quiz">

                     <button class="arrow-container flex items-center px-6 py-3 2xl:py-4 2xl:px-8 rounded-full lg:transition duration-300 ease-in transform lg:hover:translate-x-6 shadow-md focus:outline-none">
                        
                        <span class="font-medium tracking-wide text-gray-200 cursor-pointer pr-2">
                           {{ current_lang.take_a_quiz_here }}
                        </span>
                        
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

         <div class="mt-20 sm:mt-8 md:mt-12 xl:mt-16 px-3 md:px-24 py-10">

            <div class="container-main mdMax:overflow-x-hidden w-full 2xl:w-9/10 2xl:mx-auto px-4 md:px-8 py-6 bg-gray-main shadow-md" style="border-radius: 15px">

               <div class="w-full">

                  <div class="flex flex-col w-full">

                     <MainTitle
                        :content="main_titles[1]"
                        key="0"
                     ></MainTitle>

                     <MajorArticles> </MajorArticles>

                  </div>

               </div>

               <div class="mt-16 flex flex-col items-center justify-center 2xl:max-w-4/5 mx-auto w-full">
                     
                  <MainTitle
                     :content="main_titles[2]"
                     key="1"
                  ></MainTitle>

                  <!-- <Timeline></Timeline> -->

                  <div class="flex flex-col items-center justify-center w-full mt-16">

                     <Timeline
                        v-for="(t, i) in timeline"
                        :key="i"
                        icon="code"
                        :title="t.title"
                        :date="t.date"
                     ></Timeline>

                  </div>

               </div>

               <div class="mt-16 2xl:max-w-4/5 mx-auto">
                     
                  <MainTitle
                     :content="main_titles[3]"
                     key="2"
                  ></MainTitle>

                  <ImportantArticles></ImportantArticles>

               </div>

               <DigestList> </DigestList>

            </div>

         </div>

      </div>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue, Watch } from "nuxt-property-decorator";
   import Navbar from '../components/navbar/Navbar.vue';
   import MajorArticles from '../components/article/MajorArticles.vue';
   import ImportantArticles from '../components/article/ImportantArticles.vue';
   import DigestList from '../components/digest/DigestList.vue';
   import Timeline from '../components/timeline/Timeline.vue';
   import MainTitle from '../components/other/MainTitle.vue';

   import { vxm } from '../store';
   import { LangUtil } from "../scripts/lang/utils";
   import { Lang } from '../scripts/lang/lang';

   @Component({
      name: "index",
      components: {
         Navbar,
         MajorArticles,
         ImportantArticles,
         DigestList,
         Timeline,
         MainTitle,
      },
   })
   export default class index extends Vue {

      timeline = [

            {
                title: 'Narodziny Mikołaja Kopernika w Toruniu.',
                date: '19 lutego 1473',
            },
            {
                title: 'Kopernik kończy studia na Akademii Krakowskiej.',
                date: '1495',
            },
            {
                title: 'Rozpoczyna studia prawnicze na Uniwersytecie w Bolonii.',
                date: '1496',
            },
            {
                title: 'Kopernik obejmuje kanonię warmińską.',
                date: '20 października 1497',
            },
            {
                title: 'Mikołaj Kopernik otrzymuje zgodę kapituły warmińskiej na dokończenie studiów. Dodatkowo rozpoczyna studia medyczne w Padwie.',
                date: '1501',
            },
            {
                title: 'Astronom uzyskuje dyplom doktora prawa kanonicznego i kończy drugi rok studiów medycznych, co daje mu prawo wykonywania praktyk lekarskich.',
                date: '1503',
            },
            {
                title: 'Pobyt na dworze biskupa warmińskiego w Lidzbarku Warmińskim.',
                date: '1504-1509',
            },
            {
                title: 'Kopernik przenosi się do Fromborka.',
                date: '1510',
            },
            {
                title: 'Na apel Soboru Laterańskiego astronom tworzy projekt reformy kalendarza.',
                date: '1513',
            },
            {
                title: 'Kopernik jest administratorem dóbr kapituły rezydującym w Olsztynie.',
                date: '1516–1519',
            },
            {
                title: 'Po wybuchu wojny polsko-krzyżackiej Kopernik uczestniczy w poselstwie do wielkiego mistrza krzyżackiego.',
                date: '1520',
            },
            {
                title: 'Astronom zostaje komisarzem Warmii, który ma dokonać rewindykacji zagrabionych przez Zakon posiadłości warmińskich.',
                date: '1521',
            },
            {
                title: 'Kopernik na Sejmie Stanów Pruskich w Grudziądzu występuje z mową „Skarga kapituły na mistrza Albrechta i jego zakon z powodu krzywd wyrządzonych w 1521 r. podczas zawieszenia broni”.',
                date: '18 marca 1522',
            },
            {
                title: 'Kopernik przez osiem miesięcy sprawuje urząd administratora biskupstwa warmińskiego.',
                date: '1523',
            },
            {
                title: 'Astronom pełni urząd kanclerza kapituły.',
                date: '1524–1525',
            },
            {
                title: 'Powstaje ostateczna wersja traktatu „Rozprawa o urządzeniu monety”.',
                date: '1526',
            },
            {
                title: 'Kopernik po raz ostatni jest kanclerzem kapituły warmińskiej.',
                date: '1529',
            },
            {
                title: 'Astronom staje się jednym z czterech kandydatów na biskupa warmińskiego.',
                date: '1537',
            },
            {
                title: 'Kopernik oddaje dzieło „O obrotach sfer niebieskich” do druku w Norymberdze.',
                date: '1542',
            },
            {
                title: 'Śmierć Mikołaja Kopernika we Fromborku.',
                date: '1543',
            },

        ]

      main_titles = [

          { subtitle: ' ', title: this.current_lang.blog_about_copernicus, paragraph: this.current_lang.main_title_paragraph },
          { subtitle: ' ', title: this.current_lang.main_articles, paragraph: ' ' },
          { subtitle: ' ', title: this.current_lang.timeline, paragraph: this.current_lang.timeline_paragraph },
          { subtitle: ' ', title: this.current_lang.featured_articles, paragraph: ' ' },

      ];

      @Watch('current_lang')
      setMainTitles() {

          this.main_titles[0].title = this.current_lang.blog_about_copernicus;
          this.main_titles[0].paragraph = this.current_lang.main_title_paragraph;

          this.main_titles[1].title = this.current_lang.main_articles;

          this.main_titles[2].title = this.current_lang.timeline;
          this.main_titles[2].title = this.current_lang.timeline_paragraph;

          this.main_titles[3].title = this.current_lang.featured_articles;

      }

      get current_lang() {

         return vxm.lang.getCurrentLangStrings;

      }

      mounted() {

         let language = LangUtil.getLanguageCookie();
      
         let set_lang = vxm.lang.getCurrentLang;
      
         if(set_lang.id != language) {

            vxm.lang.setLang(language);
      
         }

         this.$nextTick(() => {

            this.$nuxt.$loading.finish();

         });

      }

      destroyed() {

         this.$nuxt.$loading.start();

      }

   }

</script>