module UnitHelpers

  def convert_to_feet(length)
    (length * 0.3048).to_i
  end

  def convert_to_f(temp)
    (((temp - 32) * 5)/9).to_i
  end

end