#practicing function

def only_three():
    org_list = []
    fin_list = []

    while 1:
        new_list = input('input your word. if you want to stop, type stop ')
        if new_list == 'stop':
            break

        org_list.append(new_list)

    for n in org_list:
        fin_list.append(n[:3])

    print(fin_list)

#only_three()
#just checking