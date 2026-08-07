const entrada = require('readline-sync');

const rendaMensal = entrada.questionFloat("Informe sua renda mensal: ");
const nomeSujo = entrada.keyInYNStrict("Seu nome está limpo?");

if (rendaMensal > 2000 && nomeSujo === false){
    console.log("Empréstimo APROVADO!");    
} else{
    console.log("Empréstimo NEGADO!");   
}