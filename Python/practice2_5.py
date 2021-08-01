def cal(n):
#calculate stocks price decrease 30% during n days
    ini_price = 1000000
    fin_price = ini_price
    for i in range(0,n):
        fin_price = 0.7 * fin_price
        #print(fin_price)
        #to check the answer is right

    print(fin_price)

cal(3)