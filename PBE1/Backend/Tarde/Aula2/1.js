const entrada = require('readline-sync')

console.log("--- SISTEMA DE ANALISE DE CREDITO ---")

const nome = entrada.question("Nome do Cliente: ")
const idade = entrada.questionInt("Idade: ")
const renda = entrada.questionFloat("Renda Mensal: ")
const temImovel = entrada.keyInYNStrict("Possui imovel proprio?")

if (idade >= 18 && (renda >= 2500 || temImovel === true)){
    console.log(`\nPARABENS, ${nome}! Seu credito foi APROVADO!`);
} else{
    console.log("RECUSADO!");
}
