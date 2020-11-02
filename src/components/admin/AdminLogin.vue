<template>

    <div class="h-full w-full overflow-x-hidden overflow-y-auto">

        <div class="flex flex-col items-center justify-center flex-auto h-full py-6 bg-gray-primary">

            <form @submit.prevent="login" class="admin-login flex flex-col items-center justify-center w-80 space-y-6 p-8 xl:p-10 shadow-md" style="border-radius: 15px">

                <div class="flex items-center justify-center w-full">
                    <span class="text-lg font-semibold text-center text-white select-none">
                        {{ current_lang.login_to_admin_panel }}
                    </span>
                </div>

                <div class="flex items-center w-full h-10">
                    <input v-model="username" :placeholder="current_lang.username" class="w-full bg-gray-200 text-sm py-2 px-3 overflow-hidden focus:outline-none transition duration-300 ease" type="text" style="border-radius: 10px" />
                </div>

                <div class="flex items-center w-full h-10">
                    <input v-model="password" :placeholder="current_lang.password" class="w-full bg-gray-200 text-sm py-2 px-3 overflow-hidden focus:outline-none transition duration-300 ease" type="password" style="border-radius: 10px" />
                </div>

                <div class="w-full">
                    <button
                        class="flex items-center justify-center w-full px-3 py-2 rounded-lg bg-gray-main bg-opacity-75 hover:bg-opacity-100 transition duration-300 ease focus:outline-none">

                        <span class="text-sm text-gray-200 font-semibold text-left select-none">
                            {{ current_lang.continue_str }}
                        </span>

                     </button>
                </div>

                <transition name="fade-out">

                    <div v-if="error_message" class="error_message w-full bg-transparent mt-3 px-2 text-center text-sm text-red-500 select-none">
                        {{ current_lang.login_details_incorrect }}
                    </div>

                </transition>

            </form>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Vue } from "nuxt-property-decorator";
    import APIWrapper from "../../scripts/api_wrapper";
    import Codes from "../../../app/codes";
    import { vxm } from '../../store';

    @Component({
        name: "AdminLogin",
    })
    export default class AdminLogin extends Vue {

        error_message = false;

        username: string = "";
        password: string = "";

        async login() {

            let result: Codes = await APIWrapper.adminLogin(this.username, this.password);

            if (result == Codes.SUCCESS) {

                this.$emit('goToEdit');


            } else {

                this.error_message = true;
                this.username = "";
                this.password = "";

            }

        } 

        get current_lang() {

            return vxm.lang.getCurrentLangStrings;

         }

      //   mounted() {

      //       this.$nextTick(() => {

      //          this.$nuxt.$loading.finish();

      //       });

      //    }

      //    destroyed() {

      //       this.$nuxt.$loading.start();

      //    }

    }

</script>