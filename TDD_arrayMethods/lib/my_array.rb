require 'byebug'

class Array
  def my_uniq
    counts = Hash.new

    each { |el| counts[el] = true }

    counts.keys
  end

  def two_sum
    result = []

    each_with_index do |el, i|
      ((i + 1)...count).each do |j|
        result << [i, j] if el + self[j] == 0
      end
    end

    result
  end

  def my_transpose
    return [] if empty?
    raise TypeError unless all? {|array| array.is_a?(Array)}
    raise IndexError unless all? {|array| array.count == first.count}

    result = []
    first.count.times {result << [] }

    each do |row|
      row.each_with_index do |el, i|
        result[i] << el
      end
    end

    result
  end

  def stock_picker
    return nil if count < 2

    max_profit = 0
    best_switch = nil

    each_with_index do |buy, i|
      drop(i + 1).each_with_index do |sell, j|
        profit = sell - buy
        if profit > max_profit
          max_profit = profit
          best_switch = [i, j + i + 1]
        end
      end
    end

    best_switch
  end
end
