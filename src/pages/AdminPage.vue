<template>

    <div :class="(edit_menu == 0) ? 'bg-gray-primary' : 'bg-gray-secondary'" class="flex items-center justify-center overflow-y-auto h-screen w-screen py-6">

        <div v-if="edit_menu == 0" class="flex-auto flex flex-col items-center justify-center h-full py-3 bg-gray-primary">

            <AdminLogin @goToEdit="goToEdit()"></AdminLogin>

        </div>

        <div v-else-if="edit_menu == 1" class="flex-auto flex items-center justify-center w-full h-full bg-gray-secondary p-8">

           <div class="flex flex-col md:flex-row flex-wrap items-center justify-center w-full md:w-4/5">

               <div class="flex-0 flex items-center w-48 sm:w-72 m-5">

                  <div class="inline-block w-full">

                     <button @click="setCurrent(articles)" class="w-full p-5 rounded-lg bg-gray-tertiary bg-opacity-75 text-base font-medium text-white select-none hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none">
                           {{ current_lang.edit_articles }}
                     </button>

                  </div>

               </div>

               <div class="flex-0 flex items-center w-48 sm:w-72 m-5">

                  <div class="inline-block w-full">

                     <router-link to="/edit/quiz" tag="div">

                           <button class="w-full p-5 rounded-lg bg-gray-tertiary bg-opacity-75 text-base font-medium text-white select-none hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none">
                              {{ current_lang.edit_quiz }}
                           </button>

                     </router-link>

                  </div>

               </div>

               <div class="flex-0 flex items-center w-48 sm:w-72 m-5">

                  <div class="inline-block w-full">

                     <router-link to="/edit/categories" tag="div">

                           <button class="w-full p-5 rounded-lg bg-gray-tertiary bg-opacity-75 text-base font-medium text-white select-none hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none">
                              {{ current_lang.edit_categories }}
                           </button>

                     </router-link>

                  </div>

               </div>
              
           </div>

        </div>

        <EditArticles v-if="articles"></EditArticles>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from "nuxt-property-decorator";
    import { vxm } from '../store';

    import Navbar from '../components/navbar/Navbar.vue';
    import EditPanelItem from '../components/edit_panel/article/EditPanelItem.vue';
    import EditArticles from '../components/edit_panel/article/EditArticles.vue';
    import AdminLogin from '../components/admin/AdminLogin.vue';
    import ApiWrapper from "../scripts/api_wrapper";
    import Codes from "../../app/codes";

    @Component({
        name: "AdminPage",
        components: {
            Navbar,
            EditPanelItem,
            EditArticles,
            AdminLogin,
        },
    })
    export default class AdminPage extends Vue {

        edit_menu = 0;

        articles = false;

        goToEdit() {

            this.edit_menu = 1;

        }

        setCurrent(c: string) {

            this.articles = true;
            this.edit_menu = -1;

        }

         get current_lang() {

            return vxm.lang.getCurrentLangStrings;

         }

        async beforeMount() {

            let session_validation = await ApiWrapper.validateSession();
            

            if (session_validation == Codes.SUCCESS) {
               
               this.goToEdit();

            }

            this.$nuxt.$loading.finish();

        }

        mounted() {

            this.$nextTick(() => {

               this.$nuxt.$loading.finish();

            });

         }

         destroyed() {

            this.$nuxt.$loading.start();

         }

    }

</script>