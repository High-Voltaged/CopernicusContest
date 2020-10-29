<template>

    <div class="flex flex-col items-start">

        <MajorArticle v-for="(article, i) in articles"
                      :key="article.id"
                      :article="article"
                      :index="i + 1"></MajorArticle>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from "nuxt-property-decorator";
    import MajorArticle from './MajorArticle.vue';

    @Component({
        name: "MajorArticles",
        components: {
            MajorArticle,
        },
    })
    export default class MajorArticles extends Vue {

        articles = [

            {
                id: 1,

                title: 'Mikołaj Kopernik - biografia',

                content: [
                    'Mikołaj Kopernik - wielki astronom polski, twórca teorii heliocentryzmu. Udowodnił, że Ziemia i planety krążą wokół nieruchomego Słońca.',
                    ' ',
                    'Urodzony w Toruniu 19 lutego 1473 roku w rodzinie kupca Mikołaja i Barbary. Według badań dotyczących pochodzenia rodu Koperników wywodzi się on ze Śląska.',
                    ' ',
                    'Był polskim astronomem, matematykiem, prawnikiem, ekonomistą, strategiem, lekarzem, astrologiem, kanonikiem warmińskim i duchownym katolickim. Jego najważniejszym dziełem było dzieło o nazwie "O obrotach sfer niebieskich" (De revolutionibus orbium coelestium), w którym opisał heliocentryczną wizję świata w sposób wystarczająco szczegółowy, by mogła stać się naukowo użyteczna. Na podstawie obserwacji nieba stwierdził, że Ziemia krąży wokół Słońca. Było to odkrycie przełomowe dla rozwoju nowoczesnej nauki. Wcześniej sądzono bowiem, że inne planety obiegają nieruchomą ziemię.',
                    ' ',
                    'Mikołaj Kopernik spotykał w Krakowie wielkich uczonych i słuchał ich wykładów. Jednym z wybitnych ówczesnych krakowskich uczonych był Wojciech z Brudzewa. W czasie pobytu Mikołaja Kopernika w Krakowie nie wykładał już astronomii, gdyż zajmował się badaniem dzieł Arystotelesa.', '', 'Kopernik uczęszczał na różnorodne wykłady: z gramatyki, z retoryki, z poetyki, ale również na wykłady o treściach matematyczno-astronomicznych. Jest możliwe, że właśnie w tym czasie w umyśle Mikołaja Kopernika zrodziła się koncepcja teorii budowy świata odmiennej od obowiązującej.',
                    ' ',
                    'Mikołaj Kopernik był nowoczesnym uczonym i odważnym człowiekiem szukającym prawdy o Wszechświecie. Ogłoszone drukiem dzieło przyniosło światu nową ideę. Mikołaj Kopernik zakończył życie 24 maja 1543 roku na skutek wylewu krwi do mózgu. Mikołaj Kopernik został pochowany pod posadzką katedry fromborskiej.'
                ],

                picture_link: 'https://cdn.britannica.com/83/74283-050-B94F541D/Nicolaus-Copernicus.jpg'

            },

            {
                id: 2,

                title: 'Mikołaj Kopernik - biografia',

                content: [
                    'Mikołaj Kopernik - wielki astronom polski, twórca teorii heliocentryzmu. Udowodnił, że Ziemia i planety krążą wokół nieruchomego Słońca.',
                    ' ',
                    'Urodzony w Toruniu 19 lutego 1473 roku w rodzinie kupca Mikołaja i Barbary. Według badań dotyczących pochodzenia rodu Koperników wywodzi się on ze Śląska.',
                    ' ',
                    'Był polskim astronomem, matematykiem, prawnikiem, ekonomistą, strategiem, lekarzem, astrologiem, kanonikiem warmińskim i duchownym katolickim. Jego najważniejszym dziełem było dzieło o nazwie "O obrotach sfer niebieskich" (De revolutionibus orbium coelestium), w którym opisał heliocentryczną wizję świata w sposób wystarczająco szczegółowy, by mogła stać się naukowo użyteczna. Na podstawie obserwacji nieba stwierdził, że Ziemia krąży wokół Słońca. Było to odkrycie przełomowe dla rozwoju nowoczesnej nauki. Wcześniej sądzono bowiem, że inne planety obiegają nieruchomą ziemię.',
                    ' ',
                    'Mikołaj Kopernik spotykał w Krakowie wielkich uczonych i słuchał ich wykładów. Jednym z wybitnych ówczesnych krakowskich uczonych był Wojciech z Brudzewa. W czasie pobytu Mikołaja Kopernika w Krakowie nie wykładał już astronomii, gdyż zajmował się badaniem dzieł Arystotelesa.', '', 'Kopernik uczęszczał na różnorodne wykłady: z gramatyki, z retoryki, z poetyki, ale również na wykłady o treściach matematyczno-astronomicznych. Jest możliwe, że właśnie w tym czasie w umyśle Mikołaja Kopernika zrodziła się koncepcja teorii budowy świata odmiennej od obowiązującej.',
                    ' ',
                    'Mikołaj Kopernik był nowoczesnym uczonym i odważnym człowiekiem szukającym prawdy o Wszechświecie. Ogłoszone drukiem dzieło przyniosło światu nową ideę. Mikołaj Kopernik zakończył życie 24 maja 1543 roku na skutek wylewu krwi do mózgu. Mikołaj Kopernik został pochowany pod posadzką katedry fromborskiej.'
                ],

                picture_link: 'https://en.hittheroad.se/wp-content/uploads/2016/11/25893208411_ee4d8646a9_omm.jpg'

            },


        ]

    }

</script>