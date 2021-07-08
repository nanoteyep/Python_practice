#practicing COM, I will practice win32com.client by using excel

import win32com.client

explorer = win32com.client.Dispatch("InternetExplorer.Application")
explorer.Visible = True

word = win32com.client.Dispatch("Word.Application")
word.Visible = True

excel = win32com.client.Dispatch("Excel.Application")
excel.Visible = True
