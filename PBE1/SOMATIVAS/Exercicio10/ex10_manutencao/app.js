const entrada = require('readline-sync');
const manutencao = require('./funcoesManutencao.js')

const nomeMaquina = entrada.question("Informe o nome da maquina: ");
const valorPecas = entrada.questionFloat("Informe o valor das pecas usadas: ");
const horasServico = entrada.questionFloat("Informe as horas de servico gastas com a maquina: ");
const mesesUltimaManutencao = entrada.questionInt("Informe a quantidade de meses desde a ultima manutencao da maquina: ");

const maoDeObra = manutencao.calcularMaoDeObra(horasServico);
const valorTotal =  manutencao.calcularTotal(valorPecas, maoDeObra);
const situacaoGarantia = manutencao.verificarGarantia(mesesUltimaManutencao);

console.log("=== RELATORIO FINAL ===");
console.log(`Nome da Maquina: ${nomeMaquina}`);
console.log(`Valor da Mao de Obra: ${maoDeObra.toFixed(2)}`);
console.log(`Valor das pecas: R$${valorPecas.toFixed(2)}`);
console.log(`Valor Total: R$${valorTotal.toFixed(2)}`);
console.log(`Situacao Garantia: ${situacaoGarantia}`);
