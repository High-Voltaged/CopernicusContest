<template>

   <div v-if="category" class="category-selected relative w-full">

      <div :class="{ 'space-y-4': editMode }" class="flex flex-col items-center justify-center w-full space-y-2 bg-gray-main rounded-md">
      
         <router-link v-if="!editMode" :to="`/category/${category.id}`" tag="div" class="flex items-center justify-center w-full py-1"> 
            
            <span class="capitalize text-2xl text-center font-bold tracking-tight leading-tight text-gray-200">
               {{ category.name }}
            </span>

         </router-link>

         <div v-else-if="(edit_menu == 0) && editMode" class="flex items-center justify-center w-full py-1">

            <span class="capitalize text-2xl text-center font-bold tracking-tight leading-tight text-gray-200">
               {{ category.name }}
            </span>

         </div>

         <div v-if="(edit_menu == 1) && editMode" class="flex items-center justify-center w-full">

            <slot name="input"></slot>

         </div>

         <div v-if="editMode" class="flex flex-col items-center space-y-4 w-full">

            <div class="inline-flex items-center space-x-2">

               <span class="text-sm text-left text-gray-200 font-semibold tracking-wide">
                  Number of articles:
               </span>

               <span class="text-sm text-left text-gray-200 font-semibold tracking-wide">
                  120
               </span>

            </div>

            <button v-if="edit_menu == 0" @click="$emit('edit')" class="md:absolute md:right-2 md:top-2 flex items-center justify-center px-6 md:px-3 py-2 rounded-lg bg-gray-primary bg-opacity-75 hover:bg-opacity-100 transition duration-300 ease focus:outline-none">
                  
               <span class="text-sm text-gray-200 font-semibold tracking-wider text-left">
                  Edit
               </span>

            </button>

         </div>

      </div>

      <div v-if="(edit_menu == 0) || !editMode" class="relative h-px my-4">

         <div class="divider absolute top-0 inset-x-0 h-px flex justify-center items-center"></div>

      </div>

      <CategoryArticles v-if="!editMode" :category_id="category.id"> </CategoryArticles>

   </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import { vxm } from '../../../store';

    import CategoryArticles from '../articles/CategoryArticles.vue';

    @Component({
        name: "CategoryItem",
        components: {
            CategoryArticles,
        }
    })
    export default class CategoryItem extends Vue {

        @Prop() private category;
        @Prop() private edit_menu?: number;

        get editMode() {

           return vxm.categories.getMainUtil.editMode;

        }

        get categories() {

            return vxm.categories.getMainUtil.categories;

         }

         get current() {

            return vxm.categories.getMainUtil.current;

         }
         
    }

</script>