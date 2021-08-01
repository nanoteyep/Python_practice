#practicing function

def get_triangle_area():
    width = input('input width ')
    try:
        float(width)
    except ValueError:
        print('Type in number ')
        quit()
    #only accept number

    height = input('input height ')
    try:
        float(height)
    except ValueError:
        print('Type in number')
        quit()
    #only accept number

    print('area is ',float(width)*float(height))


#get_triangle_area()
#just checking
