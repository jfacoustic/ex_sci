defmodule ExSci.Vector do
  @moduledoc """
  Common vector operations
  """

  @spec add!(tuple, tuple) :: tuple
  def add!(a, b)
      when is_tuple(a) and is_tuple(b) and tuple_size(a) == tuple_size(b) and tuple_size(a) > 0 do
    Tuple.to_list(a)
    |> Enum.each(fn i -> unless is_number(i), do: raise("vectors should only have numbers") end)

    Tuple.to_list(b)
    |> Enum.each(fn i -> unless is_number(i), do: raise("vectors should only have numbers") end)

    [Tuple.to_list(a), Tuple.to_list(b)]
    |> Enum.zip()
    |> Enum.map(&Tuple.sum/1)
    |> List.to_tuple()
  end
end
