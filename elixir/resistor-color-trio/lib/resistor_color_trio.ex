defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do

    [color1, color2, color3 | _ ] = colors
    l = [:black, :brown, :red, :orange, :yellow, :green, :blue, :violet, :grey, :white]
    num1 = Enum.find_index(l, fn x -> x == color1 end)
    num2 = Enum.find_index(l, fn x -> x == color2 end)
    num3 = Enum.find_index(l, fn x -> x == color3 end)
    resistance = (num1*10 + num2)*(10**num3)

    cond do
      resistance == 0 -> {0, :ohms}
      rem(resistance, 10**9) == 0 -> {div(resistance, 10**9), :gigaohms}
      rem(resistance, 10**6) == 0-> {div(resistance, 10**6), :megaohms}
      rem(resistance, 10**3) == 0 -> {div(resistance, 10**3), :kiloohms}
      true -> {resistance, :ohms}
    end
  end
end
