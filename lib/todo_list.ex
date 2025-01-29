defmodule TodoList do
  @moduledoc """
  一个简单的待办事项列表，我是 Elixir 初学者 xd.
  """

  # 引入 TodoStruct 模块
  alias TodoStruct

  # 用于存储待办事项的状态
  @todo_list :todo_list_agent

  @spec start_link() :: {:error, any()} | {:ok, pid()}
  @doc """
  启动待办事项列表。
  """
  def start_link do
    Agent.start(fn -> [] end, name: @todo_list)
  end

  @spec add(any()) :: :ok
  @doc """
  添加待办事项。

  ## Parameters

    - title: 待办事项

  ## Examples

      iex> TodoList.add("买牛奶")
      :ok

  """
  def add(title) do
    Agent.update(@todo_list, fn list -> [TodoStruct.new(title) | list] end)
  end

  @spec all() :: any()
  @doc """
  获取所有待办事项。

  ## Examples

      iex> TodoList.add("买牛奶")
      :ok
      iex> TodoList.all()
      ["买牛奶"]

  """
  def all do
    Agent.get(@todo_list, fn list -> list end)
  end

  @spec delete(any()) :: :ok
  @doc """
  删除待办事项。

  ## Parameters

    - item: 待办事项的标题

  ## Examples

      iex> TodoList.delete("买牛奶")
      :ok

  """
  def delete(title) do
    Agent.update(@todo_list, fn list ->
      # 过滤掉与给定标题匹配的事项
      Enum.filter(list, fn item -> item.title != title end)
    end)
  end

  @spec delete_all() :: :ok
  @doc """
  删除所有待办事项。

  ## Examples

      iex> TodoList.delete_all()
      :ok
  """
  def delete_all do
    Agent.update(@todo_list, fn _ -> [] end)
  end
end
