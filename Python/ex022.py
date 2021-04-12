nome = str(input('Digite o seu nome completo: ')).strip()
nomeSeparado = nome.split()
nomeSemEspaco = ''.join(nomeSeparado)
primeiroNome = nomeSeparado[0]
print(nome.upper())
print(nome.lower())
print(len(nomeSemEspaco))
print(len(primeiroNome))
print(nomeSeparado[0])
