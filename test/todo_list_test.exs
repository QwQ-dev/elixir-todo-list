defmodule TodoListTest do
  use ExUnit.Case
  doctest TodoList

  setup do
    # 启动 Agent
    TodoList.start_link()
    # 清空待办事项列表
    TodoList.delete_all()
    :ok
  end

  test "添加待办事项" do
    assert TodoList.add("买牛奶") == :ok
    assert TodoList.all() == ["买牛奶"]
  end

  test "获取所有待办事项" do
    TodoList.add("买牛奶")
    TodoList.add("买面包")
    assert TodoList.all() == ["买面包", "买牛奶"]
  end

  test "删除待办事项" do
    TodoList.add("买牛奶")
    TodoList.add("买面包")
    assert TodoList.delete("买牛奶") == :ok
    assert TodoList.all() == ["买面包"]
  end
end
