<template>

   <div class="fixed inset-0 flex justify-center h-full w-full max-h-screen overflow-y-auto overflow-x-hidden py-8 z-50">

         <div class="flex flex-col items-center relative w-19/20 sm:w-9/10 md:w-4/5 lg:w-2/3 xl:w-1/2 m-auto space-y-6 p-6 lg:p-8 bg-gray-main shadow-xl" style="border-radius: 15px">

            <div class="header flex items-center justify-center w-2/3">

               <span class="inline-block w-full text-center text-base text-white font-semibold">
                  {{ content }}
               </span>

            </div>

            <div class="content w-full">

               <div class="flex items-center justify-evenly w-full space-x-4">

                  <button
                     @click="$emit('cancel')"
                     class="flex items-center justify-center space-x-1 px-3 py-2 rounded-lg bg-transparent border-2 border-purple-secondary border-opacity-50 hover:border-opacity-100 transition duration-300 ease focus:outline-none">

                     <span class="text-sm text-gray-200 font-semibold text-left select-none">
                        {{ current_lang.cancel }}
                     </span>

                  </button>

                  <button
                     @click="$emit('continue')"
                     class="flex items-center justify-center space-x-1 px-3 py-2 rounded-lg bg-purple-secondary bg-opacity-50 hover:bg-opacity-100 transition duration-300 ease focus:outline-none">

                     <span class="text-sm text-gray-200 font-semibold text-left select-none">
                        {{ current_lang.continue_str }}
                     </span>

                  </button>

               </div>

            </div>

         </div>

   </div>

</template>

<script lang="ts">
   
   import { Component, Prop, Vue } from "nuxt-property-decorator";
   import { vxm } from '../../store';

   @Component({
      name: "VerificationDialog",
   })

   export default class VerificationDialog extends Vue {

      @Prop({ default: '' }) private content: string;

      get current_lang() {

         return vxm.lang.getCurrentLangStrings;

      }

   }   

</script>