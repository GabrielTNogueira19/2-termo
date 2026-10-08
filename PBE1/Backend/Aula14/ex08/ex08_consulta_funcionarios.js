const entrada = require('readline-sync');
const fs = require('fs');

const dados = fs.readFileSync("matriculas.js", "utf-8")
const matriculas = JSON.parse(dados)

const matriculaDesejada = entrada.questionInt("Informa a matricula que deseja consultar: ")

let funcionarioEncontrado = false

matriculas.forEach((matricula, index) => {
    if (matricula.nMatricula === matriculaDesejada){
        funcionarioEncontrado = true
        console.log("\nFuncionario Encontrado!");
        console.log(`Nome: ${matricula.nome}`);
        console.log(`Setor: ${matricula.setor}`);
        console.log(`Cargo: ${matricula.cargo}\n`);
    }
});

if (funcionarioEncontrado === false){
    console.log(`Funcionaro de matricula: ${matriculaDesejada}. Nao encontrado!`);
}