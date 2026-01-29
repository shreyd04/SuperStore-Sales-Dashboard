import pandas as pd

df = pd.read_csv('SuperStore_Orders.csv')
print(df.dtypes)
total_revenue = df['sales'].sum()
total_profit = df['profit'].sum()
profit_margin = (total_profit/total_revenue)*100 if total_revenue != 0 else 0

profit_margin_by_segment = df.groupby('segment').agg({
'sales': 'sum',
'profit': 'sum'
}).reset_index()

profit_margin_by_segment['profit_margin'] = (
    profit_margin_by_segment['profit'] /
    profit_margin_by_segment['sales']
) * 100
