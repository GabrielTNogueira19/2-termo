const fs = require('fs');

const equipamentos = [
    {
        codigo: 101,
        nome:"Martelo",
        setor:"setor-A",
        operacional: true
    },
    {
        codigo: 102,
        nome:"Parafusadeira",
        setor:"setor-B",
        operacional: true
    },
    {
        codigo: 103,
        nome:"Freza",
        setor:"setor-C",
        operacional: false
    }
]

const dadosParaGravar = JSON.stringify(equipamentos, null, 2);
const nomeDoArquivo = "equipamentos.json";

fs.writeFileSync(nomeDoArquivo, dadosParaGravar);
console.log("Gravacao concluida");