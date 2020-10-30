<template>

   <header class="bg-gray-secondary z-50 inset-x-0 top-0 px-4 sm:flex sm:justify-between sm:items-center relative h-20 space-x-2 leading-tight shadow-navbar">

      <div class="flex items-center py-3 px-3 justify-between sm:p-0">
         
         <div>
            <img src="/logo.png" class="object-cover h-14"> 
         </div>

         <div class="sm:hidden">
            
            <button @click="isOpen = !isOpen" type="button" class="block relative text-gray-200 focus:outline-none">
         
               <div class="h-5 w-5 fill-current">
      
                  <font-awesome-icon :icon="['fas', 'bars']" v-if="!isOpen" />
      
                  <font-awesome-icon :icon="['fas', 'times']" v-if="isOpen" />
      
               </div>
         
            </button>
         
         </div>

      </div>

      <div class="hidden sm:block shadow-md sm:shadow-none bg-gray-tertiary sm:bg-transparent z-50">

         <div class="flex flex-col items-start sm:flex-row sm:items-center relative space-x-2">
         
            <NavbarLink
               v-for="(link, index) in links"
               :key="index"
               :link="link"
            ></NavbarLink>

         </div>

      </div>

      <transition name="fade-out">

         <div 
            v-if="isOpen"
            class="shadow-md sm:shadow-none bg-gray-tertiary sm:bg-transparent z-50" 
            style="border-radius: 0 0 15px 15px"
         >
   
            <div class="flex flex-col items-start sm:flex-row sm:items-center relative space-y-4 p-3">
            
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
   import NavbarLink from './navbar/NavbarLink.vue';

   @Component({
      name: "Navbar",
      components: {
         NavbarLink,
      }
   })
   export default class Navbar extends Vue {

      isOpen = false;

      links = [
         { to: '/admin', content: 'Admin menu' },
         { to: '/categories', content: 'All articles' },
         { to: '', content: 'Other' },
      ]

   }

</script>