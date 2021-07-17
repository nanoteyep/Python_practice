#practicing pandas
#I'm gonna making stock price plot by using matplotlib
#and also draw movement avg line

import pandas as ad
import pandas_datareader as web
import datetime
import matplotlib.pyplot as plt

#get GS data from 2014-04-01 to today at yahoo
start = datetime.datetime(2014, 1, 1)
end = datetime.datetime.today()
gs = web.DataReader("078930.KS", "yahoo", start, end)

#making moving average
ma5 = gs["Adj Close"].rolling(window=5).mean()
ma20 = gs["Adj Close"].rolling(window=20).mean()
ma60 = gs["Adj Close"].rolling(window=60).mean()
ma120 = gs["Adj Close"].rolling(window=120).mean()

#insert columns
gs.insert(len(gs.columns), "MA5", ma5)
gs.insert(len(gs.columns), "MA20", ma20)
gs.insert(len(gs.columns), "MA60", ma60)
gs.insert(len(gs.columns), "MA120", ma120)

#making plot
plt.plot(gs.index, gs["Adj Close"], label="Adj Close")
plt.plot(gs.index, gs["MA5"], label="MA5")
plt.plot(gs.index, gs["MA20"], label="MA20")
plt.plot(gs.index, gs["MA60"], label="MA60")
plt.plot(gs.index, gs["MA120"], label="MA120")

plt.legend(loc='best')
plt.grid()
plt.show()

