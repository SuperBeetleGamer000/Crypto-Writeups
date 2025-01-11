from Crypto.Util.number import *

n = 94144887513744538681657844856583985690903055376400570170371837200724227314957348031684706936655253125445176582486308241015430205703156336248578475428712275706238423997982248462635972817633320331030484841129628650918661036694615254018290264619628335177
ct = 80250313885079761377138486357617323555591919111371649902793873860183455237161293320577683249054725852540874552433031133240624696119120378419135912301004715004977978507247634217071922495893934816945961054193052791946557226599493364850793396744903765857

facs = []
for b in range(3, 417-3):
    for c in range(3, 417-3):
        F.<x> = PolynomialRing(QQ)


        A = 2 ** b + 2 ** c

        f = x^2 - A*x - n

        if len(list(f.factor())) == 2:
            facs.append(int(f.roots()[0][0]))
            facs.append(int(f.roots()[1][0]))

for factor in facs:
    if factor > 0:
        p = int(factor)
        q = int(n//p)
        d = int(pow(65537,-1,(p-1)*(q-1)))

        print(long_to_bytes(pow(int(ct),int(d),int(n))).decode())
        break
        
#CCTF{5pArs3_dIfFeRenc3_f4ct0r1za7iOn_m3th0d!}
