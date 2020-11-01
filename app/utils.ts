import * as bcrypt from "bcrypt"
import Queries from "../database/queries";
import { Request, Response } from "Express";
import Codes from "./codes";
import { Limits } from "./limits";
import * as crypto from "crypto";
import IQuizAnswer from "../interfaces/quiz_answer";
import IQuizQuestion from "../interfaces/quiz_question";

export namespace Utils {

    function generateToken() {
        // Generates 64, each byte has two characters
        return crypto.randomBytes(32).toString('hex');
    }

    function getSessionToken(raw_cookie: string) {

        let cookies: string[] = raw_cookie.split("; ");

        let session_token: string;

        for (let cookie of cookies) {

            let cookie_split = cookie.split("=");

            if (cookie_split[0].toLowerCase() == "session-token") {

                session_token = cookie_split[1];

                return session_token;

            }

        }

        return session_token;

    }

    function validateCategory(category_name: string): boolean {

        if (!((category_name.length >= Limits.min_category_length) && (category_name.length <= Limits.max_category_length))) {
            return false;
        }

        return true;

    }

    function validateArticleDetails(title: string, content: string, picture_link: string, important: number): boolean {

        if (!((title.length >= Limits.min_title_length) && (title.length <= Limits.max_title_length))) {
            return false;
        }

        if (!((content.length >= Limits.min_content_length) && (content.length <= Limits.max_content_length))) {
            return false;
        }

        if (!((important >= 0) && (important <= 1))) {
            return false;
        }

        if (!(picture_link.length <= Limits.max_picture_length)) {
            return false;
        }

        return true;

    }

    function validateQuizQuestionDetails(question: IQuizQuestion): boolean {

        if (!((question.question.length >= Limits.min_question_length) && (question.question.length <= Limits.max_question_length))) {
            return false;
        }

        let found: boolean = false;

        if (!((question.answers.length >= Limits.min_amount_of_answers) && (question.answers.length <= Limits.max_amount_of_answers))) {
            return false;
        }

        // Check whether each answers fits the appropriate length boundaries and also check if it has an answer that has ID of correct_answer_id
        for (let answer of question.answers) {

            if (!((answer.answer.length >= Limits.min_answer_length) && (answer.answer.length <= Limits.max_answer_length))) {
                return false;
            }

            if (question.correct_answer_id == answer.id) {
                found = true;
            }

        }

        if (!found) {
            return false;
        }

        return true;

    }

    async function validateSession(session_token: string): Promise<boolean> {

        console.log(session_token);

        let result = await Queries.querySession(session_token);

        if (result[0]) {

            return true;

        } else {

            return false;

        }

    }

    export async function processAdminLogin(res: Response, username: string, password: string): Promise<Codes> {

        let result = await Queries.queryAdminByUsername(username);

        if (!result[0]) {

            return Codes.ERROR;

        }

        if (await bcrypt.compare(password, result[0].password)) {

            let session_key: string = generateToken();

            await Queries.insertSession(result[0].id, session_key);

            res.cookie("session-token", session_key);

            return Codes.SUCCESS;

        }

    }

    export async function insertArticle(raw_cookie: string, title: string, content: string, picture_link: string, important: number, category_id: number): Promise<Codes> {

        console.log(title);

        if ((await validateSession(getSessionToken(raw_cookie))) && (validateArticleDetails(title, content, picture_link, important))) {

            await Queries.insertArticle(title, content, picture_link, important, category_id);

            return Codes.SUCCESS;

        } else {

            return Codes.INVALID_SESSION;

        }

    }

    export async function editArticle(raw_cookie: string, article_id: number, title: string, content: string, picture_link: string, important: number, category_id: number): Promise<Codes> {

        if ((await validateSession(getSessionToken(raw_cookie))) && (validateArticleDetails(title, content, picture_link, important))) {

            await Queries.updateArticle(article_id, title, content, picture_link, important, category_id);

            return Codes.SUCCESS;

        } else {

            return Codes.INVALID_SESSION;

        }

    }

    export async function deleteArticle(raw_cookie: string, article_id: number) {

        if (await validateSession(getSessionToken(raw_cookie))) {

            await Queries.deleteArticle(article_id);

            return Codes.SUCCESS;

        } else {

            return Codes.INVALID_SESSION;

        }

    }

    export async function fetchEditArticleList(raw_cookie: string): Promise<any> {

        if (await validateSession(getSessionToken(raw_cookie))) {

            return await Queries.fetchEditArticleList();

        } else {

            return Codes.INVALID_SESSION;

        }

    }

    export async function fetchEditQuizQuestions(raw_cookie: string): Promise<any> {

        if (await validateSession(getSessionToken(raw_cookie))) {

            return await Queries.fetchEditQuizQuestions();

        } else {

            return Codes.INVALID_SESSION;

        }

    }

    export async function deleteQuizQuestion(raw_cookie: string, question_id: number): Promise<any> {

        if (await validateSession(getSessionToken(raw_cookie))) {

            await Queries.deleteQuizQuestion(question_id);

            return Codes.SUCCESS;

        } else {

            return Codes.INVALID_SESSION;

        }

    }

    // Validates the session and returns an appropriate code
    export async function validateSessionCode(raw_cookie: string): Promise<Codes> {

        if (await validateSession(getSessionToken(raw_cookie))) {

            return Codes.SUCCESS;

        } else {

            return Codes.INVALID_SESSION;

        }

    }

    export async function fetchArticleStealth(raw_cookie: string, article_id: number): Promise<Codes> {

        if (await validateSession(getSessionToken(raw_cookie))) {

            return await Queries.fetchArticle(article_id);

        } else {

            return Codes.INVALID_SESSION;

        }

    }

    export async function updateQuizQuestion(raw_cookie: string, question: IQuizQuestion): Promise<Codes> {

        if (await validateSession(getSessionToken(raw_cookie)) && validateQuizQuestionDetails(question)) {

            await Queries.updateQuizQuestion(question);

            return Codes.SUCCESS;

        } else {

            return Codes.INVALID_SESSION;

        }

    }

    export async function insertQuizQuestion(raw_cookie: string, question: IQuizQuestion): Promise<Codes> {

        if (await validateSession(getSessionToken(raw_cookie)) && validateQuizQuestionDetails(question)) {

            await Queries.insertQuizQuestion(question);

            return Codes.SUCCESS;

        } else {

            return Codes.INVALID_SESSION;

        }

    }

    export async function insertCategory(raw_cookie: string, category_id: number, category_name: string): Promise<Codes> {

        if (await validateSession(getSessionToken(raw_cookie)) && validateCategory(category_name)) {

            // If it is not in the database already
            if (category_id < 0) {

                console.log("1");

                await Queries.insertCategory(category_name);
                
            } else {

                console.log("2");

                await Queries.updateCategory(category_id, category_name);

            }

            return Codes.SUCCESS;

        } else {

            return Codes.INVALID_SESSION;

        }

    }

    /*export async function editCategory(raw_cookie: string, category_id: number, category_name: string): Promise<Codes> {

        if (await validateSession(getSessionToken(raw_cookie)) && validateCategory(category_name)) {

            await Queries.editCategory(category_id, category_name);

            return Codes.SUCCESS;

        } else {

            return Codes.INVALID_SESSION;

        }

    }*/

    export async function deleteCategory(raw_cookie: string, category_id: number): Promise<Codes> {

        if (await validateSession(getSessionToken(raw_cookie))) {

            await Queries.deleteCategory(category_id);

            return Codes.SUCCESS;

        } else {

            return Codes.INVALID_SESSION;

        }

    }

};

export default Utils;