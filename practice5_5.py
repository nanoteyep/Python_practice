#practicing function

import practice5_4

while 1:
    weight = input('input your weight(Kg)')
    try:
        float(weight)
    except ValueError:
        print('Type in number')
        continue

    height = input('input your height(cm)')
    try:
        float(height)
    except ValueError:
        print('Type in number')
        continue


    practice5_4.show_bmi(float(weight),float(height))
