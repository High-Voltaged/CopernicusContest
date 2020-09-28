<template>

    <div if="categories.length > 0">

        <div class="category-container flex flex-col lgMax:items-center">

            <span class="block text-gray-200 text-xl xl:text-2xl tracking-wide font-semibold lgMax:text-center my-2">Random categories</span>

            <div class="sub-category-container flex flex-wrap lgMax:justify-evenly lg:flex-col w-full">

                <div class="px-2 py-1 lg:py-2 m-2 lg:mx-0 text-gray-300 leading-tight font-light rounded lg:block" v-for="category in categories">

                    <Category :category="category"></Category>

                </div>

            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import Category from './category.vue';

    @Component({
        name: "Categories",
        components: {
            Category,
        }
    })
    export default class Categories extends Vue {

        @Prop() private categories;

    }

</script>