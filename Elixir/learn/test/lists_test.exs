defmodule Learn.ListsTest do
  use ExUnit.Case
  alias Learn.Lists

  test "test swapper" do
    assert Lists.swapper([], :a, :b) == []
    assert Lists.swapper([:x, :y, :z], :a, :b) == [:x, :y, :z]
    assert Lists.swapper([:a, :b, :c, :b, :d], :a, :b) == [:b, :a, :c, :a, :d]
  end

  test "test invert_pairs" do
    assert Lists.invert_pairs([]) == []
    assert Lists.invert_pairs([{1, 2}]) == [{2, 1}]
    assert Lists.invert_pairs([{1, 2}, {:a, :b}, {"Monday", "Tuesday"}]) ==
      [{2, 1}, {:b, :a}, {"Tuesday", "Monday"}]
  end

  test "test deep_reverse" do
    assert Lists.deep_reverse([]) == []
    assert Lists.deep_reverse([1, 2, 3, 4, 5, 6]) == [6, 5, 4, 3, 2, 1]
    assert Lists.deep_reverse([[1, 2, 3], [4, 5, 6], [:a, :b, :c]]) ==
      [[:c, :b, :a], [6, 5, 4], [3, 2, 1]]
    assert Lists.deep_reverse([[1, 2, 3], [["one", "two"], ["three", "four"]], [4, 5, 6], [:a, :b, :c]]) ==
      [[:c, :b, :a], [6, 5, 4], [["four", "three"], ["two", "one"]], [3, 2, 1]]
  end

  test "test mean" do
    assert Lists.mean([]) == 0
    assert Lists.mean([6]) == 6
    assert Lists.mean([1.7, 4.5, 0, 2.0, 3.4, 5, 2.5, 2.2, 1.2]) == 2.5
    assert Lists.mean([5, 6, 1, 6, 0, 1, 2]) == 3.0
  end

  test "test std_dev" do
    assert Lists.std_dev([]) == 0
    assert Lists.std_dev([4, 8, 15, 16, 23, 42]) == 12.315302134607444
    assert Lists.std_dev([9, 2, 5, 4, 12, 7, 8, 11, 9, 3, 7, 4, 12, 5, 4, 10, 9, 6, 9, 4]) ==
      2.9832867780352594
  end

end
