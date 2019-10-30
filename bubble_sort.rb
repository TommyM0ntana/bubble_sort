# frozen_string_literal: true

def bubble_sort(array)
  l = array.length - 1
  l.times do |x|
    (l - x).times do |y|
      array[y], array[y + 1] = array[y + 1], array[y] if array[y] > array[y + 1]
    end
  end
  puts array.to_s
end

def bubble_sort_by(array)
  if block_given?
    l = array.length - 1
    l.times do |x|
      (l - x).times do |y|
        array[y], array[y + 1] = array[y + 1], array[y] if yield(array[y], array[y + 1]).positive?
      end
    end
    puts array.to_s
  else
    puts 'No block'
  end
end

bubble_sort([4, 3, 78, 2, 0, 2])
# => [0,2,2,3,4,78]

bubble_sort_by(%w[hi hello hey]) do |left, right|
  left.length - right.length
end
# => ["hi", "hey", "hello"]
