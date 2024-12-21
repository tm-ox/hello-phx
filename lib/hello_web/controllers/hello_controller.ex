defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    # render(conn, :index)
    conn
    |> put_layout(html: :admin)
    |> render(:index)
  end

  def show(conn, %{"messenger" => messenger}) do
    # render(conn, :show, messenger: messenger)
    # text(conn, "From messenger #{messenger}")
    # json(conn, %{id: messenger})
    conn
    |> put_layout(html: :admin)
    |> render(:show, messenger: messenger, receiver: "Dweezil")
  end
end
