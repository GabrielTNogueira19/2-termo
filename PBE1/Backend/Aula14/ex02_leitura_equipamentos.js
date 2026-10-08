const fs = require('fs');

let status = 0

if(fs.existsSync("equipamentos.json")){
    const dados = fs.readFileSync("equipamentos.json", "utf-8")
    const equipamentos = JSON.parse(dados);

    console.log("=== Lista de Equipamentos ===");

    for(let i = 0; i < equipamentos.length; i++){
        console.log(`\nEquipamento ${i+1}`);
        console.log(`Codigo: ${equipamentos[i].codigo}`);
        console.log(`Nome: ${equipamentos[i].nome}`);
        console.log(`Setor: ${equipamentos[i].setor}`);

        if (equipamentos[i].operacional === true){
            status = "OPERACIONAL"
        } else{
            status = "PARADA"
        }
        console.log(`Status: ${status}`);
    }
} else {
    console.log("Arquivo nao existente");
}