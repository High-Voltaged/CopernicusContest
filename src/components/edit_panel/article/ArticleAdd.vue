<template>

    <div class="article-add-container relative">

        <ArticleContent :addArticle="true">

            <template #editTitle>

                <div class="flex items-end justify-between w-full">

                    <div class="flex-auto inline-block mx-2">

                        <input v-model="article.title" placeholder="Article's title" type="text" class="w-full md:w-48 xl:w-72 bg-gray-tertiary bg-opacity-75 text-sm py-2 px-3 overflow-hidden focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 15px 15px 0 0" />

                    </div>

                    <div class="inline-flex items-stretch space-x-2 ml-2 mr-2">

                        <button @click="cancelAddition" class="p-2 bg-red-600 bg-opacity-50 text-white text-center text-sm font-medium hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 10px 10px 0 0">
                            Cancel
                        </button>

                        <button @click="addArticle" class="p-2 bg-purple-secondary bg-opacity-50 text-white text-center text-sm font-medium hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 10px 10px 0 0">
                            Add article
                        </button>

                    </div>

                </div>

            </template>

            <template #editContent>

                <div class="w-full">
                    <textarea v-model="article.content" placeholder="Article's content" rows="10" class="w-full p-3 bg-gray-tertiary bg-opacity-75 text-sm overflow-y-auto overflow-x-hidden focus:outline-none resize-none" style="border-radius: 15px"></textarea>
                </div>

            </template>

            <template #addCategory>

                <div class="flex flex-col items-center w-full space-y-2">

                    <label class="text-sm text-gray-500">
                        Article's category
                    </label>

                    <SelectMenu :category="article.category"
                                @input="article.category = $event"
                                :color="'bg-gray-tertiary'"
                                :border="'gray-main'"></SelectMenu>

                </div>

            </template>

            <template #editImg>

                <input type="text"
                       v-model="article.picture_link"
                       placeholder="Article's picture src"
                       class="w-full bg-gray-tertiary bg-opacity-75 text-sm py-2 px-3 overflow-hidden focus:bg-opacity-100 transition duration-200 ease focus:outline-none"
                       style="border-radius: 15px" />

                <transition name="fade-out">

                    <div v-if="article.picture_link" class="flex-auto flex items-center justify-center w-full mt-4 bg-gray-main overflow-hidden rounded-lg shadow cursor-pointer">

                        <img :src="article.picture_link" ref="img" class="object-cover h-full w-full" />

                    </div>

                </transition>

            </template>

            <template #imgPlaceholder>

                <div class="img-placeholder absolute inset-0  flex items-center justify-center w-full h-full">

                    <font-awesome-icon :icon="['fas', 'plus']" class="w-10 h-10 fill-current text-white" />

                </div>

            </template>

            <template #error>

                <transition name="fade-out">

                    <div v-if="error.value" class="flex items-center justify-center w-full px-2 mb-2">

                        <span class="text-center text-sm font-medium text-red-primary">
                            {{ error.content }}
                        </span>

                    </div>

                </transition>

            </template>

        </ArticleContent>

        <transition name="fade-out">

            <Notification v-if="notif_on"
                          :content="notif_content"
                          @click="closeNotification" />

        </transition>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from "nuxt-property-decorator";
    import APIWrapper from '../../../scripts/api_wrapper';
    import { vxm } from '../../../store';
    import { Limits } from '../../../../app/limits';
    import ICategory from '../../../../interfaces/category';

    import ArticleContent from '../../../pages/content.vue';
    import Notification from '../Notification.vue';
    import SelectMenu from '../../other/SelectMenu.vue';

    @Component({
        name: "ArticleAdd",
        components: {
            ArticleContent,
            Notification,
            SelectMenu,
        }
    })

    export default class ArticleAdd extends Vue {

        article = {

            title: '',
            content: '',
            category: {
                id: -1,
                name: '',
            },
            picture_link: '',

        };

        beforeDestroy() {

            this.resetArticle();

            vxm.articles.setValidationError({ value: false, content: '' });

            this.notif_content = '';
            this.notif_on = false;

        }

        // Add Article / Cancel

        async addArticle(): Promise<void> {

            if (this.validateChanges() && this.validateTitle() && this.validateContent() && this.validatePicture()) {

                vxm.articles.setValidationError({ value: false, content: '' });

            } else {

                return;

            }

            this.notif_content = 'Your article will be saved and added.';
            this.notif_on = true;

            await APIWrapper.insertArticle(this.article);

            // console.log(result.data);

            this.resetArticle();

        }

        cancelAddition(): void {

            this.notif_content = 'Your article\'s content will be discarded.';
            this.notif_on = true;

            this.resetArticle();

        }

        resetArticle(): void {

            for (let i in this.article) {

                this.article[i] = '';

            }

        }


        // Validation

        get error() {

            return vxm.articles.getValidationError;

        }

        validateChanges(): boolean {

            for (let i in this.article) {

                if (!this.article[i] || ((i == 'category') && (!this.article[i].name))) {

                    vxm.articles.setValidationError({ value: true, content: 'Don\'t leave the input fields empty.' });
                    return false;

                }

            }

            vxm.articles.setValidationError({ value: false, content: '' });
            return true;

        }

        validateTitle(): boolean {

            if (this.article.title.length < Limits.min_title_length) {

                vxm.articles.setValidationError({ value: true, content: 'The article\'s title\'s length is too short.' });
                return false;

            } else if (this.article.title.length > Limits.max_title_length) {

                vxm.articles.setValidationError({ value: true, content: 'The article\'s title\'s length is too long.' });
                return false;

            } else {

                return true;

            }

        }

        validateContent(): boolean {

            if (this.article.content.length < Limits.min_content_length) {

                vxm.articles.setValidationError({ value: true, content: 'The article\'s content\'s length is too short.' });
                return false;

            } else if (this.article.title.length > Limits.max_content_length) {

                vxm.articles.setValidationError({ value: true, content: 'The article\'s content\'s length is too long.' });
                return false;

            } else {

                return true;

            }

        }

        validatePicture(): boolean {

            if (this.article.picture_link.length > Limits.max_picture_length) {

                vxm.articles.setValidationError({ value: true, content: 'The article\'s picture\'s link is invalid.' });
                return false;

            } else {

                return true;

            }

        }


        // Notification Config

        notif_on: boolean = false;
        notif_content: string = '';

        closeNotification(): void {

            this.notif_on = false;
            this.notif_content = '';

        }

    }

