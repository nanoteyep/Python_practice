#practicing DataFrame in pandas

from pandas import Series, DataFrame

rawdata = {'col0':[1,2,3,4],'col1':[10,20,30,40],'col2':[100,200,300,400]}
data = DataFrame(rawdata)

print(data)