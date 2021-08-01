#practicing for
#making inverse star tree in case of center
import practice4_1

for i in range(5):
    for n in range(i):
        print(' ',end='')
    practice4_1.star_print(9-2*i)
    for o in range(i):
        print(' ',end='')
    print("")