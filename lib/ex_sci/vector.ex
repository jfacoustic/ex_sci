defmodule ExSci.Vector do
  @moduledoc """
  Common vector operations.  Each vector is represented by a tuple of numbers.
  """
  defguardp params_are_vectors(a, b)
            when is_tuple(a) and is_tuple(b) and tuple_size(a) == tuple_size(b) and
                   tuple_size(a) > 0

  @doc """
  Adds two vectors together, returning a new vector

  ## Example

    ```
    iex> ExSci.Vector.add!({1,2}, {3,4})
    {4, 6}
    ```
  """
  @spec add!(tuple, tuple) :: tuple
  def add!(a, b) when params_are_vectors(a, b) do
    Tuple.to_list(a)
    |> Enum.each(fn i -> unless is_number(i), do: raise("vectors should only have numbers") end)

    Tuple.to_list(b)
    |> Enum.each(fn i -> unless is_number(i), do: raise("vectors should only have numbers") end)

    [Tuple.to_list(a), Tuple.to_list(b)]
    |> Enum.zip()
    |> Enum.map(&Tuple.sum/1)
    |> List.to_tuple()
  end

  @doc """
  Calculates the dot product between two vectors

  ## Example

    ```
    iex> ExSci.Vector.dot_product!({1,2}, {3,4})
    11
    ```
  """
  @spec dot_product!(tuple, tuple) :: number
  def dot_product!(a, b) when params_are_vectors(a, b) do
    Tuple.to_list(a)
    |> Enum.each(fn i -> unless is_number(i), do: raise("vectors should only have numbers") end)

    Tuple.to_list(b)
    |> Enum.each(fn i -> unless is_number(i), do: raise("vectors should only have numbers") end)

    [Tuple.to_list(a), Tuple.to_list(b)]
    |> Enum.zip()
    |> Enum.map(&Tuple.product/1)
    |> Enum.sum()
  end
end
