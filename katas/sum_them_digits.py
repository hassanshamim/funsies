# As described in http://www.reddit.com/r/dailyprogrammer/comments/1berjh/040113_challenge_122_easy_sum_them_digits/

def main(seed_num):
    while seed_num > 9:
        composite_nums = [int(c) for c in str(seed_num)]
        seed_num = sum(composite_nums)
    return seed_num

if __name__ == '__main__':
    seed_num = input('Please enter a positive integer\n')
    print main(seed_num)


