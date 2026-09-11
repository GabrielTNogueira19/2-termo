const entrada = require('readline-sync');

let nomesCadastrados = [];

for(let i = 0; i < 5; i++){
    let nome = entrada.question(`Informe o nome do operador ${i+1}: `);
    nomesCadastrados.push(nome);
}

console.log("=== Lista dos Cadastros ===");

for(let i = 0; i < nomesCadastrados.length; i++){
    console.log(`${i+1} - ${nomesCadastrados[i]}`);
}

