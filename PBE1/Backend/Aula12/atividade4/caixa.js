const entrada = require('readline-sync');
const venda = require('./calculosVenda.js');

const nome = entrada.question("Informe seu nome completo: ")
const quantidade = entrada.questionInt("Informe a quantidade de produtos comprados: ")
const preco =  entrada.questionFloat("Informe o valor por unidade: ")
const valorTotal = venda.calcularTotal(preco, quantidade)

console.log("=== CUPOM FINAL ===");
console.log(venda.gerarCupom(nome, valorTotal))

