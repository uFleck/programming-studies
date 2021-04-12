// Armazenando uma função em uma variável
const imprimirSoma = function (a, b) {
  console.log(a + b)
}

imprimirSoma(10, 20)

// Armazenando uma função arrow em uma variável
const soma = (a, b) => {
  return a + b
}

console.log(soma(10, 20))

// Retorno implícito
const subtracao = (a, b) => a - b
console.log(subtracao(10, 20))

const imprimir2 = a => a

console.log(imprimir2(2))