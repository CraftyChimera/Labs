import pandas as pd
import seaborn as sns

df = pd.read_csv("4.tr", sep=' ', names=[
                 "Mode", "Time", "Source", "Dest","Type"], usecols=[0, 1, 2, 3,4])
df['Packetloss'] = 0
df['Packetrecv'] = 0
prevpl = 0
prevpr = 0
for index, row in df.iterrows():
    if (row['Mode'] == '+' and row['Type']!='rtProtoDV'):
        prevpl += 1
    elif (row['Mode'] == 'r'):
        prevpr += 1
    df.at[index, 'Packetloss'] = prevpl
    df.at[index, 'Packetrecv'] = prevpr
df['PDR'] = df['Packetrecv']/df['Packetloss']
df['PLR'] = 1 - df['PDR']
df = df.groupby(['Time'], as_index=False).last()
df = df.dropna()
print(df)

svm = sns.lineplot(data=df, x="Time", y="PDR")
svm = sns.lineplot(data=df, x="Time", y="PLR", color="red")
figure = svm.get_figure()
figure.savefig('2a.png', dpi=400)
