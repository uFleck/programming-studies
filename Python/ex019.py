from random import choice

nomes = []

for i in range(0, 4):
    nomes.append(input(f'Digite o nome do {i + 1}º aluno: '))


print(choice(nomes))
