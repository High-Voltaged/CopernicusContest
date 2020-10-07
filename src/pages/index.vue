<template>

    <div>

       <Navbar />

        <div class="antialiased">

            <div class="main-container overflow-y-auto">

                <div class="main-title relative w-full h-104 md:h-88 p-5 flex flex-col items-center md:flex-row md:justify-around shadow-lg">

                    <div class="absolute inset-0">
                        <img src="https://images.unsplash.com/photo-1512840399005-5bce2b583140?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" class="h-full w-full object-cover opacity-25" />
                    </div>

                    <div class="flex flex-col justify-center items-center w-full md:w-2/3  px-2 md:px-4 z-10">

                        <div class="flex flex-col items-center">
                            <span class="uppercase text-gray-300 text-sm text-base font-light 2xl:text-2xl text-center">Non-main title</span>
                            <span class="text-5xl text-gray-200 capitalize font-semibold text-center">Main title</span>
                            <p class="text-gray-300 text-center text-base 2xl:text-2xl">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.</p>
                        </div>

                        <div class="mt-8">
                            <button @click="redirectToQuiz()" class="arrow-container flex items-center px-6 py-3 2xl:py-4 2xl:px-8 rounded-full lg:transition duration-300 ease-in transform lg:hover:translate-x-6 shadow-md focus:outline-none">
                                <p class="font-semibold tracking-wide text-gray-200 cursor-pointer pr-2">Take A Quiz Here</p>
                                <span class="arrow-icon w-3 h-3">
                                    <font-awesome-icon :icon="['fas', 'arrow-right']" class="w-full h-full fill-current text-gray-200" />
                                </span>
                            </button>
                        </div>

                    </div>

                    <div class="w-full sm:w-7/10 md:w-1/3 2xl:w-1/4 flex items-start justify-center z-10 mt-8 sm:mt-4 md:mt-0 md:-mb-28 lg:-mb-40">
                        <div class="rounded-lg 2xl:rounded-xl shadow-md overflow-hidden 2xl:w-4/5 2xl:h-4/5 w-full h-full">
                            <img src="https://medcitynews.com/uploads/2017/03/GettyImages-545864039.jpg" class="w-full h-full max-h-80 overflow-hidden object-cover">
                        </div>
                    </div>

                </div>

                <div class="mt-20 md:mt-12 xl:mt-16 px-5 md:px-24 py-10">

                    <div class="container-main mdMax:overflow-x-hidden 2xl:w-4/5 2xl:mx-auto px-4 md:px-8 py-6 bg-gray-main shadow-md rounded-md">

                        <div class="w-full">

                            <div class="flex flex-col w-full">

                                <div class="px-2 md:px-4">
                                    
                                    <span class="block text-center uppercase text-gray-300 font-light leading-tight">Non-main title</span>
                                    <span class="block text-center text-5xl capitalize font-black tracking-wide leading-tight text-gray-200">Main title</span>

                                    <div class="divider relative h-px my-5 min-w-full">
                                        <div class="div-transparent  absolute top-0 left-1/20 right-1/20 h-px">
                                            <div class="div-dot absolute rounded-full bg-gray-tertiary cursor-pointer transition transform hover:scale-75 duration-500 linear"></div>
                                        </div>
                                    </div>

                                    <p class="text-center font-light text-gray-300">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                
                                </div>

                                <div class="flex-col lg:flex-row flex justify-center lg:justify-around items-center mt-16">

                                    <div class="w-full lg:w-1/2 px-4">

                                        <div class="flex justify-center md:justify-start">
                                            <span class="text-3xl font-semibold tracking-wide capitalize text-center md:text-left leading-tight text-gray-200">The title of a sub-section</span>
                                        </div>

                                        <div class="sub-divider relative h-px my-5">
                                            <div class="sub-transparent-xs md:hidden absolute top-0 left-1/20 right-1/20 h-px flex justify-center items-center">
                                            </div>
                                            <div class="hidden md:block sub-transparent-desktop absolute top-0 right-1/20 h-px flex justify-center items-center">
                                            </div>
                                        </div>

                                        <p class="text-justify lg:text-left text-sm leading-relaxed font-light text-gray-300">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p><br>
                                        <p class="text-justify lg:text-left text-sm leading-relaxed font-light text-gray-300 ">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>

                                        <div class="flex items-center justify-end mt-5">
                                            <button class="arrow-container flex items-center px-3 py-2 rounded-full lg:transition duration-300 ease-in lg:transform hover:translate-x-6 shadow focus:outline-none">
                                                <a href="#" class="text-xs xl:text-sm tracking-wide text-gray-200 cursor-pointer pr-2">Continue reading here</a>
                                                <span class="arrow-icon w-3 h-3">
                                                    <font-awesome-icon :icon="['fas', 'arrow-right']" class="w-full h-full fill-current text-gray-200" />
                                                </span>
                                            </button>
                                        </div>

                                    </div>

                                    <div class="w-full sm:w-2/3 lg:w-1/3 2xl:w-1/4 pt-8 pb-8 lg:py-0 lg:px-2 md:h-full flex items-center">
                                        <img src="https://images.unsplash.com/photo-1515405295579-ba7b45403062?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80" class="w-full h-full object-cover rounded-lg overflow-hidden shadow-lg">
                                    </div>

                                </div>

                                <div class="flex-col lg:flex-row flex justify-center lg:justify-around items-center mt-16">
                                    <div class="w-full sm:w-2/3 lg:w-1/3 2xl:w-1/4 pt-8 pb-8 lg:py-0 lg:px-2 md:h-full flex items-center">
                                        <img src="https://images.unsplash.com/photo-1515405295579-ba7b45403062?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80" class="w-full h-full object-cover rounded-lg overflow-hidden shadow-lg">
                                    </div>

                                    <div class="w-full lg:w-1/2 px-4 order-first lg:order-last">

                                        <div class="flex justify-center md:justify-end">
                                            <span class="text-3xl font-semibold tracking-wide capitalize leading-tight text-center md:text-right text-gray-200">The title of a sub-section</span>
                                        </div>

                                        <div class="sub-divider relative h-px my-5">
                                            <div class="sub-transparent-xs md:hidden absolute top-0 left-1/20 right-1/20 h-px flex justify-center items-center">
                                            </div>
                                            <div class="hidden md:block sub-transparent1-desktop absolute top-0 left-1/20 h-px flex justify-center items-center">
                                            </div>
                                        </div>

                                        <p class="text-justify lg:text-right text-sm leading-relaxed font-light text-gray-300">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p><br>
                                        <p class="text-justify lg:text-right text-sm leading-relaxed font-light text-gray-300 ">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>

                                        <div class="flex items-center justify-end mt-5">
                                            <button class="arrow-container flex items-center px-3 py-2 rounded-full lg:transition duration-300 ease-in lg:transform hover:translate-x-6 shadow focus:outline-none">
                                                <a href="#" class="text-xs xl:text-sm tracking-wide text-gray-200 cursor-pointer pr-2">Continue reading here</a>
                                                <span class="arrow-icon w-3 h-3">
                                                    <font-awesome-icon :icon="['fas', 'arrow-right']" class="w-full h-full fill-current text-gray-200" />
                                                </span>
                                            </button>
                                        </div>

                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="mt-16 flex flex-col items-stretch justify-center 2xl:max-w-4/5 mx-auto w-full">
                            <div class="px-2 md:px-4">
                                <span class="block text-center uppercase text-gray-300 font-light leading-tight">Non-main title</span>
                                <span class="block text-center text-5xl capitalize font-black tracking-wide leading-tight text-gray-200">Main title</span>

                                <div class="divider relative h-px my-5 min-w-full">
                                    <div class="div-transparent  absolute top-0 left-1/20 right-1/20 h-px">
                                        <div class="div-dot absolute rounded-full bg-gray-tertiary cursor-pointer transition transform hover:scale-75 duration-500 linear"></div>
                                    </div>
                                </div>

                                <p class="text-center font-light text-gray-300">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>

                            <div class="mt-16 max-w-full w-full flex-shrink-0 flex justify-center relative">
                                <div class="relative w-full h-full">

                                    <div class="timeline mx-auto flex h-full w-9/10 justify-center overflow-x-hidden">
                                        <div class="timeline-container my-4 flex justify-between w-full h-full relative text-gray-200 transition duration-200 ease-in transform">

                                            <div class="container-w-dot h-48 max-h-48 flex-shrink-0 w-full sm:w-1/2 lg:w-1/3 xl:w-1/4 2xl:w-1/6 px-3">
                                                <div class="relative text-xs leading-tight tracking-wider font-light mt-6">
                                                    <div class="dot absolute rounded-full z-10 cursor-pointer transform hover:scale-125 transition duration-300 linear bg-gray-tertiary shadow-lg flex items-center justify-center">
                                                        <div class="sub-dot rounded-full z-20 cursor-pointer bg-white"></div>
                                                    </div>

                                                    <div class="sub-container relative cursor-pointer rounded shadow-md px-6 py-4 transform hover:translate-y-8 transition duration-300 linear max-h-130px">
                                                        <div class="arrow block absolute bottom-full "></div>

                                                        <div class="content max-h-98px overflow-y-hidden">
                                                            <span class="text-2xl">Title</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container-w-dot h-48 max-h-48 flex-shrink-0 w-full sm:w-1/2 lg:w-1/3 xl:w-1/4 2xl:w-1/6 px-3">
                                                <div class="relative text-xs leading-tight tracking-wider font-light mt-6">
                                                    <div class="dot absolute rounded-full z-10 cursor-pointer transform hover:scale-125 transition duration-300 linear bg-gray-tertiary shadow-lg flex items-center justify-center">
                                                        <div class="sub-dot rounded-full z-20 cursor-pointer bg-white"></div>
                                                    </div>

                                                    <div class="sub-container relative cursor-pointer rounded shadow-md px-6 py-4 transform hover:translate-y-8 transition duration-300 linear max-h-130px">
                                                        <div class="arrow block absolute bottom-full "></div>

                                                        <div class="content max-h-98px overflow-y-hidden">
                                                            <span class="text-2xl">Title</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container-w-dot h-48 max-h-48 flex-shrink-0 w-full sm:w-1/2 lg:w-1/3 xl:w-1/4 2xl:w-1/6 px-3">
                                                <div class="relative text-xs leading-tight tracking-wider font-light mt-6">
                                                    <div class="dot absolute rounded-full z-10 cursor-pointer transform hover:scale-125 transition duration-300 linear bg-gray-tertiary shadow-lg flex items-center justify-center">
                                                        <div class="sub-dot rounded-full z-20 cursor-pointer bg-white"></div>
                                                    </div>

                                                    <div class="sub-container relative cursor-pointer rounded shadow-md px-6 py-4 transform hover:translate-y-8 transition duration-300 linear max-h-130px">
                                                        <div class="arrow block absolute bottom-full "></div>

                                                        <div class="content max-h-98px overflow-y-hidden">
                                                            <span class="text-2xl">Title</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container-w-dot h-48 max-h-48 flex-shrink-0 w-full sm:w-1/2 lg:w-1/3 xl:w-1/4 2xl:w-1/6 px-3">
                                                <div class="relative text-xs leading-tight tracking-wider font-light mt-6">
                                                    <div class="dot absolute rounded-full z-10 cursor-pointer transform hover:scale-125 transition duration-300 linear bg-gray-tertiary shadow-lg flex items-center justify-center">
                                                        <div class="sub-dot rounded-full z-20 cursor-pointer bg-white"></div>
                                                    </div>

                                                    <div class="sub-container relative cursor-pointer rounded shadow-md px-6 py-4 transform hover:translate-y-8 transition duration-300 linear max-h-130px">
                                                        <div class="arrow block absolute bottom-full "></div>

                                                        <div class="content max-h-98px overflow-y-hidden">
                                                            <span class="text-2xl">Title</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container-w-dot h-48 max-h-48 flex-shrink-0 w-full sm:w-1/2 lg:w-1/3 xl:w-1/4 2xl:w-1/6 px-3">
                                                <div class="relative text-xs leading-tight tracking-wider font-light mt-6">
                                                    <div class="dot absolute rounded-full z-10 cursor-pointer transform hover:scale-125 transition duration-300 linear bg-gray-tertiary shadow-lg flex items-center justify-center">
                                                        <div class="sub-dot rounded-full z-20 cursor-pointer bg-white"></div>
                                                    </div>

                                                    <div class="sub-container relative cursor-pointer rounded shadow-md px-6 py-4 transform hover:translate-y-8 transition duration-300 linear max-h-130px">
                                                        <div class="arrow block absolute bottom-full "></div>

                                                        <div class="content max-h-98px overflow-y-hidden">
                                                            <span class="text-2xl">Title</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container-w-dot h-48 max-h-48 flex-shrink-0 w-full sm:w-1/2 lg:w-1/3 xl:w-1/4 2xl:w-1/6 px-3">
                                                <div class="relative text-xs leading-tight tracking-wider font-light mt-6">
                                                    <div class="dot absolute rounded-full z-10 cursor-pointer transform hover:scale-125 transition duration-300 linear bg-gray-tertiary shadow-lg flex items-center justify-center">
                                                        <div class="sub-dot rounded-full z-20 cursor-pointer bg-white"></div>
                                                    </div>

                                                    <div class="sub-container relative cursor-pointer rounded shadow-md px-6 py-4 transform hover:translate-y-8 transition duration-300 linear max-h-130px">
                                                        <div class="arrow block absolute bottom-full "></div>

                                                        <div class="content max-h-98px overflow-y-hidden">
                                                            <span class="text-2xl">Title</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container-w-dot h-48 max-h-48 flex-shrink-0 w-full sm:w-1/2 lg:w-1/3 xl:w-1/4 2xl:w-1/6 px-3">
                                                <div class="relative text-xs leading-tight tracking-wider font-light mt-6">
                                                    <div class="dot absolute rounded-full z-10 cursor-pointer transform hover:scale-125 transition duration-300 linear bg-gray-tertiary shadow-lg flex items-center justify-center">
                                                        <div class="sub-dot rounded-full z-20 cursor-pointer bg-white"></div>
                                                    </div>

                                                    <div class="sub-container relative cursor-pointer rounded shadow-md px-6 py-4 transform hover:translate-y-8 transition duration-300 linear max-h-130px">
                                                        <div class="arrow block absolute bottom-full "></div>

                                                        <div class="content max-h-98px overflow-y-hidden">
                                                            <span class="text-2xl">Title</span>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

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

                        </div>

                        <div class="mt-4 2xl:max-w-4/5 mx-auto">
                            
                            <div class="px-2 md:px-4">
                                <span class="block text-center uppercase text-gray-300 font-light leading-tight">Non-main title</span>
                                <span class="block text-center text-5xl capitalize font-black tracking-wide leading-tight text-gray-200">Main title</span>

                                <div class="divider relative h-px my-5 min-w-full">
                                    <div class="div-transparent  absolute top-0 left-1/20 right-1/20 h-px">
                                        <div class="div-dot absolute rounded-full bg-gray-tertiary cursor-pointer transition transform hover:scale-75 duration-500 linear"></div>
                                    </div>
                                </div>

                                <p class="text-center font-light text-gray-300">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            
                            </div>

                            <ImportantArticles :articles="this.important_articles"></ImportantArticles>

                        </div>

                        <DigestList :digests="this.digest_list"> </DigestList>

                    </div>

                </div>

                <Footer />

            </div>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from "nuxt-property-decorator";
    import ApiUtils from '../scripts/api_utils';
    import Navbar from '../components/navbar/Navbar.vue';
    import Footer from '../components/navbar/Footer.vue';
    import DigestList from '../components/digest/digest_list.vue';
    import ImportantArticles from '../components/article/important_articles.vue';
    import IBriefArticle from '../../interfaces/brief_article';

    @Component({
        name: "index",
        components: {
            Navbar,
            Footer,
            DigestList,
            ImportantArticles,
        },
    })
    export default class index extends Vue {

        digest_list: IBriefArticle[] = []

        redirectToQuiz(): void {

            this.$router.push("/quiz");

        }

        async beforeMount() {

            let stuff = await ApiUtils.fetchDigest();

            for (let i = 0; i < stuff.length; ++i) {

                let temp_digest: IBriefArticle = {} as IBriefArticle;

                temp_digest.ID = stuff[i].id;
                temp_digest.ShortDescription = stuff[i].content;
                temp_digest.TimesRead = stuff[i].times_read;
                temp_digest.Title = stuff[i].title;

                this.digest_list.push(temp_digest);

            }

        }

    }

</script>