require 'byebug'

class StaticArray

  def initialize(capacity = 4)
    @capacity = capacity
    @store = Array.new(@capacity)
  end

  def get(idx)
    if idx < 0 || idx >= @capacity
      return nil
    else
      return @store[idx]
    end
  end

  def set(idx, value)
    if idx < 0 || idx >= @capacity
      return nil
    else
      @store[idx] = value
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
    return @store.get(ring_idx(idx)) if inbounds?(idx)
  end

  def set(idx, value)
    if inbounds?(idx)
      @store.set(ring_idx(idx), value)
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
    value = get(@start)
    set(@start, nil)
    @length -= 1
    @start += 1

    value
  end

  def unshift(value)
    if @length == @capacity
      expand_array
    end
    @start = (@start - 1) % @capacity
    @store.set(@start, value)
    @length += 1
  end


  private

  def add_stuff!(value)
    pos = (@start + @length) % @capacity
    @length += 1
    @store.set(pos, value)
    value
  end

  def expand_array
    @capacity *= 2

    new_store = StaticArray.new(@capacity)
    (0...@length).each {|i| new_store.set(i, get(i)) }
    @start = 0
    @store = new_store
  end

  def inbounds?(idx)
    return true if idx < @length && idx >= 0
  end

  def ring_idx(idx)
    return @start if @length <= 1
    (@start + idx) % @length
  end

end
