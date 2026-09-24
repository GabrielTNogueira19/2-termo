
const fs = require('fs');
console.log("=== SISTEMA DE PERSISTÊNCIA: REGISTRO DE MÁQUINAS ===");

const sensoresIndustriais = [
{ codigo: 1, tipo: "Temperatura", leituraAtual: 70.25, status: "alerta" },
{ codigo: 2, tipo: "Pressão", leituraAtual: 20.12, status: "Operando" },
{ codigo: 3, tipo: "Temperatura", leituraAtual: 45.87, status: "Operando" }
];

const dadosGravar = JSON.stringify(sensoresIndustriais, null, 2);
const nomeArquivo = "Sensores.json";

fs.writeFileSync(nomeArquivo, dadosGravar);
console.log(`Gravação concluída!`);