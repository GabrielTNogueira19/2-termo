const fs = require('fs');

let contagemAlerta = 0

if(fs.existsSync("monitoramento.json")){
    const dados = fs.readFileSync("monitoramento.json", "utf-8")
    const sensores = JSON.parse(dados);

    console.log("=== Lista de Sensores ===");

    for(let i = 0; i < sensores.length; i++){
        console.log(`\n=== Sensor ${i+1} ===`);
        console.log(`Codigo: ${sensores[i].codigo}`);
        console.log(`Tipo: ${sensores[i].tipo}`);
        console.log(`Valor: ${sensores[i].valor}`);
        console.log(`Unidade: ${sensores[i].unidade}`);
        console.log(`Status: ${sensores[i].status}`);
        console.log("=================");
    }

    console.log("\n=== Sensores em Alerta! ===");

    for(let i = 0; i < sensores.length; i++){
        if (sensores[i].status === "ALERTA"){
            console.log(`${sensores[i].tipo} - ${sensores[i].status}`);
            contagemAlerta += 1;
        }
    }
    console.log(`\nSensores em alerta: ${contagemAlerta}`);
} else {
    console.log("Arquivo nao existente");
}