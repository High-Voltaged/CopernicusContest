<template>

    <div class="sidebar flex flex-col lgMax:items-center w-full lg:w-3/10 2xl:w-1/5 bg-gray-main p-5 rounded-md shadow-mdIn mt-16 lg:mt-0">

        <Categories :categories="categories"></Categories>

        <PopularArticles :articles="articles"></PopularArticles>
        
    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import PopularArticles from './PopularArticles.vue';
    import Categories from './Categories.vue';

    @Component({
        name: "ArticleSidebar",
        components: {
            PopularArticles,
            Categories,
        }
    })
    export default class ArticleSidebar extends Vue {

        @Prop() private categories;
        @Prop() private articles;

    }

</script>