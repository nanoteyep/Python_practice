#practicing class

from practice6_3 import Stock

a = Stock()
b = Stock()

print(a.market)
print(b.market)

a.market = 'kosdaq'
b.market = 'nasdaq'

print(a.market)
print(b.market)
print(Stock.market)
