def bubble_sort(items)
  isSorted = false;
  until isSorted do
    didNotSwap = true
    items.each_index do |index|
      break if (index == items.length - 1)

      nextItem, currentItem = items[index + 1], items[index]

      if (nextItem < currentItem) # do a swap
        items[index], items[index + 1] = nextItem, currentItem 
        didNotSwap = false
      end
    end

    isSorted = didNotSwap 
  end 

  items
end

# Example usage
puts bubble_sort([4,3,78,2,0,2])