#practicing func
#this function needs weight(Kg) and height(cm)

def show_bmi(weight,height):
    height = height/100
    BMI = weight/height/height

    if BMI < 18.5:
        print('Your BMI is ',BMI,'. You are underweight')
    elif BMI >= 18.5 and BMI < 25.0:
        print('Your BMI is ',BMI,'. You are normal')
    elif BMI >= 25.0 and BMI < 30.0:
        print('Your BMI is ',BMI,'. You are overweight')
    elif BMI >= 30.0:
        print('Your BMI is ',BMI,'. You are obese')
    return 0

#show_bmi(85, 171)
#just checking