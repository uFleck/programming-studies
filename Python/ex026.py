nome = str(input('Digite uma frase: ')).strip()
print(f'A letra "a" apareceu {nome.count("a")} vezes.')
print(f'A primeira letra "a" apareceu na {nome.find("a") + 1}º posição.')
print(f'A última letra "a" apareceu na {nome.rfind("a") + 1}º posição.')
