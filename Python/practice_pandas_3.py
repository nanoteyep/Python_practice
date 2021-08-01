#practicing pandas_datareader and matplotlib

import pandas_datareader as web
import datetime
import matplotlib.pyplot as plt

start = datetime.datetime(2016, 2, 19)
end = datetime.datetime(2016, 3, 4)

gs = web.DataReader("078930.KS", "yahoo", start, end)
print(gs)

print(gs.info())

gs_year = web.DataReader("078930.KS", "yahoo")
print(gs_year.info())

plt.plot(gs_year.index, gs_year["Adj Close"])
plt.show()
