defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    earth_years = seconds/31_557_600
    case planet do
      :mercury -> {:ok, Float.round(earth_years/0.2408467, 2)}
      :venus -> {:ok, Float.round(earth_years/0.61519726, 2)}
      :earth -> {:ok, Float.round(earth_years, 2)}
      :mars -> {:ok, Float.round(earth_years/1.8808158, 2)}
      :jupiter -> {:ok, Float.round(earth_years/11.862615, 2)}
      :saturn -> {:ok, Float.round(earth_years/29.447498, 2)}
      :uranus -> {:ok, Float.round(earth_years/84.016846, 2)}
      :neptune -> {:ok, Float.round(earth_years/164.79132, 2)}
      _ -> {:error, "not a planet"}
    end
  end
end
