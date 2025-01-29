defmodule TodoListTest do
  use ExUnit.Case
  alias TodoList

  setup do
    # 在每个测试之前启动待办事项列表
    TodoList.start_link()
    # 清空待办事项列表
    TodoList.delete_all()
    :ok
  end

  test "添加待办事项" do
    assert TodoList.add("买牛奶") == :ok
    assert TodoList.all() == [%TodoStruct{title: "买牛奶", completed: false}]
  end

  test "获取所有待办事项" do
    TodoList.add("买牛奶")
    TodoList.add("买面包")

    assert TodoList.all() == [
             %TodoStruct{title: "买面包", completed: false},
             %TodoStruct{title: "买牛奶", completed: false}
           ]
  end

  test "删除待办事项" do
    TodoList.add("买牛奶")
    TodoList.add("写代码")

    assert TodoList.all() == [
             %TodoStruct{title: "写代码", completed: false},
             %TodoStruct{title: "买牛奶", completed: false}
           ]

    TodoList.delete("买牛奶")
    assert TodoList.all() == [%TodoStruct{title: "写代码", completed: false}]
  end

  test "删除不存在的待办事项" do
    TodoList.add("买牛奶")
    TodoList.delete("不存在的事项")
    assert TodoList.all() == [%TodoStruct{title: "买牛奶", completed: false}]
  end

  test "删除所有待办事项" do
    TodoList.add("买牛奶")
    TodoList.add("写代码")
    TodoList.delete_all()
    assert TodoList.all() == []
  end
end
