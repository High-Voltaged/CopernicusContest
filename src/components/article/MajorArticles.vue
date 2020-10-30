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
                    'Nicolaus Copernicus polski polihistor: prawnik, urzędnik, dyplomata, lekarz i niższy duchowny katolicki, zajmujący się również astronomią i astrologią, matematyką, ekonomią, strategią wojskową i filologią. Udowodnił, że Ziemia i planety krążą wokół nieruchomego Słońca.',
                    ' ',
                    'Urodzony w Toruniu 19 lutego 1473 roku w rodzinie kupca Mikołaja i Barbary. Według badań dotyczących pochodzenia rodu Koperników wywodzi się on ze Śląska.',
                    ' ',
                    'Był polskim astronomem, matematykiem, prawnikiem, ekonomistą, strategiem, lekarzem, astrologiem, kanonikiem warmińskim i duchownym katolickim. Jego najważniejszym dziełem było dzieło o nazwie "O obrotach sfer niebieskich" (De revolutionibus orbium coelestium), w którym opisał heliocentryczną wizję świata w sposób wystarczająco szczegółowy, by mogła stać się naukowo użyteczna. Na podstawie obserwacji nieba stwierdził, że Ziemia krąży wokół Słońca. Było to odkrycie przełomowe dla rozwoju nowoczesnej nauki. Wcześniej sądzono bowiem, że inne planety obiegają nieruchomą ziemię.',
                    ' ',
                    'Mikołaj Kopernik spotykał w Krakowie wielkich uczonych i słuchał ich wykładów. Jednym z wybitnych ówczesnych krakowskich uczonych był Wojciech z Brudzewa. W czasie pobytu Mikołaja Kopernika w Krakowie nie wykładał już astronomii, gdyż zajmował się badaniem dzieł Arystotelesa.',
                    ' ',
                    'Kopernik uczęszczał na różnorodne wykłady: z gramatyki, z retoryki, z poetyki, ale również na wykłady o treściach matematyczno-astronomicznych. Jest możliwe, że właśnie w tym czasie w umyśle Mikołaja Kopernika zrodziła się koncepcja teorii budowy świata odmiennej od obowiązującej.',
                    ' ',
                    'Mikołaj Kopernik był nowoczesnym uczonym i odważnym człowiekiem szukającym prawdy o Wszechświecie. Ogłoszone drukiem dzieło przyniosło światu nową ideę. Mikołaj Kopernik zakończył życie 24 maja 1543 roku na skutek wylewu krwi do mózgu. Mikołaj Kopernik został pochowany pod posadzką katedry fromborskiej.',
                    ' ',
                    'źródło: https://sites.google.com/site/wybitniuczeni/mikolaj-kopernik'
                ],

                picture_link: 'https://cdn.britannica.com/83/74283-050-B94F541D/Nicolaus-Copernicus.jpg'

            },

            {
                id: 2,

                title: 'De Revolutionibus',

                content: [

                    'Od 1514 roku rozpoczął prace nad pierwszą księgą dzieła swojego życia „De Revolutionibus”. Do roku 1533 prowadził obserwacje i prace nad teorią heliocentryczną, nie chwaląc się nikomu, słusznie bowiem obawiał się reakcji Kościoła na jego rewolucyjne i sprzeczne z dogmatami tezy, obalające mit na temat Ziemi jako centrum Wszechświata. W 1533 roku jednak zdecydował się na przedstawienie w Watykanie założeń swojej teorii. W 1537 roku Mikołaj Kopernik zostaje nominowany na biskupa warmińskiego. Dzięki temu, mógł odważniej głosić swe teorie. Niestety nadal był krytykowany, nie tylko przez środowiska duchowne, lecz także naukowe. Za namową teologa Andrzeja Osiandera, postanowił opublikować „De Revolutionibus” w formie hipotezy, słusznie uznał, że nie będzie ona antydogmatem w postaci jednoznacznej i udowodnionej prawdy. W 1541 roku wyjechał do Wittenbergi, w celu wydania swego dzieła. Jest rok 1543. Rok oficjalnej publikacji „De revolutionibus orbium coelestium” (tłum. „O obrotach sfer niebieskich”) w języku łacińskim. Mikołaj Kopernik swe dzieło zadedykował ówczesnemu papieżowi Pawłowi III. Warto wspomnieć, iż rewolucja, jaką dzieło wywołało, nie nastąpiła od razu. Dyskusja na jego temat objęła dosyć szerokie grono uczonych dopiero pod koniec XVI wieku. W 1616 roku (aż do roku 1822) władze duchowne trzymały „De Revolutionibus” w indeksie ksiąg zakazanych, zwanym też indeksem ksiąg zatrutych. Dopiero w XVIII wieku powróciła dyskusja na temat hipotezy heliocentrycznej i heliostatycznej budowy Wszechświata. Poparta ona była już większą ilością zgromadzonych danych obserwacyjnych. Dzieło skreślone z indeksu w 1828 roku powróciło na języki świata naukowego w 1835 roku, po przypomnieniu dzieła Galileusza pt.: „Dialog o dwu najważniejszych układach świata: ptolemeuszowym i kopernikowym”, potwierdzającego teorię heliocentryczną.',
                    ' ',
                    'źródło: http://astronomia.media.pl/blog/mikolaj-kopernik/'

                ],

                picture_link: 'http://astronomia.media.pl/blog/wp-content/uploads/2019/02/CopernicSystem.png'

            },


        ]

    }

</script>