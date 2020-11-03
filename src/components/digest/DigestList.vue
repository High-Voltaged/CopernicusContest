<template>

    <div v-if="articles.length > 0">

        <div class="card-digest mdMax:overflow-x-auto flex mt-16 rounded-md">

            <div class="digest-header flex items-end md:min-w-56 h-100 px-6 md:px-10 py-5 mt-12 bg-purple-secondary transform rotate-180 md:rotate-0" style="border-radius: 10px">

               <span class="capitalize font-medium text-2xl md:text-3xl text-gray-200">
                  {{ current_lang.other_articles }}
               </span>

            </div>

            <div class="card-container flex md:overflow-x-hidden md:max-w-full">

                <div class="flex md:overflow-x-auto">

                    <div class="flex p-12">

                        <div 
                           v-for="(article, i) in articles"
                           :key="i"
                           class="digest -ml-4 md:-ml-32 2xl:-ml-24 transition-card transition duration-300 ease" 
                        >

                           <DigestItem :article="article"></DigestItem>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import ApiWrapper from '../../scripts/api_wrapper';
   import { vxm } from '../../store';

    import IBriefArticle from "../../../interfaces/brief_article";
    import DigestItem from './DigestItem.vue';

    @Component({
        name: "DigestList",
        components: {
            DigestItem,
        }
    })
    export default class DigestList extends Vue {

        articles: IBriefArticle[] = [];

         get current_lang() {

            return vxm.lang.getCurrentLangStrings;

         }

        async beforeMount() {

            this.articles = await ApiWrapper.fetchDigest();

        }

    }

</script>