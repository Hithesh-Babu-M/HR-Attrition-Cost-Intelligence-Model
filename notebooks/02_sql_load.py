import pandas as pd
import sqlite3
df= pd.read_csv("data/ibm_hr_employee_attrition_dataset.csv")
conn = sqlite3.connect("sql/Attrition_Database.db")
df.to_sql("Attrition",conn,if_exists='replace',index=False)
conn.close()
print("Dataset Loaded into Database")