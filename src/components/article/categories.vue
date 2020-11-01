<template>

   <div v-if="categories.length > 0" class="category-container flex flex-col lgMax:items-center">

      <span class="block text-gray-200 text-xl xl:text-2xl font-semibold lgMax:text-center my-2">Random categories</span>

      <div class="sub-category-container flex flex-wrap lgMax:justify-evenly lg:flex-col w-full">

            <div 
            v-for="(category, i) in categories"
            :key="i"
            class="inline-flex lg:block items-center px-3 py-2 m-4 lg:mx-0 bg-gray-secondary bg-opacity-0 hover:bg-opacity-100 transition duration-200 ease cursor-pointer"
            style="border-radius: 10px" 
         >

            <Category :category="category"></Category>

         </div>

      </div>

   </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import Category from './Category.vue';

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