<template>

   <div class="container-w-dot min-h-48 max-h-48 flex-shrink-0 w-full sm:w-1/2 lg:w-1/3 xl:w-1/4 2xl:w-1/6 px-3">
      
      <div class="mt-6 relative text-xs leading-tight tracking-wider font-light">
      
         <div class="dot absolute rounded-full z-10 cursor-pointer transform hover:scale-125 transition duration-300 linear bg-gray-tertiary shadow-lg flex items-center justify-center">
   
            <div class="sub-dot rounded-full z-20 cursor-pointer bg-white"></div>
   
         </div>

         <div class="min-h-20 sub-container relative cursor-pointer rounded shadow-md px-6 py-4 transform hover:translate-y-8 transition duration-300 linear max-h-130px">
   
            <div class="arrow block absolute bottom-full "></div>

            <div class="content max-h-98px overflow-y-hidden">
   
               <span class="text-2xl capitalize">
                  {{ content.title }}
               </span>
   
               <p>
                  {{ content.info }}
               </p>
   
            </div>
   
         </div>
      
      </div>
   
   </div>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';

   @Component({
      name: "TimelineItem",
   })
   export default class TimelineItem extends Vue {

      @Prop() private content;

   }

</script>