defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item {
      id: 1,
      title: "My first item",
      description: "A tasty item sure to please",
      ends_at: ~N[2020-01-01 00:00:00]
    },
    %Item {
      id: 2,
      title: "Wargames Bluray",
      description: "The best computer movie of all time",
      ends_at: ~N[2018-10-15 13:39:00]
    },
    %Item {
      id: 3,
      title: "U2 - Achtung Baby on CD",
      description: "The sound of 4 men chopping down the Joshua Tree",
      ends_at: ~N[2018-11-05 03:39:00]
    }
  ]

  def all(Item), do: @items

  def get!(Item, id) do
    Enum.find(@items, fn item -> item.id === id end)
  end

  def get_by(Item, attrs) do
    Enum.find(@items, fn item ->
      Enum.all?(Map.keys(attrs), fn key ->
        Map.get(item, key) === attrs[key]
      end)
    end)
  end
end
