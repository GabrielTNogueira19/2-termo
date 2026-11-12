const entrada = require('readline-sync');

const nomeMaterial = entrada.question("Informe o nome do material comprado: ");
const quantidadeComprada = entrada.questionInt("Informe a quantidade de material comprado: ");
const precoUnitario = entrada.questionFloat("Informe o preco em reais por unidade comprada: ");

const valorCompra =  quantidadeComprada*precoUnitario;

console.log("=== Resumo da Compra ===");
console.log(`Nome do Material: ${nomeMaterial}`);
console.log(`Quantidade Comprada: ${quantidadeComprada}`);
console.log(`Preco Unitario: R$ ${precoUnitario.toFixed(2)}`);
console.log(`Valor Total da Compra: R$ ${valorCompra.toFixed(2)}`);

