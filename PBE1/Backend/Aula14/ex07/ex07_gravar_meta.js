const fs = require('fs');

const relatorio = [
    {
        maquina: "Torno",
        meta: 588,
        produzido: 475
    },
    {
        maquina: "freza",
        meta: 1000,
        produzido: 300
    },
    {
        maquina: "Usinagem",
        meta: 758,
        produzido: 1520
    }
] 

const dadosParaGravar = JSON.stringify(relatorio, null, 2)
const nomeDoArquivo = "relatorio.json" 

fs.writeFileSync(nomeDoArquivo, dadosParaGravar)
console.log("Gravacao Concluida");