valor = float(input('Digite o preço do produto: R$'))
desconto = int(input('Digite o quanto de desconto terá: '))
desconto = valor * (desconto / 100)

print(f'O preço que custava R${valor}, agora custará R${valor - desconto:.2f}')
