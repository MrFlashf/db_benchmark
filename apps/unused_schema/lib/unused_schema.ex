defmodule UnusedSchema do
  # Przyjmij plik ze schema i przeczytaj pola
  # Przeszukaj pliki w poszukiwaniu pól z tej schema

  def run(file, path) do
    {:ok, data} = load_schema(file)

    files_to_check = FetchFiles.list_all(path)


  end

  @spec load_schema(String.t()) :: any()
  defp load_schema(file) do
    # Add check whether file contains schema

    stream = File.stream!(file)
    name = get_schema_name(stream)
    fields = get_schema_fields(stream)
    {:ok, %{
      schema_name: name,
      schema_fields: fields
    }}
  end

  @spec get_schema_name(%File.Stream{}) :: String.t()
  def get_schema_name(stream) do
    stream
    |> Enum.filter(&String.contains?(&1, "defmodule"))
    |> Enum.map(&String.trim(&1))
    |> Enum.map(&String.replace(&1, ~r/ |defmodule|do/, ""))
    |> List.first()
  end

  @spec get_schema_fields(%File.Stream{}) :: [String.t()]
  def get_schema_fields(stream) do
    # Add relations
    stream
    |> Enum.filter(&String.contains?(&1, "field"))
    |> Enum.map(&String.trim(&1))
    |> Enum.map(&String.replace(&1, ~r/ |field|\(|\)|:/, ""))
    |> Enum.map(&String.split(&1, ","))
    |> Enum.map(&List.first(&1))
  end
end
