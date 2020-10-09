<template>

    <div class="h-screen w-screen overflow-x-hidden overflow-y-auto">

        <div v-if="edit_menu == 0" class="flex flex-col items-center justify-center flex-auto h-full py-6 bg-gray-secondary">

            <form @submit.prevent="login" class="flex flex-col items-center justify-center w-72 p-8 rounded-lg shadow-md bg-gray-tertiary">

                <div class="flex items-center justify-center w-full">
                    <span class="text-xl font-semibold text-center capitalize text-white select-none">
                        Login
                    </span>
                </div>

                <div class="flex items-center w-full h-10 mt-6">
                    <input v-model="username" placeholder="Your username" class="w-full bg-gray-400 text-sm text-gray-800 py-1 px-2 rounded-lg overflow-hidden focus:outline-none border-opacity-50 border-2 focus:border-gray-main transition duration-200 ease" type="text" />
                </div>

                <div class="flex items-center w-full h-10 mt-4">
                    <input v-model="password" placeholder="Your password" class="w-full bg-gray-400 text-sm text-gray-800 py-1 px-2 rounded-lg overflow-hidden focus:outline-none border-opacity-50 border-2 focus:border-gray-main transition duration-200 ease" type="password" />
                </div>

                <div class="w-full mt-6">
                    <button type="submit" class="block w-full py-1 px-3 rounded-lg bg-gray-main bg-opacity-50 text-white font-medium hover:bg-opacity-100 focus:bg-opacity-100 transition duration-200 ease focus:outline-none select-none">
                        Login
                    </button>
                </div>

                <div v-if="error_message" class="error_message w-full bg-transparent mt-3 px-2 text-center text-sm text-red-500 select-none">
                    Login details incorrect
                </div>

            </form>

        </div>

        <component :is="getCurrent"></component>

    </div>

</template>

<script lang="ts">

    import { Component, Vue } from "nuxt-property-decorator";
    import APIWrapper from "../../scripts/api_wrapper";
    import Codes from "../../../app/codes";

    @Component({
        name: "AdminLogin",
    })
    export default class AdminLogin extends Vue {

        // Login Menu

        error_message = false;

        username: string = "";
        password: string = "";

        async login() {

            let result: Codes = await APIWrapper.adminLogin(this.username, this.password);

            if (result == Codes.SUCCESS) {



            } else {

                this.error_message = true;
                this.username = "";
                this.password = "";

            }

        }

    }

</script>