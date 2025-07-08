defmodule BlogWeb.ArticleController do
    use BlogWeb, :controller

    def index(conn, _params) do
        articles = Blog.MyBlog.list_articles()
        render(conn, :index, articles: articles)
    end
end