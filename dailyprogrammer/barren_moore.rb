
module Barren_Moore
	@things = [
			['down in', 'valley-o'],
			["in", "moore"],
			['on', 'tree'],
			['on', 'branch'],
			['on', 'twig'],
			['on', 'leaf'],
			['in', 'nest'],
			['in', 'egg'],
			['on', 'bird'],
			['on', 'wing'],
			['on', 'feather'],
			['on', 'flea'],
			['on', 'rash']
				]
	CHORUS = "Hi ho, the barren moore\nThe moore down in the valley-o"

	def self.sing_chorus
	  2.times{puts CHORUS}
	  puts ""
	end

	def self.sing_new_verse(num)
	puts "Now #{@things[num-1].first} that #{@things[num-1].last} there was a #{@things[num].last}"
	puts "A bare #{@things[num].last}, a barren #{@things[num].last};"
	end

	def self.sing_old_verses(num)
		puts "The #{@things[num].last} #{@things[num-1].first} the #{@things[num-1].last}"
		self.sing_old_verses(num-1) unless num == 1

	end

	def self.sing_song
		verse ||= 2
		while verse < @things.length
			sing_chorus
			sing_new_verse(verse)
			sing_old_verses(verse)
			puts ""
			verse +=1
		end
		2.times {puts CHORUS.upcase}
	end

end

Barren_Moore.sing_song
