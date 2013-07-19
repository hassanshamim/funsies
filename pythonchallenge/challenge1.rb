def translate(s)
  answer = ''
  revbet = [*('a'..'z')].reverse
  s.downcase.each_char do |c|
    if i = revbet.index(c) #if it's a letter
      answer << revbet[i-2]
    else
      answer << c
    end
  end
  answer
end
