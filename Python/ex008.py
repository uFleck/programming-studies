m = int(input('Distância em m: '))

km = m / 1000
hm = m / 100
dam = m / 10
dm = m * 10
cm = m * 100
mm = m * 1000

print(f'A medida de {m}m corresponde a:\n'
      f'{km}km\n'
      f'{hm}hm\n'
      f'{dam}dam\n'
      f'{dm}dm\n'
      f'{cm}cm\n'
      f'{mm}mm\n')
