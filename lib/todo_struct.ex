defmodule TodoStruct do
  defstruct [:title, completed: false]

  @spec new(String.t()) :: %TodoStruct{completed: boolean(), title: String.t()}
  @doc """
  创建一个新的事项。
  如果标题不是字符串或为空，则抛出异常。

  ## Parameters

    - title: 事项的标题

  ## Examples

      iex> TodoStruct.new("买牛奶")
      %TodoStruct{title: "买牛奶", completed: false}

      iex> TodoStruct.new("")
      ** (ArgumentError) Title must be a non-empty string

  """
  def new(title) when is_binary(title) and title != "" do
    %TodoStruct{title: title}
  end

  # 运行时异常抛出
  def new(_), do: raise(ArgumentError, "Title must be a non-empty string")
end
