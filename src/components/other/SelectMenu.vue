<template>
   
   <div class="select-menu relative w-48">
      
      <div class="w-full">

         <div :class="color" class="flex items-center bg-opacity-50 space-x-2 p-3" style="border-radius: 10px 10px 0 0">

            <input 
               v-if="current"
               v-model="current.name"
               @click="dropdownOn = !dropdownOn"
               readonly
               placeholder="Input your value" 
               class="flex-auto w-full bg-transparent text-sm text-white placeholder-gray-300 focus:outline-none cursor-pointer"
            />

            <button @click="dropdownOn = !dropdownOn" class="flex-0 inline-block w-3 h-3 focus:outline-none">

               <font-awesome-icon 
                  :icon="['fas', 'chevron-down']" 
                  class="w-full h-full fill-current text-white transition duration-300 ease" 
                  :class="{ 'transform rotate-180': dropdownOn }"
               />

            </button>

         </div>

      </div>

      <transition name="fade-out">

         <div v-if="dropdownOn" :class="color" class="select-menu__dropdown top-full absolute w-48 p-3 space-y-2" style="border-radius: 0 0 15px 15px">

            <button 
               v-for="c in categories"
               :key="c.id"
               :disabled="current == c"
               :class="[color, `hover:border-${border}`, `focus:bg-${border}`]"
               class="select-menu__cion inline-flex items-center w-full p-2 bg-transparent border-2 border-transparent transition duration-300 ease focus:outline-none" 
               style="border-radius: 10px"
               @click="changeValue(c)" 
            >
               
               <span class="inline-block w-full px-2 text-left text-sm text-gray-200 font-medium">
                  {{ c.name }}
               </span>

            </button>

         </div>

      </transition>

   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import ICategory from '../../../interfaces/category';
   import { APIWrapper } from '../../scripts/api_wrapper';

   @Component({
      name: "SelectMenu",
   })
   export default class SelectMenu extends Vue {
      
      @Prop({ default: 'bg-gray-secondary' }) private color: string;
      @Prop({ default: 'gray-tertiary' }) private border: string; 
         
      categories: ICategory[] = [];
      
      current = null;
      dropdownOn = false;

      async beforeMount() {

         this.categories = await APIWrapper.fetchCategories();
         this.current = this.categories[0];

      }

      changeValue(option): void {

         this.current = option;

         this.dropdownOn = false;

      }

   }

</script>