#practcing function

def add_star_to_end():
    start = input('input start number ')
    try:
        float(start)
    except ValueError:
        print('Type in number')
        quit()
    #only accept number

    end = input('input end number')
    try:
        float(end)
    except ValueError:
        print('Type in number')
        quit()
    #only accept number

    answer = (float(end))*(float(end)+1)/2 - (float(start))*(float(start)-1)/2

    print('sum of number is ', answer)

#add_star_to_end()
#just checking