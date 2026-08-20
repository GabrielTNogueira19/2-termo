const entrada = require('readline-sync');

const calculadora = require('./calculadoraFrete')

const nomeProduto = entrada.question("Informe o nome do produto: ")
const distanciaKm = entrada.questionFloat("Informe a distancia percorida en KMs: ")
const valorCarga = entrada.questionFloat("Informe o valor da carga: ")

const baseFrete = calculadora.calcularBase(distanciaKm)
const calcularSeguro = calculadora.calcularSeguro(valorCarga)
const prazo = calculadora.verificarPrazo(distanciaKm)

const freteFinal = baseFrete+calcularSeguro

console.log("=== RELATORIO FINAL ===");

console.log(`Produto: ${nomeProduto}`);
console.log(`Valor Frete: R$ ${baseFrete.toFixed(2)}`);
console.log(`Valor Seguro: R$ ${calcularSeguro.toFixed(2)}`);
console.log(`Valor Total: R$ ${freteFinal.toFixed(2)}`);
console.log(`Prazo: ${prazo} `);

