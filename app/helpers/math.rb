helpers do
  def standard_deviation(array, average)
    variance = array.inject(0) { |variance, x| variance += (x - average) ** 2 }
    return Math.sqrt(variance/(array.size-1))
  end
end
