defmodule ApiServer.UserAvatar do
  use Arc.Definition

  # Include ecto support (requires package arc_ecto installed):
  use Arc.Ecto.Definition
  import Ecto
  
  

  @versions [:original]
  @extension_whitelist ~w(.jpg .jpeg .png)

  # To add a thumbnail version:
  # @versions [:original, :thumb]
  # def acl(:thumb, _), do: :public_read

  # Whitelist file extensions:
  def validate({file, _}) do
  file_extension = file.file_name |> Path.extname |> String.downcase
    Enum.member?(@extension_whitelist, file_extension)
    # ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  # def transform(:original, _) do
  #   Base.decode64!(:original)
  # end

  # Define a thumbnail transformation:
  # def transform(:thumb, _) do
  
    # {:convert, fn(input, output) -> "inline:#{input} -format png #{output}" end, :png}
  # end

  # Override the persisted filenames:
  def filename(version, _) do
    version
  end

  # Override the storage directory:
  def storage_dir(_version, {_file, scope}) do
    "priv/static/files/user/#{scope.uuid}"
  end

end