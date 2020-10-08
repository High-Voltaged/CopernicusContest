<template>
   
   <button @click="$emit('click')" class="notification-content inline-block absolute bottom-4 flex items-center justify-center w-full bg-transparent z-50 overflow-x-hidden focus:outline-none">

      <div class="flex items-center justify-center relative w-30 min-h-20 px-4 py-2 shadow rounded-lg bg-gray-secondary">

         <div class="text-center text-sm font-medium text-white">

            {{ content }}

         </div>

         <div class="absolute right-2 top-2 inline-flex items-center justify-center rounded-full p-1 bg-red-primary transform transition duration-300 ease hover:scale-125">

            <font-awesome-icon :icon="['fas', 'times']" class="w-2 h-2 fill-current text-white" />

         </div>

      </div>

   </button>

</template>

<script lang="ts">
   
   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import ApiUtils from '../../scripts/api_utils';
   import { vxm } from '../../store';

   @Component({
      name: "Notification",
   })

   export default class Notification extends Vue {

      @Prop() private content;

   }   

</script>