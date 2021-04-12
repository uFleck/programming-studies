diasAlugados = int(input('Quantos dias alugados? '))
kmRodados = int(input('Quantos Km rodados? '))

total = 60 * diasAlugados + 0.15 * kmRodados

print(f'O total a pagar é de R${total:.2f}')
