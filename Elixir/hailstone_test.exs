defmodule Learn.HailstoneTest do
  use ExUnit.Case
  alias Learn.Hailstone
  doctest Learn

  test "test hailstone" do
    assert Hailstone.hailstone(0) == []
    assert Hailstone.hailstone(1) == [1]
    assert Hailstone.hailstone(2) == [2, 1]
    assert Hailstone.hailstone(3) == [3, 10, 5, 16, 8, 4, 2, 1]
    assert Hailstone.hailstone(5) == [5, 16, 8, 4, 2, 1]
    assert Hailstone.hailstone(58) == [58, 29, 88, 44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
  end

  test "test hailstone_list" do
    assert Hailstone.hailstone_list(0, 0) == [[]]
    assert Hailstone.hailstone_list(5, 5) == [[5, 16, 8, 4, 2, 1]]
    assert Hailstone.hailstone_list(2, 3) == [[2, 1], [3, 10, 5, 16, 8, 4, 2, 1]]
    assert Hailstone.hailstone_list(1, 4) == [[1], [2, 1], [3, 10, 5, 16, 8, 4, 2, 1], [4, 2, 1]]
    assert Hailstone.hailstone_list(15, 21) == [[15, 46, 23, 70, 35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1],
                                               [16, 8, 4, 2, 1],
                                               [17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1],
                                               [18, 9, 28, 14, 7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1],
                                               [19, 58, 29, 88, 44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1],
                                               [20, 10, 5, 16, 8, 4, 2, 1],
                                               [21, 64, 32, 16, 8, 4, 2, 1]]
  end

  test "test hailstone_map" do
    assert Hailstone.hailstone_map(0, 0) == [[]]
    assert Hailstone.hailstone_map(5, 5) == [[5, 16, 8, 4, 2, 1]]
    assert Hailstone.hailstone_map(2, 3) == [[2, 1], [3, 10, 5, 16, 8, 4, 2, 1]]
    assert Hailstone.hailstone_map(1, 4) == [[1], [2, 1], [3, 10, 5, 16, 8, 4, 2, 1], [4, 2, 1]]
    assert Hailstone.hailstone_map(15, 21) == [[15, 46, 23, 70, 35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1],
                                               [16, 8, 4, 2, 1],
                                               [17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1],
                                               [18, 9, 28, 14, 7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1],
                                               [19, 58, 29, 88, 44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1],
                                               [20, 10, 5, 16, 8, 4, 2, 1],
                                               [21, 64, 32, 16, 8, 4, 2, 1]]
  end

end
