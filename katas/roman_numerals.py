# as described in http://codingdojo.org/cgi-bin/wiki.pl?KataRomanNumerals

import sys



class Roman(object):

    def __init__(self):
        self.numerals = [ ('M', 1000), ('D', 500), ('C', 100), ('L', 50), ('X', 10),
                        ('V', 5), ('I', 1), ]

    def convert(self, number):
        """Converts the given input into Roman Numerals for numbers < 3000"""

        translated_numeral = ''
        for numeral, value in self.numerals:
            while number >= value:
                translated_numeral += numeral
                number -= value

        return translated_numeral


if __name__ == '__main__':
    input = sys.argv[1]
    if len(sys.argv) < 2:
        print "Please pass in a number to convert"
    #if input > 3000:
        #raise Exception( "Cannot convert numbers > 3000." )

    result = Roman().convert(int(input))
    print result

