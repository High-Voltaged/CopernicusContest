<template>

    <div v-if="digest_list.length > 0">

        <div class="card-digest mdMax:overflow-x-auto flex mt-16 rounded-md">

            <div class="digest-header bg-purple-secondary rounded-lg px-6 md:px-10 py-5 mt-12 flex items-end md:min-w-56 h-100 capitalize font-light text-2xl md:text-3xl text-gray-200 transform rotate-180 md:rotate-0">

                <span>Other articles</span>

            </div>

            <div class="card-container flex md:overflow-x-hidden md:max-w-full">

                <div class="flex md:overflow-x-auto">

                    <div class="flex p-12">

                        <div class="digest -ml-4 md:-ml-32 2xl:-ml-24 transition-card transition duration-300 ease" v-for="digest in digest_list">

                            <DigestItem :digest="digest"></DigestItem>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import ApiUtils from '../../scripts/api_utils';
    import IBriefArticle from "../../../interfaces/brief_article";
    import DigestItem from './digest_item.vue';

    @Component({
        name: "DigestList",
        components: {
            DigestItem,
        }
    })
    export default class DigestList extends Vue {

        digest_list: IBriefArticle[] = [];

        async beforeMount() {

            let articles = await ApiUtils.fetchDigest();

            for (let i = 0; i < articles.length; ++i) {

                this.digest_list.push({
                    ID: articles[i].id, Title: articles[i].title, PictureLink: articles[i].picture_link, ShortDescription: articles[i].content,
                    TimesRead: articles[i].times_read, Timestamp: articles[i].timestamp,
                });

            }

        }

    }

</script>