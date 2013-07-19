# Simply get the total value of a word based on its letter values.
from sys import argv
from string import ascii_lowercase

class LetterValue(object):
    """Simple class which contains a dict of letter values, as well as a
        _get_value(s) method to convert the letter to it's integer value and
        a convert(word) method which returns the total value of a string"""

    values = { char:i for i, char in enumerate(' ' + ascii_lowercase) }

    def _get_value(self, letter):
        """return the value of a upper or lowercase letter or space"""
        return self.values.get(letter.lower(), 0)

    def convert(self, word):
        """returns the sum of the letter values in a string"""
        return reduce(lambda x, y: x + self._get_value(y), list(word), 0)


if __name__ == '__main__':
    target_string = ' '.join(argv[1:])
    val = LetterValue().convert(target_string)
    print "The string '%s' has a total word value of %i" % (target_string, val)
