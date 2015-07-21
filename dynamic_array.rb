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
    @start = 0
  end

  def get(idx)
    return @store.get(ring_index(idx)) if inbounds?(idx)
  end

  def set(idx, value)
    if inbounds?(idx)
      @store.set(ring_index(idx), value)
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

  def shift
    @start += 1
    @length -= 1
    get(@start - 1)
  end
  

  private

  def add_stuff!(value)
    @store.set(ring_index(@length), value)
    @length += 1
  end

  def expand_array
    @capacity *= 2
    new_store = StaticArray.new(@capacity)
    (0...@length).each {|i| new_store.set(i, get(i)) }
    @start_idx = 0
    @store = new_store
  end

  def inbounds?(idx)
    return true if idx < @length && idx >= 0
  end

  def ring_idx(idx)
    (idx + @start) % @length
  end

end
