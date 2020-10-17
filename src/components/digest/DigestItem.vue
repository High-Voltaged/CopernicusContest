<template>

    <div v-if="article">

        <div @click="goToArticle" class="bg-gray-tertiary rounded-lg p-5 flex flex-col justify-between min-w-72 h-100 shadow-black cursor-pointer">

            <div class="w-full">
                
                <span class="capitalize text-xl font-bold tracking-tight leading-tight text-gray-200"> {{ article.title }} </span>

                <p class="para-descript overflow-hidden mt-1 text-sm tracking-wide text-gray-300">
                    {{ article.content }}
                </p>

            </div>

            <div class="w-full">

                <div class="flex items-center w-full">

                    <div class="card-digest-image rounded overflow-hidden transition duration-300 ease">
                        <img :src="article.picture_link" class="object-cover h-56 w-full" />
                    </div>

                </div>

                <div>

                    <div class="flex items-center m-1 mt-2 text-white w-full">
                        
                        <font-awesome-icon :icon="['fas', 'eye']" class="w-3 h-3 flex-shrink-0 fill-current" />
                        
                        <div class="ml-2 flex items-center">
                            <span class="text-xs font-light tracking-wide">Times viewed:</span>
                            <span class="ml-1 text-xs font-light tracking-wide"> {{ article.times_read }} </span>
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

        goToArticle(): void {

            this.$router.push("/article/" + this.article.id);

        }

    }

</script>