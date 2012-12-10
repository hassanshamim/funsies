def levenshtein(a, b)
  case
    when a.empty? then b.length
    when b.empty? then a.length
    else [(a[0] == b[0] ? 0 : 1) + levenshtein(a[1..-1], b[1..-1]),
         1 + levenshtein(a[1..-1], b),
         1 + levenshtein(a, b[1..-1])].min
  end
end


def ladder(word1, word2)
  doc = File.open('selected_four-letter_words.txt')
  words = doc.readlines.map(&:chomp)
  doc.close
end

  #right now this is DFS, I need to implement a queue to make it a BFS
def build_paths( seed, hash_table, word_list )
  puts "working on word #{seed}"
  hash_table[seed] = word_list.select{ |word| levenshtein(seed, word) == 1 }
  hash_table[seed].each do |neighbor|
      build_paths(neighbor, hash_table, word_list ) unless hash_table[neighbor]
  end
end
