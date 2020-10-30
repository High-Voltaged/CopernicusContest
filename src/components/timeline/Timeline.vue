<template>
   
   <div class="flex flex-col items-center justify-center w-full mt-16">

      <vue-timeline-update
         v-for="(t, i) in timeline"
         :key="i"
         icon="code"
         :title="t.title"
         :description="t.description"
         :thumbnail="t.thumbnail"
         :date="t.date"
      ></vue-timeline-update>

   </div>

</template>

<script>

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   import VueTimeline from '@growthbunker/vuetimeline';

   @Component({
      name: 'Timeline',
   })

   export default class Timeline extends Vue {

      timeline = [

         { 
            title: 'This title here', 
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit',  
            thumbnail: 'https://images.unsplash.com/photo-1603989112393-db862d0176b4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
            date: new Date('1892'),
         },
         { 
            title: 'The other title here', 
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit',  
            thumbnail: 'https://images.unsplash.com/photo-1585522334390-a0b28cff49c9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
            date: new Date('1882'),
         },
         { 
            title: 'Some new title', 
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque et suscipit tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit',  
            thumbnail: 'https://images.unsplash.com/photo-1582490841511-81e1363fb48c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
            date: new Date('1845'),
         },

      ]

   }

</script>
