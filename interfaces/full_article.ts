import IBriefArticle from "./brief_article";

export default interface IFullArticle extends IBriefArticle {
    category_id: number,
}