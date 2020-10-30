<template>

<div class="footer-styling inset-x-0 bottom-0 mt-16 shadow-footer">

   <div class="flex flex-col items-center lg:items-stretch lg:flex-row lg:justify-between xl:justify-evenly lg:px-10 lg:py-10 px-3 py-8">

      <div class="flex flex-col items-center">

         <div class="h-14">
            <img src="/logo.png" class="h-full object-scale-down"> 
         </div>

         <div class="flex items-center space-x-2">
               
            <FooterIcon
               v-for="(icon, index) in icons"
               :key="index"
               :icon="icon"
            ></FooterIcon>

         </div>

      </div>

      <div class="sub-transparent-xs top-0 left-1/20 right-1/20 h-px flex justify-center items-center my-6 lg:hidden"></div>

      <div class="flex flex-col items-center sm:items-stretch lg:p-0 py-2">

         <span class="inline-block text-gray-200 font-bold uppercase text-xl tracking-wider p-0 lg:px-5 lg:text-left text-center my-2 lg:my-0">
            Support
         </span>

         <div class="flex flex-wrap flex-col items-center sm:flex-row sm:justify-evenly lg:flex-col lg:items-start xl:text-lg">
               
            <FooterLink
               v-for="(link, index) in primary_links"
               :key="index"
               :link="link"
            ></FooterLink>

         </div>

      </div>

      <div class="sub-transparent-xs top-0 left-1/20 right-1/20 h-px flex justify-center items-center my-6 lg:hidden"></div>

      <div class="flex flex-col items-center sm:items-stretch lg:p-0 py-2">

         <span class="inline-block text-gray-200 font-bold uppercase text-xl tracking-wider p-0 lg:px-5 lg:text-left text-center my-2 lg:my-0">
            Our website
         </span>

         <div class="flex flex-wrap flex-col items-center sm:flex-row sm:justify-evenly lg:flex-col lg:items-start xl:text-lg">
               
            <FooterLink
               v-for="(link, index) in secondary_links"
               :key="index"
               :link="link"
            ></FooterLink>

         </div>

      </div>

      <div class="sub-transparent-xs top-0 left-1/20 right-1/20 h-px flex justify-center items-center my-6 lg:hidden"></div>

      <div class="flex justify-center items-center lg:p-0 py-2">

         <button type="button" class="button-footer bg-purple-secondary border-2 border-purple-secondary flex items-center px-6 py-3 2xl:py-4 2xl:px-8 rounded-md shadow-md lg:transition duration-300 ease hover:bg-transparent focus:outline-none">
               
            <router-link to="/quiz">

               <span class="font-semibold tracking-wide text-gray-200 cursor-pointer pr-2 xl:text-lg">
                  Take A Quiz Here
               </span> 

            </router-link>
               
            <span class="arrow-icon w-3 h-3 lg:transition duration-300 ease">
               <font-awesome-icon :icon="['fas', 'arrow-right']" class="w-full h-full fill-current text-gray-200"/>
            </span>
         
         </button>

      </div>

   </div>
   
</div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import FooterIcon from './footer/FooterIcon.vue';
   import FooterLink from './footer/FooterLink.vue';

   @Component({
      name: "Footer",
      components: {
         FooterIcon,
         FooterLink,
      }
   })

   export default class Footer extends Vue {

      icons = ['instagram', 'twitter', 'facebook', 'youtube'];

      primary_links = [

         { to: '', content: 'Contact us' },
         { to: '', content: 'Join our team' },
         { to: '', content: 'FAQ' },
         { to: '', content: 'Share' },

      ];

      secondary_links = [

         { to: '', content: 'About the project' },
         { to: '', content: 'Top 10 articles' },
         { to: '', content: 'Major resources' },
         { to: '', content: 'More info' },

      ]

   }
</script>