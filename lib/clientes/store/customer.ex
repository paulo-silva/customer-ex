defmodule Clientes.Store.Customer do
  @moduledoc """
  Customer schema.
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  # Estrutura
  @type t() :: %Customer{}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @timestamps_opts [type: :utc_datetime_usec]

  schema "customers" do
    field :name, :string
    field :email, :string
    field :cpf, :string
    field :phone, :string
    field :birthdate, :string
    field :address_id, :string
  end

  @required_fields ~w(name emil cpf phone birthdate address_id)a
  @castable_fields @required_fields
  def changeset(address \\ %Customer{}, attrs) do
    address
    |> cast(attrs, @castable_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(~w(email)a)
    |> unique_constraint(~w(cpf)a)
    |> unique_constraint(~w(phone)a)
  end
end
