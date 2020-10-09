<template>

   <div class="mt-16 max-w-full w-full flex-shrink-0 flex justify-center relative">
      
      <div class="relative w-full h-full">

         <div class="timeline mx-auto flex h-full w-9/10 justify-center overflow-x-hidden">
            
            <div class="timeline-container my-4 flex justify-between w-full h-full relative text-gray-200 transition duration-200 ease-in transform">

               <TimelineItem
                  v-for="(item, index) in items"
                  :key="index"
                  :content="item"
               ></TimelineItem>                  

            </div>
         
         </div>

         <div class="manage-sliders">
               
            <div class="disabled-slider slider slider1 absolute rounded-full bg-gray-tertiary z-20 flex items-center justify-center">
               <span class="w-5 h-5">
                  <font-awesome-icon :icon="['fas', 'angle-left']" class="w-full h-full fill-current text-gray-secondary" />
               </span>
            </div>

            <div class="slider slider2 absolute rounded-full bg-gray-tertiary z-20 flex items-center justify-center hover:shadow-solid transition duration-300 linear cursor-pointer">
               <span class="w-5 h-5">
                  <font-awesome-icon :icon="['fas', 'angle-right']" class="w-full h-full fill-current text-white" />
               </span>
            </div>

         </div>

      </div>

   </div>


</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   //import TimelineItem from './TimelineItem.vue';

   @Component({
      name: "Timeline",
      components: {
         //TimelineItem,
      }
   })
   export default class Timeline extends Vue {

      items = [
         
         { title: 'Stuff', info: 'Some content in here, Some content in here' },
         { title: 'More Stuff', info: 'Some content in here' },
         { title: 'Interesting', info: 'Some content in here' },
         { title: 'Stuff here', info: 'Some content in here' },
         { title: 'Other stuff', info: 'Some content in here' },
         { title: 'Something', info: 'Some content in here' },

      ]

   }

</script>