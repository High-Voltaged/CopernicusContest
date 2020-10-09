import IBriefArticle from "./brief_article";

export default interface IDigestArticle extends IBriefArticle {
    short_description: string;
}