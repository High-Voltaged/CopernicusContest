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

    function validateUpdatedArticleDetails(new_title: string, new_content: string): boolean {

        if (!((new_title.length >= Limits.min_title_length) && (new_title.length <= Limits.max_title_length))) {
            return false;
        }

        if (!((new_content.length >= Limits.min_content_length) && (new_content.length <= Limits.max_content_length))) {
            return false;
        }

        return true;

    }

    function validateNewArticleDetails(title: string, content: string, picture_link: string, important: number): boolean {

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

        if ((await validateSession(getSessionToken(raw_cookie))) && (validateNewArticleDetails(title, content, picture_link, important))) {

            await Queries.insertArticle(title, content, picture_link, important, category_id);

            return Codes.SUCCESS;

        } else {

            return Codes.INVALID_SESSION;

        }

    }

    export async function editArticle(raw_cookie: string, article_id: number, new_title: string, new_content: string): Promise<Codes> {

        if ((await validateSession(getSessionToken(raw_cookie))) && (validateUpdatedArticleDetails(new_title, new_content))) {

            await Queries.updateArticle(article_id, new_title, new_content);

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


};

export default Utils;