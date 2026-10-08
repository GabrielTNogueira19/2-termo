const entrada = require('readline-sync');

// Buscando ferramentas no arquivo funcoesOficina.js
// o "./" significa "Nesta mesma pasta"

const oficina = require('./funcoesOficina')

console.log("=== SISTEMA DE GESTAO DE OFICINA ===");

const peca = entrada.questionFloat("Preco da peca: R$ ")
const horas = entrada.questionInt("Horas de servico: ")
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto: ")

// Usamos o nome 'oficina' (que damos no require) seguido do ponto .
const totalFinal = oficina.calcularOrcamento(peca, horas);
const statusGarantia = oficina.verificarGarantia(tempoUso);
const valorDesconto = oficina.aplicarDesconto(totalFinal)

console.log("\n--- RELATORIO FINAL ---");
console.log(`Orcamento com desconto: R$ ${valorDesconto.toFixed(2)}`);
console.log(`Orcamento sem desconto: R$ ${totalFinal.toFixed(2)}`);
console.log(`Status do veiculo: ${statusGarantia}`);

// Potencial melhoria --->
// ------------------------------------------------------------------------------------------------
// const desconto = entrada.keyInYNStrict("Deseja aplicar desconto? ")

// console.log("\n--- RELATORIO FINAL ---");

// if (desconto === true){
//     const valorDesconto = oficina.aplicarDesconto(totalFinal)

//     console.log(`Total a pagar com 5% de desconto: R$ ${valorDesconto.toFixed(2)}`);
// } else {
//     console.log(`Total a pagar: R$ ${totalFinal.toFixed(2)}`);
// }

// console.log(`Status do veiculo: ${statusGarantia}`);
// ------------------------------------------------------------------------------------------------
