<template>

    <div v-if="categories.length > 0">

        <div class="w-full md:w-3/4 lg:w-3/5 2xl:w-2/5 mx-auto my-8 px-5 md:px-0 z-10">

            <div class="article-sort bg-gray-main p-3 md:p-5 xl:p-10 rounded-md shadow-lg flex flex-col">

                <div 
                  v-for="category in categories"
                  :key="category.id"   
               >

                  <CategoryItem :category="category"></CategoryItem>

                </div>

            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import CategoryItem from './category.vue';
    import APIWrapper from "../../../scripts/api_wrapper";
import ICategory from '../../../../interfaces/category';

    @Component({
        name: "CategoriesList",
        components: {
            CategoryItem,
        }
    })
    export default class QuizAnswersContainer extends Vue {

        categories: ICategory[] = [];

        async beforeMount() {

            if (this.$route.params.id != undefined) {

                this.categories = await APIWrapper.fetchCategory(Number(this.$route.params.id));

            } else {

                this.categories = await APIWrapper.fetchCategories();


            }

            console.log(this.categories.length > 0);

        }

    }

</script>