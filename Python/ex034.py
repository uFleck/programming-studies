salario = float(input('Digite o seu salário para calcularmos o aumento: '))

if salario > 1250.00:
  salarioComAumento = salario + (salario * 0.10)
else:
  salarioComAumento = salario + (salario * 0.15)

print(f'O seu salário com aumento fica: {salarioComAumento:.2f}')
