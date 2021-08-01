#practicing file i/o

file = open('C:\\Users\\tolight20\\Desktop\\abcd\\number.txt','wt')

for n in range(1,11):
    file.write(str(n)+'\n')

file.close()