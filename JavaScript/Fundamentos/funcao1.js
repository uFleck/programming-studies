// Função sem retorno 
function imprimirSoma(a, b) {
  console.log(a + b || 'Passe dois parâmetros!')
}

imprimirSoma(10, 20)
imprimirSoma(10)
imprimirSoma(19, 20, 20, 20, 30, 40518)
imprimirSoma()

// Função com retorno

function soma(a, b = 1) {
  return a + b
}

console.log(soma(2, 3))
console.log(soma(2))
console.log(soma())