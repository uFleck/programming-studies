numeros = []

for i in range(3):
  numeros.append(int(input(F'Digite o {i + 1}º número: ')))

  if len(numeros) == 1:
    maior = numeros[0]
    menor = numeros[0]
  
  if numeros[i] > maior:
    maior = numeros[i]
  elif numeros[i] < menor:
    menor = numeros[i]
  

print(f'O maior número digitado foi: {maior}\nO menor foi: {menor}')
