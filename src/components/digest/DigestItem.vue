<template>

    <div v-if="article">

        <div @click="goToArticle" class="flex flex-col justify-between min-w-72 h-100 p-5 space-y-2 bg-gray-tertiary shadow-black cursor-pointer" style="border-radius: 10px">

            <div class="w-full">
                
               <span class="capitalize text-xl font-semibold tracking-tight leading-tight text-gray-200"> 
                  {{ article.title }} 
               </span>

               <p v-html="article_content" class="para-descript overflow-hidden mt-1 text-sm tracking-wide text-gray-300"></p>

            </div>

            <div class="w-full">

                <div class="flex items-center w-full">

                    <div class="card-digest-image w-full h-50 rounded overflow-hidden transition duration-300 ease">
                        <img :src="article.picture_link" class="object-cover w-full h-full" />
                    </div>

                </div>

                <div>

                    <div class="flex items-center m-1 mt-2 text-white w-full">
                        
                        <font-awesome-icon :icon="['fas', 'eye']" class="w-3 h-3 flex-shrink-0 fill-current" />
                        
                        <div class="ml-2 flex items-center">
                            <span class="text-xs">Times viewed:</span>
                            <span class="ml-1 text-xs"> {{ article.times_read }} </span>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import IBriefArticle from "../../../interfaces/brief_article";

    @Component({
        name: "DigestItem",
    })
    export default class DigestItem extends Vue {

        @Prop() private article: IBriefArticle;

         get article_content() {

            return this.article.content + '...';

         }

        goToArticle(): void {

            this.$router.push("/article/" + this.article.id);

        }

    }

</script>