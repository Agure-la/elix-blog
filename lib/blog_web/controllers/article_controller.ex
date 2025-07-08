defmodule BlogWeb.ArticleController do
    use BlogWeb, :controller

    def index(conn, _params) do
        articles = Blog.MyBlog.list_articles()
        render(conn, :index, articles: articles)
    end

    def show(conn, %{"id" => id}) do
        article = Blog.MyBlog.get_article!(id)
        render(conn, :show, article: article)
    end
end