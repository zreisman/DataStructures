class StaticArray

  attr_reader :length

  def initialize(capacity = 4)
    @capacity = capicity
    @store = Array.new(@capacity)
  end

  def get(idx)
    if idx < 0 || idx >= @length
      return nil
    else
      return @store[idx]
    end
  end

  def set(idx, value)
    if idx < 0 || idx >= @length
      return nil
    else
      @store[idx] = value
      return value
    end
  end



end

class DynamicArray
  def initialize
    @store = Static
