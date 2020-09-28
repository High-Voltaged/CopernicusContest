<template>

    <div v-if="category">

        <div @click="viewCategory">

            <span>

                <p class="noselect"> {{ category.Name }} </p>

            </span>

        </div>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Vue } from 'nuxt-property-decorator';

    @Component({
        name: "Category",
    })
    export default class Category extends Vue {

        @Prop() private category;

        viewCategory(): void {

            this.$router.push("/category/" + this.category.ID);

        }

    }

</script>