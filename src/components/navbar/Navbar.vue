<template>

   <header class="inset-x-0 top-0 sm:flex sm:justify-between sm:items-center relative h-20 px-4 bg-gray-secondary leading-tight shadow-navbar z-40">

      <div class="flex-auto flex items-center justify-between h-full space-x-3 py-3 px-3 sm:p-0">
         
         <div class="flex-0 flex items-center justify-center w-10 h-10">
            <!-- <img src="" class="w-full h-full object-cover h-14">  -->
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
               :current="lang_current"
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
            :current="lang_current"
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

   import { Component, Prop, Watch, Vue } from 'nuxt-property-decorator';
    import { vxm } from '../../store';
    import { LangUtil } from "../../scripts/lang/utils";
   
   import NavbarLink from './navbar/NavbarLink.vue';
   import SelectMenu from '../other/SelectMenu.vue';

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
         { to: '/admin', content: this.lang_current_strings.admin_menu },
         { to: '/categories', content: this.lang_current_strings.all_articles },
      ];

      lang_array = [
         { id: 0, name: 'ENG' },
         { id: 1, name: 'PL' },
      ];
      
      @Watch('lang_current_strings')
      setLinks() {

         this.links[0].content = this.lang_current_strings.admin_menu;
         this.links[1].content = this.lang_current_strings.all_articles;

      }

       beforeMount() {

           vxm.lang.setLang(Number(LangUtil.getLanguage()));

       }

      get lang_current() {

         return vxm.lang.getCurrentLang;

      }

      get lang_current_strings() {

         return vxm.lang.getCurrentLangStrings;

      }

      setLang(language) {

         vxm.lang.setLang(language.id);

      }
   }

</script>