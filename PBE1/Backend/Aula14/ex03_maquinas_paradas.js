const fs = require('fs');

let contagemParadas = 0

if(fs.existsSync("equipamentos.json")){
    const dados = fs.readFileSync("equipamentos.json", "utf-8")
    const equipamentos = JSON.parse(dados);

    console.log("\n=== EQUIPAMENTOS PARADOS ===");

    for(let i = 0; i < equipamentos.length; i++){
        if(equipamentos[i].operacional === false){
            console.log(`\n${equipamentos[i].nome} - ${equipamentos[i].setor}`);
            contagemParadas += 1;
        }
    }

    console.log(`Total de Equipamentos Parados: ${contagemParadas}\n`);

} else {
    console.log("Arquivo nao existente");
}