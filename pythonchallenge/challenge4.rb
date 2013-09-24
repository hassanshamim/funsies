require 'open-uri'

def nag_the_server_a_bunch(next_num)
  base_url = "http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing="

  400.times do
    open(base_url + next_num){|doc| next_num = doc.read.match(/next nothing is (\d+)/) ? $1 : next_num }
  end
  puts base_url + next_num
end

#==== Part 1 ====

next_num = "12345"
#nag_the_server_a_bunch next_num
#
# returns http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=16044

# ==== Part 2 ====
next_num = "8022"
#nag_the_server_a_bunch next_num

# returns http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=82682

# ==== Part 3 ====
nag_the_server_a_bunch "82682"

# returns http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=66831
#
# YEAH BUDDY!
