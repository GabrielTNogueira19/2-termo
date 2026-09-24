const entrada = require('readline-sync');

let pecasDefeituosas = []

const quantidadeDefeito = entrada.questionInt("Informe quantas pecas com defeito foram encontradas: ")

for(let i = 0; i < quantidadeDefeito; i++){
    const numeroSerie = entrada.question(`Informe o numero de serie da peca ${i+1}: `);
    pecasDefeituosas.push(numeroSerie);
}

console.log("=== RELATORIO FINAL ===");
console.log(`Total de Pecas: ${quantidadeDefeito}`);
console.log(`Numeros de serie: ${pecasDefeituosas}`);