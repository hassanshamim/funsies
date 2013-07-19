def reverse_list(list)
  a, z = 0, list.length - 1
  list.tap do |list|
    while a < z && z != 0
      list[a], list[z] = list[z], list[a]
      a +=1
      z -=1
    end
  end
end

