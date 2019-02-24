defmodule FetchFiles do
  def list_all(filepath) do
    _list_all(filepath)
  end

  defp _list_all(filepath) do
    cond do
      String.contains?(filepath, [".git", "_test"]) -> []
      true -> expand(File.ls(filepath), filepath)
    end
  end

  defp expand({:ok, files}, path) do
    files
    |> Enum.flat_map(&_list_all("#{path}/#{&1}"))
  end

  defp expand({:error, _}, path) do
    if String.contains?(path, ".ex") and !String.contains?(path, ".exs") do
      [path]
    else
      []
    end
  end
end
