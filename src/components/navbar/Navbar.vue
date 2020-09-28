<template>

<header class="bg-gray-secondary z-50 inset-x-0 top-0 px-4 sm:flex sm:justify-between sm:items-center relative h-20 leading-tight shadow-navbar">

    <div class="flex items-center py-3 px-3 justify-between sm:p-0"> <!-- `py-6` if no logo -->
       
        <div>
           <img src="https://askimspump.se/wp-content/uploads/sites/42/2018/01/placeholder-logo.png" class="object-cover h-14"> 
        </div>

        <div class="sm:hidden">
            <button @click="isOpen = !isOpen" type="button" class="block relative text-gray-200 focus:outline-none">
                <svg class="h-8/5 w-8/5 fill-current">
                    <font-awesome-icon :icon="['fas', 'bars']" v-if="!isOpen" />
                    <font-awesome-icon :icon="['fas', 'times']" v-if="isOpen" />
                </svg>
            </button>
        </div>
    </div>

    <nav :class="isOpen ? 'block' : 'hidden' " class="shadow-md sm:shadow-none sm:block bg-gray-tertiary sm:bg-transparent rounded-lg z-50 rounded-tl-none rounded-tr-none">
        <div class=" px-2 py-2 sm:flex sm:items-center sm:p-0">
            <a href="#" class="block text-gray-200 font-light hover:bg-gray-secondary sm:hover:bg-gray-primary hover:text-white transition duration-300 linear px-2 py-1 rounded">Info</a>
            <a href="#" class="block text-gray-200 font-light hover:bg-gray-secondary sm:hover:bg-gray-primary hover:text-white transition duration-300 linear px-2 py-1 rounded mt-1 sm:mt-0 sm:ml-2">Contact us</a>
            <a href="#" class="block text-gray-200 font-light hover:bg-gray-secondary sm:hover:bg-gray-primary hover:text-white transition duration-300 linear px-2 py-1 rounded mt-1 sm:mt-0 sm:ml-2">Stuff</a>
        </div>
    </nav>

</header>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';

    @Component({
        name: "Navbar",
    })
    export default class Navbar extends Vue {
        data () {
              return {
                isOpen: false,
              }
            }
    }
</script>