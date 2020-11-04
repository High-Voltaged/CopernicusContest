<template>

    <div ref="container" class="flex flex-col items-center justify-center w-full mt-16">

        <vue-timeline-update v-for="(t, i) in timeline"
                             :key="i"
                             icon="code"
                             :title="t.title"
                             :description="t.description"
                             :thumbnail="t.thumbnail"
                             :date="t.date"
                             :animation="true"
                             :animation-duration="1500"
                             :animation-container="container"
                             >
        </vue-timeline-update>

    </div>

</template>

<script>

    import { Component, Prop, Vue } from 'nuxt-property-decorator';
    import VueTimeline from 'vuetimeline_custom_plus';

    @Component({
        name: 'Timeline',
    })
    export default class Timeline extends Vue {

       get container() {

          return this.$refs.container;

       }

        timeline = [

            {
                title: 'Narodziny Mikołaja Kopernika w Toruniu.',
                //description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                //thumbnail: 'https://images.unsplash.com/photo-1603989112393-db862d0176b4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
                date: new Date('19 lutego 1473'),
            },
            {
                title: 'Kopernik kończy studia na Akademii Krakowskiej.',
                date: new Date('1495'),
            },
            {
                title: 'Rozpoczyna studia prawnicze na Uniwersytecie w Bolonii.',
                date: new Date('1496'),
            },
            {
                title: 'Kopernik obejmuje kanonię warmińską.',
                date: new Date('20 października 1497'),
            },
            {
                title: 'Mikołaj Kopernik otrzymuje zgodę kapituły warmińskiej na dokończenie studiów. Dodatkowo rozpoczyna studia medyczne w Padwie.',
                date: new Date('1501'),
            },
            {
                title: 'Astronom uzyskuje dyplom doktora prawa kanonicznego i kończy drugi rok studiów medycznych, co daje mu prawo wykonywania praktyk lekarskich.',
                date: new Date('1503'),
            },
            {
                title: 'Pobyt na dworze biskupa warmińskiego w Lidzbarku Warmińskim.',
                date: new Date('1504-1509'),
            },
            {
                title: 'Kopernik przenosi się do Fromborka.',
                date: new Date('1510'),
            },
            {
                title: 'Na apel Soboru Laterańskiego astronom tworzy projekt reformy kalendarza.',
                date: new Date('1513'),
            },
            {
                title: 'Kopernik jest administratorem dóbr kapituły rezydującym w Olsztynie.',
                date: new Date('1516–1519'),
            },
            {
                title: 'Po wybuchu wojny polsko-krzyżackiej Kopernik uczestniczy w poselstwie do wielkiego mistrza krzyżackiego.',
                date: new Date('1520'),
            },
            {
                title: 'Astronom zostaje komisarzem Warmii, który ma dokonać rewindykacji zagrabionych przez Zakon posiadłości warmińskich.',
                date: new Date('1521'),
            },
            {
                title: 'Kopernik na Sejmie Stanów Pruskich w Grudziądzu występuje z mową „Skarga kapituły na mistrza Albrechta i jego zakon z powodu krzywd wyrządzonych w 1521 r. podczas zawieszenia broni”.',
                date: new Date('18 marca 1522'),
            },
            {
                title: 'Kopernik przez osiem miesięcy sprawuje urząd administratora biskupstwa warmińskiego.',
                date: new Date('1523'),
            },
            {
                title: 'Astronom pełni urząd kanclerza kapituły.',
                date: new Date('1524–1525'),
            },
            {
                title: 'Powstaje ostateczna wersja traktatu „Rozprawa o urządzeniu monety”.',
                date: new Date('1526'),
            },
            {
                title: 'Kopernik po raz ostatni jest kanclerzem kapituły warmińskiej.',
                date: new Date('1529'),
            },
            {
                title: 'Astronom staje się jednym z czterech kandydatów na biskupa warmińskiego.',
                date: new Date('1537'),
            },
            {
                title: 'Kopernik oddaje dzieło „O obrotach sfer niebieskich” do druku w Norymberdze.',
                date: new Date('1542'),
            },
            {
                title: 'Śmierć Mikołaja Kopernika we Fromborku.',
                date: new Date('1543'),
            },

        ]

    }

</script>
