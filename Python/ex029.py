velocidade = int(input('Qual é a velocidade do carro? '))
multa = (velocidade - 80) * 7.00

if velocidade > 80:
  print(f'Multado! Você excedeu o limite de velocidade!\nVocê tem que pagar uma multa de R${multa}')
else:
  print('Tenha um bom dia!')