const entrada = require('readline-sync');
const fs = require('fs');

const ferramentas = [];

const loop = entrada.questionInt("Quantas ferramentas voce deseja cadastrar: ")

for(let i = 0; i < loop; i++){
    const nome = entrada.question(`Informe o nome da ferramenta ${i+1}: `);
    const qtd = entrada.questionInt(`Informe a quantidade da ferramenta ${i+1}: `);
    const custoUnitario = entrada.question(`Informe o custo unitario da ferramenta ${i+1}: `);

    ferramentas.push({nome: nome, quantidade: qtd, valorUnidade: custoUnitario});
}

const dadosGravar = JSON.stringify(ferramentas, null, 2);
const nomeArquivo = "Ferramentas.json";

fs.writeFileSync(nomeArquivo, dadosGravar);
console.log(`Gravação concluída!`);

console.log("Relatorio");

for(let i = 0; i < ferramentas.length; i++){
    console.log(`\nFerramenta ${i+1}:\n`);
    console.log(`Nome: ${ferramentas[i].nome}`);
    console.log(`Quantidade: ${ferramentas[i].quantidade}`);
    console.log(`Valor Unitario: ${ferramentas[i].valorUnidade}\n`);
}