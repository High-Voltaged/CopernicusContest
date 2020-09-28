<template>

    <div v-if="digest">

        <div @click="goToArticle" class="bg-gray-tertiary rounded-lg p-5 flex flex-col justify-between min-w-72 h-100 shadow-black cursor-pointer">

            <div class="w-full">
                
                <span class="capitalize text-xl font-bold tracking-tight leading-tight text-gray-200"> {{ digest.Title }} </span>

                <p class="para-descript overflow-hidden mt-1 text-sm tracking-wide text-gray-300"> 
                    <!-- {{ digest.ShortDescription }}... -->
                    stuff stuff stuff stuff stuff stuff stuff stuff stuff stuff stuff stuff stuff stuff stuff stuff stuff stuff stuff stuff 
                </p>

            </div>

            <div class="w-full">

                <div class="flex items-center w-full">

                    <div class="card-digest-image rounded overflow-hidden transition duration-300 ease">
                        <img src="https://images.unsplash.com/photo-1499678329028-101435549a4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" class="object-cover h-56 w-full" />
                    </div>

                </div>

                <div>

                    <div class="flex items-center m-1 mt-2 text-white w-full">
                        
                        <font-awesome-icon :icon="['fas', 'eye']" class="w-3 h-3 flex-shrink-0 fill-current" />
                        
                        <div class="ml-2 flex items-center">
                            <span class="text-xs font-light tracking-wide">Times viewed:</span>
                            <span class="ml-1 text-xs font-light tracking-wide"> {{ digest.TimesRead }} </span>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';

    @Component({
        name: "DigestItem",
    })
    export default class DigestItem extends Vue {

        @Prop() private digest;

        goToArticle(): void {

            this.$router.push("/article/" + this.digest.ID);

        }

    }

</script>