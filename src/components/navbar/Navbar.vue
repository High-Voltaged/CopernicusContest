<template>

   <header class="bg-gray-secondary z-50 inset-x-0 top-0 px-4 sm:flex sm:justify-between sm:items-center relative h-20 leading-tight shadow-navbar">

      <div class="flex-auto flex items-center justify-between h-full space-x-3 py-3 px-3 sm:p-0">
         
         <div class="flex-0 flex items-center justify-center w-10 h-10">
            <img src="/logo.png" class="w-full h-full object-cover h-14"> 
         </div>

         <div class="md:hidden flex items-center justify-end space-x-4">        

            <div>
               
               <button @click="isOpen = !isOpen" type="button" class="block relative text-gray-200 focus:outline-none">
            
                  <div class="h-5 w-5 fill-current">
         
                     <font-awesome-icon :icon="['fas', 'bars']" v-if="!isOpen" />
         
                     <font-awesome-icon :icon="['fas', 'times']" v-if="isOpen" />
         
                  </div>
            
               </button>
            
            </div>
            
            <SelectMenu
               :current="lang_array[current_language]"
               :options="lang_array"
               :width="'w-24'"
               @input="setLang($event)"
               :color="'bg-gray-tertiary'"
               :border="'gray-secondary'"
            ></SelectMenu>      

         </div>

      </div>

      <div class="hidden md:flex items-center space-x-6 h-full mr-2">

         <div class="flex items-center bg-transparent z-50">

            <div class="flex items-center relative space-x-2">
            
               <NavbarLink
                  v-for="(link, index) in links"
                  :key="index"
                  :link="link"
               ></NavbarLink>

            </div>

         </div>

         <SelectMenu
            :current="lang_array[current_language]"
            :options="lang_array"
            width="w-24"
            @input="setLang($event)"
            :color="'bg-gray-tertiary'"
            :border="'gray-secondary'"
         ></SelectMenu>  

      </div>

      <transition name="fade-out">

         <div 
            v-if="isOpen"
            class="absolute inset-x-0 top-full mx-2 shadow-md bg-gray-tertiary z-50" 
            style="border-radius: 0 0 15px 15px"
         >
   
            <div class="flex flex-col items-center w-full relative space-y-4 p-3">
            
               <NavbarLink
                  v-for="(link, index) in links"
                  :key="index"
                  :link="link"
               ></NavbarLink>

            </div>

         </div>
         
      </transition>

   </header>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import { vxm } from '../../store';
   
   import NavbarLink from './navbar/NavbarLink.vue';
    import SelectMenu from '../other/SelectMenu.vue';
    import { LangUtil } from "../../scripts/lang/utils";
import { LangEnum } from '../../scripts/lang/enum';

   @Component({
      name: "Navbar",
      components: {
         NavbarLink,
         SelectMenu
      }
   })
   export default class Navbar extends Vue {

      isOpen = false;

      links = [
         { to: '/admin', content: 'Admin menu' },
         { to: '/categories', content: 'All articles' },
         { to: '', content: 'Other' },
      ];

       current_language: LangEnum;

      lang_array = [
         { id: 0, name: 'ENG' },
         { id: 1, name: 'PL' },
      ];
      
      get lang_current() {

         return vxm.lang.getCurrentLang;

      }

      get lang_current_strings() {

         return vxm.lang.getCurrentLangStrings;

      }

      setLang(language) {

         console.log(language);

         vxm.lang.setLang(language.id);

      }

      beforeMount() {

           this.current_language = LangUtil.getLanguage();

       }


   }

</script>