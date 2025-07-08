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

    def new(conn, _params) do
        changeset = Blog.MyBlog.change_article(%Article{})
        render(conn, :new, changeset: changeset)
    end

    def create(conn, _params) do
        case Blog.MyBlog.create_article(%{title: "...", body: "..."}) do
            {:ok, article} ->
            conn
            |> put_flash(:info, "Article created successfully.")
            |> redirect(to: ~p"/articles/#{article})

            {:error, %Ecto.changeset{} = changeset} ->
            render(conn, :new, changeset: changeset)
        end
    end
end