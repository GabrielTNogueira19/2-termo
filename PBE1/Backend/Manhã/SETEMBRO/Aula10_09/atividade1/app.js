const entrada = require('readline-sync');
const conversor = require('./conversor.js')

valorAConverter = entrada.questionFloat("Informe o valor em dolar que voce deseja convereter: ")
console.log(conversor.conversorValor(valorAConverter))