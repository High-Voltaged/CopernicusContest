<template>

    <div class="flex flex-col items-center justify-center w-screen h-screen relative">

        <Categories v-if="edit_menu == 0" @edit="setEditMenu($event)" @setNewCategory="setNewCategory" :edit_menu="edit_menu"></Categories>

        <div v-else-if="edit_menu == 1" class="article-edit-sort flex flex-col space-y-6 bg-gray-main p-10 shadow-lg" style="border-radius: 15px">

            <div class="header flex justify-between items-center w-full space-x-4">

               <button @click="setMainMenu"
                        :class="{ 'hover:border-opacity-100': (edit_menu == 1) }"
                        class="flex items-center justify-center space-x-1 px-3 py-2 rounded-lg bg-transparent border-2 border-gray-primary border-opacity-75 transition duration-300 ease focus:outline-none">

                  <span class="text-xs text-gray-200 font-semibold text-left select-none">
                        {{ current_lang.menu }}
                  </span>

               </button>

               <button @click="removeCategory"
                        :class="{ 'hover:border-opacity-100': (edit_menu == 1) }"
                        class="flex items-center justify-center space-x-1 px-3 py-2 rounded-lg bg-transparent border-2 border-gray-primary border-opacity-75 transition duration-300 ease focus:outline-none">

                  <span class="text-xs text-gray-200 font-semibold text-left select-none">
                        {{ current_lang.remove }}
                  </span>

               </button>

            </div>

            <Category :category="categories[current]" :edit_menu="edit_menu">

               <template #input>

                  <input v-model="temp_category"
                           :placeholder="current_lang.input_category_name"
                           class="w-full md:w-64 bg-gray-tertiary bg-opacity-50 text-sm text-gray-200 py-2 px-4 overflow-hidden focus:bg-opacity-75 transition duration-200 ease focus:outline-none"
                           style="border-radius: 15px" />

               </template>

            </Category>

            <transition name="fade-out">

               <div v-if="error.value" class="flex items-center justify-center w-full px-2 mb-2">

                  <span class="text-center text-sm font-medium text-red-primary select-none">
                        {{ error.content }}
                  </span>

               </div>

            </transition>

            <div class="footer flex justify-center items-center w-full">

               <button @click="saveCategory"
                        class="flex items-center justify-center space-x-1 px-3 py-2 rounded-lg shadow bg-gray-primary bg-opacity-75 hover:bg-opacity-100 transition duration-300 ease focus:outline-none">

                  <span class="text-sm text-gray-200 font-medium text-left select-none">
                        {{ current_lang.save_the_category }}
                  </span>

               </button>

            </div>

        </div>

        <transition name="fade-out">

            <Notification v-if="notif.on"
                          :content="notif.content"
                          @click="closeNotification" />

        </transition>

        <transition name="scale-out">

            <VerificationDialog v-if="verify.on"
                                :content="verify.content"
                                @cancel="handleCancel"
                                @continue="handleContinue" />

        </transition>

    </div>

</template>

<script lang="ts">

    import { Component, Prop, Watch, Vue } from "nuxt-property-decorator";
    import ICategory from "~/interfaces/category";
    import ApiWrapper from '../../../scripts/api_wrapper';
    import { vxm } from '../../../store';

    import Categories from '../../categories/categories/Categories.vue';
    import Category from '../../categories/categories/Category.vue';
    import Notification from '../Notification.vue';
    import VerificationDialog from '../VerificationDialog.vue';
import { LangUtil } from "../../../scripts/lang/utils";

    @Component({
        name: "CategoriesEdit",
        components: {
            Categories,
            Category,
            VerificationDialog,
            Notification,
        }
    })
    export default class CategoriesEdit extends Vue {

        edit_menu = 0;
        new_category = false;

        @Watch('edit_menu')
        setEditMode() {

            this.notif.on = false;
            this.notif.content = '';

        }

        get init_categories() {

            return vxm.categories.getMainUtil.init_categories;

        }

        get categories() {

            return vxm.categories.getMainUtil.categories;

        }

        get current() {

            return vxm.categories.getMainUtil.current;

        }

        get current_lang() {

           return vxm.lang.getCurrentLangStrings;

        }

        setEditMenu(category_id: number) {

            this.edit_menu = 1;

            vxm.categories.setCurrent(category_id);

            this.temp_category = this.categories[this.current].name;

        }

        setMainMenu() {
           
           if (!this.checkSavedCategory()) {
              
              this.verify.content = this.current_lang.unsaved_question_confirm;
                this.verify.on = true;

            } else {
               
               this.$nuxt.$loading.start();
              
              this.edit_menu = 0;
              vxm.categories.resetCategories();

            }

        }

        async removeCategory() { 
           
           await ApiWrapper.deleteCategory(this.init_categories[this.current].id);
           
           this.edit_menu = 0;
           
           vxm.categories.removeCategory();
           vxm.categories.setInitConfig(this.deepCopyArray(this.categories));
        
        }


         setNewCategory() {

            this.new_category = true;

            vxm.categories.addCategory();

            this.temp_category = this.categories[this.current].name;

            this.edit_menu = 1;

        }

        // Handle Input

        temp_category = '';

         async saveCategory() {
            
            if (!this.temp_category) {

               vxm.categories.setValidationError({ value: true, content: this.current_lang.dont_leave_imput_empty });
            
            } else {
            
               vxm.categories.setValidationError({ value: false, content: '' });
               
               vxm.categories.setCategory(this.temp_category);
               vxm.categories.setInitConfig(this.deepCopyArray(this.categories));
               
               await ApiWrapper.insertCategory(this.init_categories[this.current].id, this.init_categories[this.current].name);
               
                if (this.new_category) {
                    
                    this.notif.content = this.current_lang.new_category_added;
               
               } else {

                    this.notif.content = this.current_lang.changes_saved;
               
               }
               
               this.notif.on = true;         
               
               this.new_category = false;
            
            }
        
        }

        deepCopyArray(inObject): ICategory[] {

            let outObject;
            let value;

            if ((typeof inObject != 'object') || (inObject == null)) {

                return inObject;

            }

            outObject = Array.isArray(inObject) ? [] : {};

            for (let i in inObject) {

                value = inObject[i];

                outObject[i] = this.deepCopyArray(value);

            }

            return outObject;

        }

        // Handle Validation


        get error() {

            return vxm.categories.getMainUtil.error;

        }

        checkSavedCategory(): boolean {

            vxm.categories.checkSavedCategory(this.temp_category);

            if (vxm.categories.getMainUtil.savedCategory) {

                return true;

            } else {

                return false;

            }

        }


        // Notification / Verification Dialog

        notif = {
            on: false,
            content: '',
        };

        verify = {
            on: false,
            content: '',
        }

        closeNotification() {

            this.notif.on = false;
            this.notif.content = '';

        }

        handleCancel() {

            this.verify.on = false;
            this.verify.content = '';

        }

        handleContinue() {

            this.edit_menu = 0;

            this.verify.on = false;
            this.verify.content = '';

            if (!this.temp_category && (this.init_categories[this.current])) {

                this.removeCategory();

            }

        }

        // Lifecycle Hooks

        async beforeMount() {

            vxm.categories.setEditMode(true);

            await vxm.categories.fetchCategories();
            vxm.categories.setInitConfig(this.deepCopyArray(this.categories));

            this.temp_category = this.categories[this.current].name;
            
        }

        beforeDestroy() {

            this.notif.on = false;
            this.notif.content = '';

            vxm.categories.resetCategories();
            vxm.categories.setEditMode(false);

        }

         destroyed() {

            this.$nuxt.$loading.start();

         }

    }

</script>