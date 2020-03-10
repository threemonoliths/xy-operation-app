defmodule ApiServer.Utils.Print do

  def print(everything) do
    IO.puts "@@@@@@@@@@ debug print start @@@@@@@@@@"
    IO.inspect everything
    IO.puts "@@@@@@@@@@ debug print end @@@@@@@@@@"
    everything
  end

   
end