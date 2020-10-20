export namespace Limits {

    // For Article Editing
    export const min_title_length: number = 1;
    export const max_title_length: number = 100;

    export const min_content_length: number = 100;
    export const max_content_length: number = 10000000;

    export const max_picture_length: number = 255;

    // For Quiz Editing
    export const min_question_length: number = 1;
    export const max_question_length: number = 255;

    export const min_answer_length: number = 1;
    export const max_answer_length: number = 255;

    export const min_amount_of_answers: number = 1;
    export const max_amount_of_answers: number = 4;

};
