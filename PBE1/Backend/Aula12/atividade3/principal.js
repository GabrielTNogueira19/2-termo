const entrada = require('readline-sync');
const checagem = require('./sensor.js');

const temperatura = entrada.questionFloat("Informe a temperatura atual da caldeira: ")
const umidade = entrada.questionFloat("Informe a umidade do ar: ")

console.log(checagem.checarTemperatura(temperatura))
console.log(checagem.checarUmidade(umidade))