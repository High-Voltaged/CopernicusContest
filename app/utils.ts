import * as bcrypt from "bcrypt"
import Queries from "../database/queries";
import { Request, Response } from "Express";
import Codes from "./codes";
import * as crypto from "crypto";

const min_title_length: number = 1;
const max_title_length: number = 100;

const min_content_length: number = 100;
const max_content_length: number = 10000000;

const max_picture_length: number = 255;

export namespace Utils {

    function generateToken() {
        // Generates 64, each byte has two characters
        return crypto.randomBytes(32).toString('hex');
    }

    function getSessionToken(req: Request) {

        let cookies: string[] = req.headers.cookie.split("; ");

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

        if (!((new_title.length >= min_title_length) && (new_title.length <= max_title_length))) {
            return false;
        }

        if (!((new_content.length >= min_content_length) && (new_content.length <= max_content_length))) {
            return false;
        }

        return true;

    }

    function validateNewArticleDetails(title: string, content: string, picture_link: string, important: number): boolean {

        if (!((title.length >= min_title_length) && (title.length <= max_title_length))) {
            return false;
        }

        if (!((content.length >= min_content_length) && (content.length <= max_content_length))) {
            return false;
        }

        if (!((important >= 0) && (important <= 1))) {
            return false;
        }

        if (!(picture_link.length <= max_picture_length)) {
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

    export async function editArticle(req: Request, article_id: number, new_title: string, new_content: string): Promise<Codes> {

        if ((await validateSession(getSessionToken(req))) && (validateUpdatedArticleDetails(new_title, new_content))) {

            await Queries.updateArticle(article_id, new_title, new_content);

            return Codes.SUCCESS;

        } else {

            return Codes.ERROR;

        }

    }

    export async function insertArticle(req: Request, title: string, content: string, picture_link: string, important: number, category_id: number): Promise<Codes> {

        if ((await validateSession(getSessionToken(req))) && (validateNewArticleDetails(title, content, picture_link, important))) {

            await Queries.insertArticle(title, content, picture_link, important, category_id);

            return Codes.SUCCESS;

        } else {

            return Codes.ERROR;

        }

    }

};

export default Utils;