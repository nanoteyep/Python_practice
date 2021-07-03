#practicing function
#get directory path and read all .txt files and make a list
#this function return list

import os
def get_txt_list(path):
    all_list = os.listdir(path)
    txt_list = []
    for file in all_list:
        if file.endswith('txt'):
            txt_list.append(file)
    return txt_list

#print(get_txt_list('C:\\Users\\tolight20\\Desktop\\abcd'))
#just checking