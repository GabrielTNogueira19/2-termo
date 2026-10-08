const fs = require('fs');

const temperaturas = [180, 250, 390, 300];

const dadosParaGravar = JSON.stringify(temperaturas, null, 2)
const nomeDoArquivo = "temperaturas.json"

fs.writeFileSync(nomeDoArquivo, dadosParaGravar)
console.log("Gravacao Concluida");