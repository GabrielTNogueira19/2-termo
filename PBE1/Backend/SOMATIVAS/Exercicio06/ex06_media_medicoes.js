const entrada = require('readline-sync');

let somaValores = 0;
let quantidadeValores = 0;

for(let i = 0; i < 5; i++){
    let valor = entrada.questionFloat(`Informe o valor ${i+1}: `);
    somaValores += valor;
    quantidadeValores += 1;
}

const mediaValores = somaValores / quantidadeValores;

console.log(`A soma dos valores foi igual a ${somaValores} com uma media de ${mediaValores}!`);
