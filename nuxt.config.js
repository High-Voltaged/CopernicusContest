const pkg = require('./package');

module.exports = {

    ssr: false,

    telemetry: true,

    srcDir: 'src/',

    extension: ['js', 'ts'],

    server: {

        host: '127.0.0.1',
        port: 1337,

    },

    head: {

        title: "Blog Kopernika",

        meta: [
            { charset: "utf-8" },
            { name: "viewport", content: "width=device-width, initial-scale=1" },
            { hid: "description", name: "description", content: "NTEST" }
        ],

        link: [
            { rel: "icon", type: "image/x-icon", href: "/favicon.ico" },
        ],

    },

    loading: '~/components/other/Loading.vue',

    css: [
        './src/assets/css/style.scss',
        './src/assets/fonts/poppins.css',
    ],

    buildModules: [
        '@nuxtjs/router',
        '@nuxtjs/tailwindcss',
    ],

    modules: [
        "@nuxtjs/axios",
        '~/modules/typescript',
    ],

    plugins: [
        '~/plugins/fontawesome.js',
    ],

    axios: {},

    build: {
        additionalExtensions: ['ts', 'tsx'],
        extend(config, ctx) { },
    },

    generate: {
        routes: [
            '/',
        ]
    },

}