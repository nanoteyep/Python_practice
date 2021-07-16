#practicing Series in pandas

from pandas import Series, DataFrame

kakao = Series([92600,92400,92100,94300,92300])

print(kakao)
print(kakao[2])
kakao2 = Series([92600,92400,92100,94300,92300], index = ['2016.02.19','2016.02.18','2016.02.17','2016.02.16','2016.02.15'])

print(kakao2)
print(kakao2[0])
print(kakao2['2016.02.19'])

for date in kakao2.index:
    print(date)

for price in kakao2.values:
    print(price)


mine = Series([10,20,30] , index = ['naver','sk','kt'])
friend = Series([10,20,30], index = ['kt','sk', 'naver'])

merge = mine + friend
print(merge)