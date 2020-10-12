import IBriefArticle from "./brief_article";
import ICategory from "./category";

export default interface IFullArticle extends IBriefArticle {
    category: ICategory,
}