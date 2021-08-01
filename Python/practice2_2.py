#calculate case if price of stocks is decreased
import practice2_1

price_daum = 0.95 * practice2_1.price_daum
price_naver = 0.9 * practice2_1.price_naver

amount = price_daum * practice2_1.stocks_daum + price_naver * practice2_1.stocks_naver

print(amount)