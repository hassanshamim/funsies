#  fun with procs

fifteen = proc { puts "Fizzbuzz" }
three   = proc { puts "Fizz" }
five    = proc { puts "Buzz" }
nuthin  = proc {|i|  puts i  }
#master = Array.new(15, nuthin)
master = Array.new(15) do |i|
  return three if i%3 == 0
  return five if i%5 == 0
  nuthin
end
master[0] = fifteen
#master[0] = fifteen
#master[3], master[6], master[9], master[12] = Array.new(4, three)
#master[5], master[10] = five, five
(1..20).each do |n|
    master[n%15].call(n)
end
