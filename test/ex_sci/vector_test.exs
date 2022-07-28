defmodule ExSci.VectorTest do
  use ExUnit.Case

  alias ExSci.Vector

  describe "add!/2" do
    test "should only accept tuples of numbers" do
      assert catch_error(Vector.add!(1, 2))
      assert catch_error(Vector.add!("", ""))
      assert catch_error(Vector.add!([], []))
      assert catch_error(Vector.add!(%{}, %{}))
      assert catch_error(Vector.add!({}, {}))
      assert catch_error(Vector.add!({"s"}, {"s"}))
      assert Vector.add!({1.0}, {2.0})
      assert Vector.add!({1, 3}, {2, 3})
    end

    test "should not allow vectors of different sizes" do
      assert catch_error(Vector.add!({1, 2}, {2}))
      assert catch_error(Vector.add!({2}, {1, 2}))
    end

    test "should add each corresponding vector component" do
      assert(Vector.add!({0, 0}, {0, 0}) == {0, 0})
      assert(Vector.add!({1, 0}, {0, 0}) == {1, 0})
      assert(Vector.add!({0, 0}, {0, 1}) == {0, 1})
      assert(Vector.add!({1, 2, -3}, {4, -5, 6}) == {5, -3, 3})
    end
  end

  describe "dot_product!/2" do
    test "it adds the multiples of each corresponding component" do
      assert(Vector.dot_product!({0, 0}, {0, 0}) == 0)
      assert(Vector.dot_product!({1, 0}, {0, 0}) == 0)
      assert(Vector.dot_product!({1, 1}, {0, 0}) == 0)
      assert(Vector.dot_product!({1, 0}, {1, 0}) == 1)
      assert(Vector.dot_product!({0, 1}, {0, 1}) == 1)
      assert(Vector.dot_product!({1, 1}, {1, 1}) == 2)
      assert(Vector.dot_product!({1, 2, 0}, {3, -2, 1}) == -1)
      assert(Vector.dot_product!({1, 2}, {3, 4}) == 11)
    end
  end
end
