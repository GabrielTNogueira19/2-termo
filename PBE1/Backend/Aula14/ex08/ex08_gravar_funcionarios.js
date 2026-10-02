const fs = require('fs');

const matriculas = [
    {
        nMatricula: 101,
        nome: "Fernando Souza",
        setor: "Setor-A",
        cargo: "Engenheiro"
    },
    {
        matricula: 102,
        nome: "Patricia Nunes",
        setor: "Setor-B",
        cargo: "RH"
    },
    {
        matricula: 103,
        nome: "Mauricio Dias",
        setor: "Setor-C",
        cargo: "Gerente"
    },
]

const dadosParaGravar = JSON.stringify(matriculas, null, 2)
const nomeDoArquivo = "matriculas.js"

fs.writeFileSync(nomeDoArquivo, dadosParaGravar)
console.log("Gravacao Concluida");