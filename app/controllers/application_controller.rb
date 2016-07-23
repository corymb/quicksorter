class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def initialize
    @unsorted = [77, 22, 66, 28, 85, 39, 4, 54]
  end

  def quicksort_algorithm(array)
    return array if array.length <= 1

    pivot_index = (array.length / 2).to_i
    pivot_value = array[pivot_index]
    array.delete_at(pivot_index)

    lesser = Array.new
    greater = Array.new
    array.each do |x|
      if x <= pivot_value
        lesser << x
      else
        greater << x
      end
    end

    return quicksort_algorithm(lesser) + [pivot_value] - quicksort_algorithm(greater)
  end

  def quicksort
    @sorted = quicksort_algorithm(@unsorted)
  end

  def debug
    # byebug
    @sorted = quicksort_algorithm(@unsorted)
    render 'quicksort'
  end
end
