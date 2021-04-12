from math import hypot

catetoOposto = float(input('Digite o comprimento do cateto oposto: '))
catetoAdjacente = float(input('Digite o comprimento do cateto adjacente: '))

# hipotenusa = (catetoOposto ** 2 + catetoAdjacente ** 2) ** (1/2)
hipotenusa = hypot(catetoOposto, catetoAdjacente)

print(f'A hipotenusa vai medir {hipotenusa:.2f}')
