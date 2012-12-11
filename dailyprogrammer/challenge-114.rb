#This challenge is to create a word bridge from any two words in the four-letter word dictionary provided

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

def variations2(word, dict)
  result = []
  word.length.times do |i|
  #   puts 'GOT HERE'
    ('a'..'z').each do |letter|
      if letter != word[i]
        s = word[0..i] + letter + word[(i+1)..-1]
  #     puts "considering: #{s}"
        result << s if dict.include? s
      end
    end
  end
end

def variations1(word, dict)
  result = []
  word.length.times do |i|
    ('a'..'z').each do |letter|
      s = word[0..i] + letter + word[(i+1)..-1]
      s = word.dup
      s[i]= letter
      result << s if dict.include? s
    end
  end
  result.delete( word )
  result
end

def ladder(word1, word2)
  doc = File.open('selected_four-letter_words.txt')
  words = doc.readlines.map{ |line| line.chomp }
  doc.close
  build_bridge(word1, word2, words)
end

def build_bridge( seed, target, dict )
  queue = []
  hash_table = {}
  current = seed
  #breadth first search, goes until it finds target word
  until current == target
    puts "working on word #{current}"
    ## neighbors = dict.select{ |entry| levenshtein( current, entry ) == 1 }
    neighbors = variations1(current, dict)
    hash_table[current] = neighbors - hash_table.keys #not unidirected w/o this line
    queue += neighbors - hash_table.keys
    current = queue.shift while hash_table.has_key?( current ) #haven't tested this way
  end
  bridge = [target]

  until bridge.last == seed
    hash_table.inject( bridge ) do | bridge, (key, values) |
      values.include?( bridge.last ) ? bridge << key : bridge
    end
  end

  puts "WORD BRIDGE", bridge.reverse
end

=begin
require '~/rails/funsies/dailyprogrammer/challenge-114.rb'
require 'benchmark'
doc = File.open('selected_four-letter_words.txt')
words = doc.readlines.map{ |line| line.chomp }
doc.close
Benchmark.bm do |x|
  x.report { variations1('back', words) }  
  x.report { variations2('back', words) }  
  x.report { words.select{|e| levenshtein('back', e) == 1 } }  
end
=end
