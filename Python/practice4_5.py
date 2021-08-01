#practicing for
#making star tree in case of right side
import practice4_1

for i in range(5):
    for n in range(5-i):
        print(' ',end='')
    practice4_1.star_print(i+1)
    print("")