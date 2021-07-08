defmodule Shop.User.Get do
  alias Shop.Repo
  alias Shop.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_response()
  end

  def handle_response({:error, _data}) do
    {:bad_request, "Error in register"}
  end

  def handle_response({:ok, data}) do
    data |> IO.inspect()
    {:ok, %{"email" => data["email"]}}
  end
end
