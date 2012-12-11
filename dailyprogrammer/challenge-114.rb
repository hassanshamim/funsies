  #Calculates letter difference between two words.  google levenshtein for info
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
  build_bridge(word1, word2, words)
end

  #right now this is DFS, I need to implement a queue to make it a BFS
def build_bridge( seed, target, dict )
  queue = []
  hash_table = {}
  current = seed
  #breadth first search, goes until it finds target word
  until current == target
        puts "working on word #{current}"
        neighbors = dict.select{ |entry| levenshtein( current, entry ) == 1 }
        hash_table[current] = neighbors
        queue += neighbors - hash_table.keys
    #current = queue.shift
    current = queue.shift while hash_table.has_key?( current ) #haven't tested this way
  end

  bridge = [target]
#  until current == seed
#     current == bridge.last
#    bridge.push( hash_table.select{|k, v| v.include?(current)})
#  end

  until bridge.last == seed
    hash_table.inject( bridge ) do | bridge, (key, values) |
      values.include?( bridge.last ) ? bridge << key : bridge
    end
  end
  puts bridge.reverse
end
