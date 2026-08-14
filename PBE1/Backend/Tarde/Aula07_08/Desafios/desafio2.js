const entrada = require('readline-sync');

console.log("--- CALCULADORA DE DESCONTOS ---");

const valorGasto = entrada.questionFloat("Informe o valor total de sua conta: ");

let novoValor = 0;

if (valorGasto >= 100){
    novoValor = valorGasto - ((valorGasto * 10)/100);
    console.log(`Sua conta de ${valorGasto.toFixed(2)} reais ficou em ${novoValor.toFixed(2)} reais com 10% de desconto!`);
} else {
    console.log(`Sua conta ficou em um total de ${valorGasto.toFixed(2)} reais`);    
}


