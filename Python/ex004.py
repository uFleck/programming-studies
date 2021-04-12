algo = input('Digite algo: ')
print(f'Seu tipo: {type(algo)}\n'
      f'Alphanumérico? {algo.isalnum()}\n'
      f'Numérico? {algo.isnumeric()}\n'
      f'Alpha? {algo.isalpha()}\n'
      f'Maiúsculo? {algo.isupper()}\n'
      f'Minúsculo? {algo.islower()}\n'
      f'ASCII? {algo.isascii()}\n'
      f'Decimal? {algo.isdecimal()}\n'
      f'Espaço? {algo.isspace()}\n'
      f'Dígito? {algo.isdigit()}\n'
      f'Identificador? {algo.isidentifier()}\n'
      f'Título? {algo.istitle()}\n'
      f'Escrevível? {algo.isprintable()}')
