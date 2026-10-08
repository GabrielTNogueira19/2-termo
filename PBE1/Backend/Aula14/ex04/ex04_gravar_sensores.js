const fs = require('fs');

const sensores = [
    {
        codigo: 101,
        tipo:"temperatura",
        valor: 118,
        unidade: "°C",
        status: "ALERTA"
    },
    {
        codigo: 102,
        tipo:"pressao",
        valor: 180,
        unidade: "bar",
        status: "NORMAL"
    },
    {
        codigo: 103,
        tipo:"vibracao",
        valor: 8,
        unidade: "mm/s",
        status: "ALERTA"
    },
    {
        codigo: 104,
        tipo:"umidade",
        valor: 52,
        unidade: "%",
        status: "NORMAL"
    },
    {
        codigo: 105,
        tipo:"velocidade",
        valor:1750,
        unidade: "rpm",
        status: "NORMAL"
    }
]

const dadosParaGravar = JSON.stringify(sensores, null, 2);
const nomeDoArquivo = "monitoramento.json";

fs.writeFileSync(nomeDoArquivo, dadosParaGravar);
console.log("Gravacao concluida");