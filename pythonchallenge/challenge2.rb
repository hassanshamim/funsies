def bottom10_char(str)
  char_dict = Hash.new{|hash, key| hash[key] = 0 }
  str.each_char{ |char| char_dict[char] += 1 }
  char_dict.to_a.sort{|a, b| a.last <=> b.last }.take(10).map(&:first) #ugly ugly, experiment with group_by?
end
