from math import sin, cos, tan, radians

angulo = radians(float(input('Digite um Ângulo: ')))

print(f'O seno, cosseno e a tangente de {angulo:.2f} é:\n'
      f'Seno: {sin(angulo):.2f}\n'
      f'Cosseno: {cos(angulo):.2f}\n'
      f'Tangente: {tan(angulo):.2f}')
