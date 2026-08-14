const entrada = require('readline-sync');

function calcularMedia(n1, n2){
    return (n1+n2)/2
}
const valor1 = entrada.questionFloat("Digite o numero 1:")
const valor2 = entrada.questionFloat("Digite o numero 2:")

const resultado = calcularMedia(valor1, valor2);
console.log(`A media calculada foi: ${resultado}`);
