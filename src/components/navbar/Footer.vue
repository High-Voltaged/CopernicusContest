<template>

<div class="footer-styling inset-x-0 bottom-0 mt-16 shadow-footer">

    <div class="flex flex-col items-center lg:items-stretch lg:flex-row lg:justify-between xl:justify-evenly lg:px-10 lg:py-10 px-3 py-8">

        <div class="flex flex-col items-center">

            <div class="h-14">
                <img src="https://askimspump.se/wp-content/uploads/sites/42/2018/01/placeholder-logo.png" class="h-full object-scale-down"> 
            </div>

            <div class="flex items-center">
                
                <div class="lg:w-10 lg:h-10 w-8 h-8">
                    <a href="#"><font-awesome-icon :icon="['fab', 'instagram']" class="fill-current text-gray-200 w-full h-full px-1 lg:px-2 transition duration-300 ease transform hover:translate-y-2"/></a>
                </div>
                <div class="lg:w-10 lg:h-10 w-8 h-8">
                    <a href="#"><font-awesome-icon :icon="['fab', 'twitter']" class="fill-current text-gray-200 w-full h-full px-1 lg:px-2 transition duration-300 ease transform hover:translate-y-2"/></a>
                </div>
                <div class="lg:w-10 lg:h-10 w-8 h-8">
                    <a href="#"><font-awesome-icon :icon="['fab', 'facebook']" class="fill-current text-gray-200 w-full h-full px-1 lg:px-2 transition duration-300 ease transform hover:translate-y-2"/></a>
                </div>
                <div class="lg:w-10 lg:h-10 w-8 h-8">
                    <a href="#"><font-awesome-icon :icon="['fab', 'youtube']" class="fill-current text-gray-200 w-full h-full px-1 lg:px-2 transition duration-300 ease transform hover:translate-y-2"/></a>
                </div>

            </div>

        </div>

        <div class="sub-transparent-xs top-0 left-1/20 right-1/20 h-px flex justify-center items-center my-6 lg:hidden"></div>

        <div class="flex flex-col items-center sm:items-stretch lg:p-0 py-2">

            <span class="inline-block text-gray-200 font-bold uppercase text-xl tracking-wider p-0 lg:px-5 lg:text-left text-center my-2 lg:my-0">Support</span>

            <div class="flex flex-wrap flex-col sm:flex-row sm:justify-evenly lg:block xl:text-lg">
                <div class="flex items-center lg:transition lg:duration-300 lg:ease-in lg:transform lg:hover:translate-x-4 m-1">
                    <div class="w-4 h-4 hidden lg:block">
                        <font-awesome-icon :icon="['fas', 'angle-right']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <div class="w-2 h-2 block lg:hidden">
                        <font-awesome-icon :icon="['fas', 'circle']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <a href="#" class="text-gray-200 font-light tracking-tight py-1 px-2 lg:p-1">Contact us</a>
                </div>
                
                <div class="flex items-center lg:transition lg:duration-300 lg:ease-in lg:transform lg:hover:translate-x-4 m-1">
                    <div class="w-4 h-4 hidden lg:block">
                        <font-awesome-icon :icon="['fas', 'angle-right']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <div class="w-2 h-2 block lg:hidden">
                        <font-awesome-icon :icon="['fas', 'circle']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <a href="#" class="text-gray-200 font-light tracking-tight py-1 px-2 lg:p-1">Join our team</a>
                </div>
                
                <div class="flex items-center lg:transition lg:duration-300 lg:ease-in lg:transform lg:hover:translate-x-4 m-1">
                    <div class="w-4 h-4 hidden lg:block">
                        <font-awesome-icon :icon="['fas', 'angle-right']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <div class="w-2 h-2 block lg:hidden">
                        <font-awesome-icon :icon="['fas', 'circle']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <a href="#" class="text-gray-200 font-light tracking-tight py-1 px-2 lg:p-1">FAQ</a>
                </div>
                
                <div class="flex items-center lg:transition lg:duration-300 lg:ease-in lg:transform lg:hover:translate-x-4 m-1">
                    <div class="w-4 h-4 hidden lg:block">
                        <font-awesome-icon :icon="['fas', 'angle-right']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <div class="w-2 h-2 block lg:hidden">
                        <font-awesome-icon :icon="['fas', 'circle']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <a href="#" class="text-gray-200 font-light tracking-tight py-1 px-2 lg:p-1">Share</a>
                </div>
            </div>

        </div>

        <div class="sub-transparent-xs top-0 left-1/20 right-1/20 h-px flex justify-center items-center my-6 lg:hidden"></div>

        <div class="flex flex-col items-center sm:items-stretch lg:p-0 py-2">

            <span class="inline-block text-gray-200 font-bold uppercase text-xl tracking-wider p-0 lg:px-5 lg:text-left text-center my-2 lg:my-0">Our website</span>

            <div class="flex flex-wrap flex-col sm:flex-row sm:justify-evenly lg:block xl:text-lg">
                <div class="flex items-center lg:transition lg:duration-300 lg:ease-in lg:transform lg:hover:translate-x-4 m-1">
                    <div class="w-4 h-4 hidden lg:block">
                        <font-awesome-icon :icon="['fas', 'angle-right']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <div class="w-2 h-2 block lg:hidden">
                        <font-awesome-icon :icon="['fas', 'circle']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <a href="#" class="text-gray-200 font-light tracking-tight py-1 px-2 lg:p-1">About the project</a>
                </div>

                <div class="flex items-center lg:transition lg:duration-300 lg:ease-in lg:transform lg:hover:translate-x-4 m-1">
                    <div class="w-4 h-4 hidden lg:block">
                        <font-awesome-icon :icon="['fas', 'angle-right']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <div class="w-2 h-2 block lg:hidden">
                        <font-awesome-icon :icon="['fas', 'circle']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <a href="#" class="text-gray-200 font-light tracking-tight py-1 px-2 lg:p-1">Top 10 articles</a>
                </div>

                <div class="flex items-center lg:transition lg:duration-300 lg:ease-in lg:transform lg:hover:translate-x-4 m-1">
                    <div class="w-4 h-4 hidden lg:block">
                        <font-awesome-icon :icon="['fas', 'angle-right']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <div class="w-2 h-2 block lg:hidden">
                        <font-awesome-icon :icon="['fas', 'circle']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <a href="#" class="text-gray-200 font-light tracking-tight py-1 px-2 lg:p-1">More info</a>
                </div>

                <div class="flex items-center lg:transition lg:duration-300 lg:ease-in lg:transform lg:hover:translate-x-4 m-1">
                    <div class="w-4 h-4 hidden lg:block">
                        <font-awesome-icon :icon="['fas', 'angle-right']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <div class="w-2 h-2 block lg:hidden">
                        <font-awesome-icon :icon="['fas', 'circle']" class="h-full w-full fill-current text-purple-secondary" />
                    </div>
                    <a href="#" class="text-gray-200 font-light tracking-tight py-1 px-2 lg:p-1">Main sources</a>
                </div>
            </div>

        </div>

        <div class="sub-transparent-xs top-0 left-1/20 right-1/20 h-px flex justify-center items-center my-6 lg:hidden"></div>

        <div class="flex justify-center items-center lg:p-0 py-2">

            <button type="button" class="button-footer bg-purple-secondary border-2 border-purple-secondary flex items-center px-6 py-3 2xl:py-4 2xl:px-8 rounded-md shadow-md lg:transition duration-300 ease hover:bg-transparent focus:outline-none">
                <a href="/quiz" class="font-semibold tracking-wide text-gray-200 cursor-pointer pr-2 xl:text-lg">Take A Quiz Here</a> 
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

    @Component({
        name: "Footer",
    })

    export default class Footer extends Vue {

    }
</script>