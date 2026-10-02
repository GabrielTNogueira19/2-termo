const fs = require('fs');

const dados = fs.readFileSync("relatorio.json", "utf-8")
const relatorios = JSON.parse(dados);

let status = 0

console.log("\n=== Relatorio de Producao ===");

relatorios.forEach((relatorio, index) => {
    const percentual = (relatorio.produzido / relatorio.meta) * 100;
    if (percentual >= 100){
        status = "Meta Atingida";
    }else if(percentual >= 80){
        status = "ATENCAO";
    }else{
        status = "ABAIXO DA META";
    }

    console.log(`\n=== Maquina ${index + 1}===`);

    console.log(`\nMaquina: ${relatorio.maquina}`);
    console.log(`Meta: ${relatorio.meta}`);
    console.log(`Produzido: ${relatorio.produzido}`);
    console.log(`Desempenho: ${percentual.toFixed(2)}%`);
    console.log(`Situacao: ${status}`);

});