#practicing file i/o

import os

def making_file_list(path):
    file_list = os.listdir(path)
    flist = open(path+'\\flist.txt','tw')

    for file in file_list:
        flist.write(str(file)+'\n')

    flist.close()

making_file_list('C:\\Users\\tolight20\\Desktop\\abcd')