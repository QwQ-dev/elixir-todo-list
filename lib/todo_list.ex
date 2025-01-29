defmodule TodoList do
  @moduledoc """
  一个简单的待办事项列表，我是 Elixir 初学者 xd.
  """

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

    - item: 待办事项

  ## Examples

      iex> TodoList.add("买牛奶")
      :ok

  """
  def add(item) do
    Agent.update(@todo_list, fn list -> [item | list] end)
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

    - item: 待办事项

  ## Examples

      iex> TodoList.delete("买牛奶")
      :ok

  """
  def delete(item) do
    Agent.update(@todo_list, fn list -> List.delete(list, item) end)
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
