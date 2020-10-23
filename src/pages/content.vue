<template>

    <div>

        <Navbar />

        <div class="main-container overflow-y-auto">

            <div class="main-title w-full h-88 bg-gray-500 shadow-lg">

                <div class="w-full h-full relative flex justify-center items-center">

                    <div class="absolute inset-0">

                        <img src="../img/banner.jpg" class="h-full w-full object-cover opacity-25" />

                    </div>

                </div>

            </div>

            <div v-if="article" class="article-content flex flex-col items-center lg:flex-row lg:items-start lg:justify-center p-5 sm:px-12 md:px-20 2xl:px-32">

                <div class="flex flex-col items-center w-full lg:w-3/5 2xl:w-2/5 relative lg:mr-10 -mt-88 xl:-mt-48 z-10">

                    <div class="article-content__img flex-0 flex flex-col items-center justify-end xl:absolute mb-6">

                        <slot name="editImg"></slot>

                        <transition name="fade-out">

                            <div v-if="article.picture_link && !addArticle" class="flex-auto flex items-center justify-center w-full mt-4 bg-gray-main overflow-hidden rounded-lg shadow cursor-pointer">

                                <img :src="article.picture_link" class="object-cover h-full w-full" />

                            </div>

                        </transition>

                    </div>

                    <span v-if="!editMode && !addArticle" class="block capitalize text-3xl lg:text-4xl font-bold tracking-tight leading-tight text-gray-200 my-4 md:my-2">
                        {{ article.title }}
                    </span>

                    <slot name="editTitle"></slot>

                    <div class="flex flex-col items-center w-full bg-gray-main relative p-5 xl:p-10 space-y-2 rounded-md shadow-lg">

                        <slot name="error"></slot>

                        <div v-if="!editMode && !addArticle" class="w-full h-full flex flex-col items-center">

                            <div v-for="(paragraph, i) in article.content"
                                 :key="i"
                                 class="text-justify text-sm xl:text-base leading-relaxed xl:leading-loose font-light text-gray-300">

                                <p> {{ paragraph }} </p>

                            </div>

                        </div>

                        <slot name="editContent"></slot>

                        <slot name="addCategory"></slot>

                        <div v-if="!addArticle" class="flex justify-center mt-5 w-full">

                            <div class="flex flex-col items-start max-w-9/10 bg-gray-tertiary rounded-lg px-4 py-2 shadow-md">

                                <div class="mt-2 w-full">

                                    <div class="text-xs font-light text-gray-400 text-right italic"> Date published: {{ article.timestamp }} </div>

                                </div>

                                <div class="flex items-center justify-center h-px w-full my-2">
                                    <div class="divider w-full h-full"></div>
                                </div>

                                <div v-if="!editMode" class="article-link flex items-center cursor-pointer">

                                    <font-awesome-icon :icon="['fas', 'hashtag']" class="h-4 w-4 fill-current text-purple-secondary" />

                                    <span v-if="article.category" class="article-header ml-2 text-gray-300 font-semibold lg:transition duration-300 ease">
                                        {{ article.category.name }}
                                    </span>

                                </div>

                                <slot name="editCategory"></slot>

                                <div class="flex items-center mt-2 mx-1 text-white hover:text-purple-secondary transition duration-300 ease cursor-pointer">

                                    <font-awesome-icon :icon="['fas', 'eye']" class="w-4 h-4 fill-current" />

                                    <div class="ml-2">

                                        <span class="text-sm font-light tracking-wide">Times viewed:</span>

                                        <span class="text-sm font-light tracking-wide"> {{ article.times_read }} </span>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <div v-if="editMode" class="md:absolute md:bottom-5 md:right-5 xl:bottom-10 xl:right-10 mt-4 md:mt-0">

                           <button @click="$emit('remove')" class="inline-flex items-center p-3 rounded-lg shadow bg-purple-secondary bg-opacity-25 hover:bg-opacity-75 transition duration-300 ease focus:outline-none">

                              <span class="inline-block md:hidden text-sm text-center font-medium text-white">
                                 Remove
                              </span>

                              <font-awesome-icon :icon="['fas', 'trash']" class="hidden md:inline-block w-4 h-4 fill-current text-white" />

                           </button>

                        </div>

                    </div>

                </div>

                <ArticleSidebar v-if="!addArticle && !editMode"
                                :categories="categories"
                                :articles="popular_articles"></ArticleSidebar>

            </div>

            <Footer />

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from "nuxt-property-decorator";
    import { vxm } from '../store';

    import ArticleSidebar from '../components/article/ArticleSidebar.vue';
    import Navbar from '../components/navbar/Navbar.vue';
    import Footer from '../components/navbar/Footer.vue';

    @Component({
        name: "contentPage",
        components: {
            ArticleSidebar,
            Navbar,
            Footer,
        },
    })
    export default class contentPage extends Vue {

        @Prop({ default: false }) private editMode?: boolean;
        @Prop({ default: false }) private addArticle?: boolean;

        async beforeMount() {

            if (!this.addArticle) {

                if (this.$route.name == "article_user_view") {

                    vxm.articles.fetchArticle({ article_id: this.$route.params.id, stealth: false });

                } else {

                    vxm.articles.fetchArticle({ article_id: this.$route.params.id, stealth: true });

                }

            }

        }

        get article() {

            return vxm.articles.getUtil.article;

        }

        get categories() {

            return vxm.articles.getUtil.categories;

        }

        get popular_articles() {

            return vxm.articles.getUtil.popular_articles;

        }

    }

</script>