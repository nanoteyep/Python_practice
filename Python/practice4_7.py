#practicing for
#making star tree in case of center
import practice4_1

for i in range(5):
    for n in range(4-i):
        print(' ',end='')
    practice4_1.star_print(2*i+1)
    for o in range(4-i):
        print(' ',end='')
    print("")
