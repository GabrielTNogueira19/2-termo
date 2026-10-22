const entrada = require('readline-sync');

const rendaMensal = entrada.questionFloat("Informe sua renda mensal: ");
const nomeSujo = entrada.keyInYNStrict("Seu nome esta limpo?");

if (rendaMensal > 2000 && nomeSujo === false){
    console.log("Emprestimo APROVADO!");    
} else{
    console.log("Emprestimo NEGADO!");   
}