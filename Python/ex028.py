from random import randint

while True:
    numeroUsuario = int(input('Digite um número de 1 a 5: '))
    if numeroUsuario < 1 or numeroUsuario > 5:
        print("Digite um número válido!\n")
    else:
        break
numeroPc = randint(1, 5)
print('Você acertou!' if numeroUsuario == numeroPc else 'Você errou...')
