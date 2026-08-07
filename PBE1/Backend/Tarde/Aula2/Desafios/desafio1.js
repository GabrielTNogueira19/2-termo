const entrada = require('readline-sync');

console.log("--- VERIFICADOR DE VOTAÇÃO ---");

const nome = entrada.question("Insira seu nome: ");
const dataNascimento = entrada.questionInt("Insira seu ano de nascimento: ");

const idade = 2026 - dataNascimento;

if (idade >= 16){
    console.log(`${nome}, você está apto para votar!`);
} else {
    console.log("Você ainda não tem idade minima para votar!");
}
