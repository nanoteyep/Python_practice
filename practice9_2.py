#practicing COM
import win32com.client

excel = win32com.client.Dispatch("Excel.Application")
workbook = excel.Workbooks.Add()
worksheet = workbook.Worksheets("Sheet1")
#making excel worksheet

worksheet.Cells(1, 1).Value = "hello world"
workbook.SaveAs("C:\\Users\\tolight20\\Desktop\\abcd\\test.xlsx")
excel.Quit()
#input data in worksheet and save as a file


excel_2 = win32com.client.Dispatch("Excel.Application")
workbook_sec = excel.Workbooks.Open("C:\\Users\\tolight20\\Desktop\\abcd\\test.xlsx")
worksheet_sec = workbook_sec.ActiveSheet
worksheet_sec.Range("A2:C2").Interior.ColorIndex = 3
worksheet_sec.Cells(2, 1).Value = "I'm not a baby"
workbook_sec.SaveAs("C:\\Users\\tolight20\\Desktop\\abcd\\test2.xlsx")
excel_2.Quit()
#open the file I made and change some data
#save as another file