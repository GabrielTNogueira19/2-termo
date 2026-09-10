const entrada = require('readline-sync');
const conversor = require('./conversor.js')

const valorAConverter = entrada.questionFloat("Informe o valor em dolar que voce deseja convereter: ")

const valorReal = conversor.conversorValor(valorAConverter) 
console.log(`O valor convertido em reais é aproximadamente R$ ${valorReal.toFixed(2)}`)