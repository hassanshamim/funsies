namelist =
"AA = Rickard Stark (M)       AB = Eddard Stark (M)         AC = Catelyn Tully (F)
AD = Brandon Stark (M)        AE = Benjen Stark (M)         AF = Jon Snow (M)
AG = Robb Stark (M)           AH = Sansa Stark (F)          AI = Arya Stark (F)
AJ = Bran Stark (M)           AK = Rickon Stark (M)         AL = Hoster Tully (M)
AM = Minisa Whent (F)         AN = Edmure Tully (M)         AO = Lysa Tully (F)
AP = Jon Arryn (M)            AQ = Robert Arryn (M)         AR = Tytos Lannister (M)
AS = Tywin Lannister (M)      AT = Joanna Lannister (F)     AU = Kevan Lannister (M)
AV = Cersei Lannister (F)     AW = Jamie Lannister (M)      AX = Tyrion Lannister (M)
AY = Robert Baratheon (M)     AZ = Joffrey Baratheon (M)    BA = Myrcella Baratheon (F)
BB = Tommen Baratheon (M)     BC = Lancel Lannister (M)     BD = Steffon Baratheon (M)
BE = Stannis Baratheon (M)    BF = Selyse Florent (F)       BG = Shireen Baratheon (F)
BH = Renly Baratheon (M)      BI = Jaehaerys Targaryen (M)  BJ = Aerys Targaryen (M)
BK = Rhaella Targaryen (F)    BL = Rhaegar Targaryen (M)    BM = Elia Martell (F)
BN = Rhaenys Targaryen (F)    BO = Aegon Targaryen (M)      BP = Viserys Targaryen (M)
BQ = Daenerys Targaryen (F)   BR = Quellon Greyjoy (M)      BS = Balon Greyjoy (M)
BT = Euron Greyjoy (M)        BU = Victarion Greyjoy (M)    BV = Urrigon Greyjoy (M)
BW = Aeron Greyjoy (M)        BX = Rodrik Greyjoy (M)       BY = Maron Greyjoy (M)
BZ = Asha Greyjoy (F)         CA = Theon Greyjoy (M)        CB = Alannys Harlaw (F)   "

relations ="AA->AB, AA->AD, AA->AE, AB->AF, AB->AG, AB->AH, AB->AI, AB->AJ, AB->AK, AC->AG,
AC->AH, AC->AI, AC->AJ, AC->AK, AL->AC, AL->AN, AL->AO, AM->AC, AM->AN, AM->AO,
AO->AQ, AP->AQ, AR->AS, AR->AU, AS->AV, AS->AW, AS->AX, AT->AV, AT->AW, AT->AX,
AU->BC, AV->AZ, AV->BA, AV->BB, AY->AZ, AY->BA, AY->BB, BD->AY, BD->BE, BD->BH,
BE->BG, BF->BG, BI->BJ, BI->BK, BJ->BL, BJ->BP, BJ->BQ, BK->BL, BK->BP, BK->BQ,
BL->BN, BL->BO, BM->BN, BM->BO, BR->BS, BR->BT, BR->BU, BR->BV, BR->BW, BS->BX,
BS->BY, BS->BZ, BS->CA, CB->BX, CB->BY, CB->BZ, CB->CA"

$name_hsh = {}
name_key = namelist.strip!.split(')')
Struct.new("Person", :name, :initials, :gender, :parents, :children)


name_key.each do |x|
	x.strip!
	initials = x[0, 2]
	name = x[x.index('= ')+1...x.index('(')].strip!
	gender = x[-1]
	$name_hsh[initials] = Struct::Person.new(name, initials, gender, [], [])
end

relations.split(',').each do |rel|
	fam = rel.strip.partition('->') #fam[0] is parent, fam[2] is child
	$name_hsh[fam[2]].parents << fam[0]
	$name_hsh[fam[0]].children << fam[2]
end

def ancestors(person)
	progenitors=[]
	target = $name_hsh.select{|k, v| v.name == person}  #Find Struct of specified person
	target.each_value{|x| progenitors << x.parents } #add target's parents to array
	progenitors.flatten!.each{|x| progenitors+= $name_hsh[x].parents} #adds parents of all parents in array
	puts "The Ancestors of #{person} are:"
	progenitors.collect{|initial| $name_hsh[initial].name}.uniq

end

def descendants(person)
	progeny=[]
	target = $name_hsh.select{|k, v| v.name == person}
	target.each_value{|x| progeny << x.children }
	progeny.flatten!.each do |x|
		 progeny+= $name_hsh[x].children
	end
	puts "The Descendants of #{person} are:"
	progeny.collect{|initial| $name_hsh[initial].name}.uniq

end

def brothers(person)
 	target = $name_hsh.select{|k, v| v.name == person}.values[0]
 	bros = $name_hsh.select do |k, v|
 		(v.parents & target.parents).size != 0 and
 		v.gender == 'M' and v.name != target.name
 	end

 	bros.values.collect{|val| val.name}
end

def sisters(person)
 	target = $name_hsh.select{|k, v| v.name == person}.values[0]
 	sis = $name_hsh.select do |k, v|
 		(v.parents & target.parents).size != 0 and
 		v.gender == 'F' and v.name != target.name
 	end
 	sis.values.collect{|val| val.name}
end

def uncles(person)
	target = $name_hsh.select { |k, v| v.name == person }.values[0]
	names = target.parents.collect{|x| $name_hsh[x].name}
	brothers(names[0]) + brothers(names[1])
end
def
 aunts(person)

	target = $name_hsh.select { |k, v| v.name == person }.values[0]
	names = target.parents.collect{|x| $name_hsh[x].name}
	sisters(names[0]) + sisters(names[1])

end

p $name_hsh.values.each{|x| p x.parents}