</script>
<template>

    <div class="article-add-container relative">

        <ArticleContent :addArticle="true">

            <template #editTitle>

                <div class="flex items-end justify-between w-full">

                    <div class="flex-auto inline-block mx-2">

                        <input v-model="article.title" placeholder="Article's title" type="text" class="w-full md:w-48 xl:w-72 bg-gray-tertiary bg-opacity-75 text-sm py-2 px-3 overflow-hidden focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 15px 15px 0 0" />

                    </div>

                    <div class="inline-flex items-stretch space-x-2 ml-2 mr-2">

                        <button @click="cancelAddition" class="p-2 bg-red-600 bg-opacity-50 text-white text-center text-sm font-medium hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 10px 10px 0 0">
                            Cancel
                        </button>

                        <button @click="addArticle" class="p-2 bg-purple-secondary bg-opacity-50 text-white text-center text-sm font-medium hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none" style="border-radius: 10px 10px 0 0">
                            Add article
                        </button>

                    </div>

                </div>

            </template>

            <template #editContent>

                <div class="w-full">
                    <textarea v-model="article.content" placeholder="Article's content" rows="10" class="w-full p-3 bg-gray-tertiary bg-opacity-75 text-sm overflow-y-auto overflow-x-hidden focus:outline-none resize-none" style="border-radius: 15px"></textarea>
                </div>

            </template>

            <template #addCategory>

                <div class="flex flex-col items-center w-full space-y-2">

                    <label class="text-sm text-gray-500">
                        Article's category
                    </label>

                    <SelectMenu :category="article.category"
                                @input="article.category = $event"
                                :color="'bg-gray-tertiary'"
                                :border="'gray-main'"></SelectMenu>

                </div>

            </template>

            <template #editImg>

                <input type="text"
                       v-model="article.picture_link"
                       placeholder="Article's picture src"
                       class="w-full bg-gray-tertiary bg-opacity-75 text-sm py-2 px-3 overflow-hidden focus:bg-opacity-100 transition duration-200 ease focus:outline-none"
                       style="border-radius: 15px" />

                <transition name="fade-out">

                    <div v-if="article.picture_link" class="flex-auto flex items-center justify-center w-full mt-4 bg-gray-main overflow-hidden rounded-lg shadow cursor-pointer">

                        <img :src="article.picture_link" ref="img" class="object-cover h-full w-full" />

                    </div>

                </transition>

            </template>

            <template #imgPlaceholder>

                <div class="img-placeholder absolute inset-0  flex items-center justify-center w-full h-full">

                    <font-awesome-icon :icon="['fas', 'plus']" class="w-10 h-10 fill-current text-white" />

                </div>

            </template>

            <template #error>

                <transition name="fade-out">

                    <div v-if="error.value" class="flex items-center justify-center w-full px-2 mb-2">

                        <span class="text-center text-sm font-medium text-red-primary">
                            {{ error.content }}
                        </span>

                    </div>

                </transition>

            </template>

        </ArticleContent>

        <transition name="fade-out">

            <Notification v-if="notif_on"
                          :content="notif_content"
                          @click="closeNotification" />

        </transition>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from "nuxt-property-decorator";
    import APIWrapper from '../../../scripts/api_wrapper';
    import { vxm } from '../../../store';
    import { Limits } from '../../../../app/limits';
    import ICategory from '../../../../interfaces/category';

    import ArticleContent from '../../../pages/content.vue';
    import Notification from '../Notification.vue';
    import SelectMenu from '../../other/SelectMenu.vue';

    @Component({
        name: "ArticleAdd",
        components: {
            ArticleContent,
            Notification,
            SelectMenu,
        }
    })

    export default class ArticleAdd extends Vue {

        article = {

            title: '',
            content: '',
            category: {
                id: -1,
                name: '',
            },
            picture_link: '',
            important: 0,

        };

        beforeDestroy() {

            this.resetArticle();

            vxm.articles.setValidationError({ value: false, content: '' });

            this.notif_content = '';
            this.notif_on = false;

        }

        // Add Article / Cancel

        async addArticle(): Promise<void> {

            if (this.validateChanges() && this.validateTitle() && this.validateContent() && this.validatePicture()) {

                vxm.articles.setValidationError({ value: false, content: '' });

            } else {

                return;

            }

            this.notif_content = 'Your article will be saved and added.';
            this.notif_on = true;

            await APIWrapper.insertArticle(this.article);

            // console.log(result.data);

            this.resetArticle();

        }

        cancelAddition(): void {

            this.notif_content = 'Your article\'s content will be discarded.';
            this.notif_on = true;

            this.resetArticle();

        }

        resetArticle(): void {

            for (let i in this.article) {

                this.article[i] = '';

            }

        }


        // Validation

        get error() {

            return vxm.articles.getValidationError;

        }

        validateChanges(): boolean {

            for (let i in this.article) {

                console.log(i);

                if (((i == 'category') && (!this.article[i].name))) {

                    vxm.articles.setValidationError({ value: true, content: 'Don\'t leave the input fields empty.' });

                    return false;

                }

            }

            vxm.articles.setValidationError({ value: false, content: '' });
            return true;

        }

        validateTitle(): boolean {

            if (this.article.title.length < Limits.min_title_length) {

                vxm.articles.setValidationError({ value: true, content: 'The article\'s title\'s length is too short.' });
                return false;

            } else if (this.article.title.length > Limits.max_title_length) {

                vxm.articles.setValidationError({ value: true, content: 'The article\'s title\'s length is too long.' });
                return false;

            } else {

                return true;

            }

        }

        validateContent(): boolean {

            if (this.article.content.length < Limits.min_content_length) {

                vxm.articles.setValidationError({ value: true, content: 'The article\'s content\'s length is too short.' });
                return false;

            } else if (this.article.title.length > Limits.max_content_length) {

                vxm.articles.setValidationError({ value: true, content: 'The article\'s content\'s length is too long.' });
                return false;

            } else {

                return true;

            }

        }

        validatePicture(): boolean {

            if (this.article.picture_link.length > Limits.max_picture_length) {

                vxm.articles.setValidationError({ value: true, content: 'The article\'s picture\'s link is invalid.' });
                return false;

            } else {

                return true;

            }

        }


        // Notification Config

        notif_on: boolean = false;
        notif_content: string = '';

        closeNotification(): void {

            this.notif_on = false;
            this.notif_content = '';

        }

    }

</script>