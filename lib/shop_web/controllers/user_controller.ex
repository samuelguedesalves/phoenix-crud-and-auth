defmodule ShopWeb.UserController do
  use ShopWeb, :controller

  alias Shop.User.Get

  def create(conn, params) do
    case Get.call(params) do
      {:ok, data} -> conn |> put_status(:ok) |> json(data)
      {:bad_request, message} -> conn |> put_status(:bad_request) |> json(%{"error" => %{"message" => message}})
    end
  end
end
