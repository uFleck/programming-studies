distancia = int(input('Digite a distância da viagem: '))

if distancia > 200:
  passagem = distancia * 0.45
else:
  passagem = distancia * 0.50
print(f'O preço da passagem será: R${passagem:.2f}')
