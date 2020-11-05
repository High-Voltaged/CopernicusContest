<!-- Timeline's layout and styles taken from @growthbunker (@growthbunker/vuetimeline and @growthbunker/stylesheets)  -->

<template>
   
   <article
      class="gb-vue-timeline-update js-vue-timeline-update"
      :class="['gb-vue-timeline-update--dark', { 'gb-vue-timeline-update--is-last': isLast } ]"
   >
   
      <div class="gb-vue-timeline-update__left">

         <span class="gb-vue-timeline-update__ago">
            {{ date }}
         </span>
         
      </div>

      <div class="gb-vue-timeline-update__center">

         <span class="gb-vue-timeline-update__bullet gb-base-number gb-base-number--blue gb-base-number--small gb-base-number--dark">

            <i class="gb-base-icon gb-base-number__icon" style="font-size: 16px"> {{ icon }} </i>

         </span>

         <span class="gb-vue-timeline-update__line"></span>

      </div>

      <div class="gb-vue-timeline-update__right">

         <div class="gb-vue-timeline-update__information">

            <div class="gb-vue-timeline-update__meta">

               <span class="gb-vue-timeline-update__ago">
                  {{ date }}
               </span>

            </div>

            <h2 v-html="title" class="gb-vue-timeline-update__title whitespace-pre-wrap"></h2>

         </div>

      </div>

   </article>

</template>

<script lang="ts">

   import { Component, Prop, Vue } from 'nuxt-property-decorator';
   
   @Component({
      name: 'Timeline',
   })

   export default class Timeline extends Vue {

      @Prop() private isLast: boolean;
      @Prop() private date: Date;
      @Prop() private icon: string;
      @Prop() private title: string;

   }

</script>

<style lang="scss">
   
