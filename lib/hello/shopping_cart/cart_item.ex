defmodule Hello.ShoppingCart.CartItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cart_items" do
    field :price_when_carted, :decimal
    field :quantity, :integer

    belongs_to :cart, Hello.ShoppingCart.Cart
    belongs_to :product, Hello.Catalog.Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cart_item, attrs) do
    cart_item
    |> cast(attrs, [:price_when_carted, :quantity, :cart_id, :product_id])
    |> validate_required([:price_when_carted, :quantity, :cart_id, :product_id])
    |> unique_constraint([:cart_id, :product_id], name: :cart_product_unique_constraint)

    # |> cast(attrs, [:price_when_carted, :quantity])
    # |> validate_required([:price_when_carted, :quantity])
    # |> validate_number(:quantity, greater_than_or_equal_to: 0, less_than: 100)
  end
end
