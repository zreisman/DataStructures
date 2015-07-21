class StaticArray

  def initialize(capacity = 4)
    @capacity = capicity
    @store = Array.new(@capacity)
  end

  def get(idx)
    if idx < 0 || idx >= @length
      return nil
    else
      return @store.get(idx)
    end
  end

  def set(idx, value)
    if idx < 0 || idx >= @length
      return nil
    else
      @store.set(idx, value)
      return value
    end
  end

  def length
    @capacity
  end
end

class DynamicArray
  def initialize
    @store = StaticArray.new(4)
    @capacity = 4
    @length = 0
  end

  def get(idx)
    return @store.get(idx) if inbounds?(idx)
  end

  def set(idx, value)
    if inbounds?(idx)
      @store.set(idx, value)
    end
  end

  def push(value)
    if @length < @capacity
      add_stuff!(value)
    else
      expand_array
      add_stuff!(value)
    end

  end

  def pop
    @length -= 1
    get(@length)
  end


  private

  def add_stuff!(value)
    @store[@length] = value
    @length += 1
  end

  def expand_array
    old_store = @store
    @capacity *= 2
    @store = StaticArray.new(@capacity)
    (0...@length).each {|i| @store.set(i, old_store.get(i)) }
  end

  def inbounds?(idx)
    return true if idx < @length && idx >= 0
  end

end