// SCSS by @growthbunker (from @growthbunker/stylesheets) 

   // IMPORTS
   @import "node_modules/@growthbunker/stylesheets/settings/_colors.scss";
   @import "node_modules/@growthbunker/stylesheets/settings/_themes.scss";
   @import "node_modules/@growthbunker/stylesheets/tools/_functions.scss";
   @import "node_modules/@growthbunker/stylesheets/tools/_mixins.scss";
   @import "node_modules/@growthbunker/stylesheets/tools/_mq.scss";
   
   // VARIABLES
   $c: ".gb-vue-timeline-update";
   
   #{$c} {
      display: flex;
      overflow: hidden;
      text-align: left;
      
      a {
         text-decoration: underline;
      }

      #{$c}__left,
      #{$c}__right  {
         #{$c}__ago {
            font-size: 14px;
            user-select: none;
         }
      }

      #{$c}__left {
         display: none;
      }

      #{$c}__center {
         position: relative;
         flex: 0 0 auto;
         margin-right: 30px;
         margin-left: 16px;

         #{$c}__bullet {
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
         }

         #{$c}__line {
            display: inline-block;
            margin-top: 32px;
            width: 1px;
            height: 100%;
         }
      }

      #{$c}__right {
         flex: 1;
         padding-bottom: 40px;

         #{$c}__title,
         #{$c}__description {
            font-size: 16px;
            line-height: 26px;
         }

         #{$c}__information {
            display: flex;
            flex-direction: column;
            margin-top: 4px;
            #{$c}__meta {
               display: flex;
               align-items: center;
               margin-bottom: 10px;

               #{$c}__category {
                  align-self: flex-start;
                  flex: 0 0 auto;
                  margin-right: 10px;
               }

               #{$c}__ago {
                  line-height: 24px; // Size of the category to align horizontally
               }

            }

            #{$c}__title {
               flex: 1;
               margin: 0 0 4px;
               text-transform: uppercase;
               font-weight: bold;
               &--clickable {
                  cursor: pointer;
               }
            }
         }

         #{$c}__description {
            margin: 0;
         }
         #{$c}__thumbnail {
            box-sizing: border-box;
            margin: 6px 0 12px;
            max-width: 100%;
            border-width: 1px;
            border-style: solid;
            border-radius: 6px;
            transition: all 250ms linear;
            user-select: none;
            &--clickable {
            cursor: pointer;
            }
         }
         #{$c}__slot {
            margin-top: 20px;
         }
         &--clickable {
            cursor: pointer;
         }
      }

      // --> BOOLEANS <--
      &--is-last {
         #{$c}__right {
            padding-bottom: 20px;
         }
      }
      
      // --> THEMES <--
      @each $theme in $themes {
         $themeName: map-get($theme, "name");
         &--#{$themeName} {
            color: mdg($theme, "fonts", "default", "primary");
            
            a {
               color: mdg($theme, "fonts", "default", "primary");
            }
            
            #{$c}__left,
            #{$c}__right  {
               #{$c}__ago {
                  color: mdg($theme, "fonts", "default", "secondary");
               }
            }

            #{$c}__center {
               #{$c}__bullet {
                  box-shadow: 0 1px 5px 0 mdg($theme, "shadows", "default", "primary");
               }

               #{$c}__line {
                  background-color: mdg($theme, "borders", "default", "primary");
               }
            }

            #{$c}__right {
               #{$c}__information {
                  #{$c}__meta {
                     #{$c}__category {
                     box-shadow: 0 1px 5px 0 mdg($theme, "shadows", "default", "primary");
                     }
                  }
               }
               
               #{$c}__thumbnail {
                  border-color: mdg($theme, "borders", "reverse", "primary");
                  box-shadow: 0 1px 5px 0 mdg($theme, "shadows", "default", "primary");
               }
               #{$c}__description {
                  color: mdg($theme, "fonts", "default", "secondary");
               }
            }

            // --> BOOLEANS <--
            &#{$c}--is-last {
               #{$c}__center {
                  #{$c}__line {
                     background: linear-gradient(
                     mdg($theme, "borders", "default", "primary") 50%,
                     rgba(mdg($theme, "borders", "default", "primary"), 0)
                     );
                  }
               }
            }
         }
      }
   }

   // --> BREAKPOINT: TABLET <--
   @include mq($from: mobile) {
   
      #{$c} {
         #{$c}__left {
               display: block;
               flex: 0 0 auto;
               width: 120px;
               text-align: right;
               #{$c}__ago {
                  display: inline-block;
                  line-height: 32px; // Size of the badge to align horizontally
               }
         }

         #{$c}__center {
            margin-right: 40px;
            margin-left: 40px;
         }

         #{$c}__right {
            #{$c}__title,
            #{$c}__description {
               font-size: 18px;
               line-height: 28px;
            }

            #{$c}__information {
               flex-direction: row;
               #{$c}__meta {
                  #{$c}__ago {
                     display: none;
                  }
               }

               #{$c}__title {
                  margin-bottom: 8px;
               }
            }

            #{$c}__thumbnail {
               margin: 8px 0 16px;
            }

         }
      }

      $c: ".gb-base-number";
      $colors: "black", "blue", "green", "orange", "purple", "red", "turquoise", "white";
      
      #{$c} {
         display: flex;
         align-items: center;
         justify-content: center;
         box-sizing: border-box;
         border-width: 3px;
         border-style: solid;
         border-radius: 100%;
         background-size: cover;
         user-select: none;
         
         #{$c}__number {
            font-weight: 800;
         }

         // --> SIZES <--
         &--small {
            width: 32px;
            height: 32px;
            font-size: 14px;
         }
         &--default {
            width: 40px;
            height: 40px;
            font-size: 16px;
         }

         // --> THEMES <--
         @each $theme in $themes {
            $themeName: map-get($theme, "name");
            &--#{$themeName} {
               box-shadow: 0 1px 5px 0 mdg($theme, "shadows", "default", "primary");
               color: mdg($theme, "fonts", "default", "primary");
               // --> COLORS <--
               @each $color in $colors {
                  &#{$c}--#{$color} {
                     border-color: mdg($theme, "colors", $color);
                  }
               }
            }
         }
      }

      $c: ".gb-base-icon";
      
      #{$c} {
         display: inline-block;
         outline: 0;
         border-radius: 2px;
         color: inherit;
         text-transform: none;
         text-rendering: optimizeLegibility;
         white-space: nowrap;
         word-wrap: normal;
         letter-spacing: normal;
         font-weight: normal;
         font-style: normal;
         font-family: "Material Icons";
         font-feature-settings: "liga";
         line-height: 1;
         direction: ltr;
         user-select: none;
         -webkit-font-smoothing: antialiased;
         @include no-tap-highlight-color;
      
         // --> BOOLEANS <--
         &--clickable {
            cursor: pointer;
         }
      
         &--outlined {
            font-family: "Material Icons Outlined";
         }
      }
   
   }

   @font-face {
      font-weight: 400;
      font-style: normal;
      font-family: "Material Icons";
      src: url("https://fonts.gstatic.com/s/materialicons/v47/flUhRq6tzZclQEJ-Vdg-IuiaDsNcIhQ8tQ.woff2") format("woff2");
   }

</style>