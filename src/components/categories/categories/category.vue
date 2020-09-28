<template>

    <div v-if="category">

        <div class="category-selected mx-2">

            <div class="capitalize text-2xl text-center font-bold tracking-tight leading-tight text-gray-200 my-4 md:my-2">
            <a :href="'/category/' + category.id"> {{ category.name }}</a>
            </div>

            <div class="relative h-px my-4">

                <div class="divider absolute top-0 inset-x-0 h-px flex justify-center items-center">
                </div>

            </div>

            <CategoryArticles :category_id="category.id"> </CategoryArticles>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import CategoryArticles from '../articles/articles.vue';

    @Component({
        name: "CategoryItem",
        components: {
            CategoryArticles,
        }
    })
    export default class CategoryItem extends Vue {

        @Prop() private category;

    }

</script>