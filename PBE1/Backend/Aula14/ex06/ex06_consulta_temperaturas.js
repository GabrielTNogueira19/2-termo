const { error } = require('console');
const fs = require('fs');
const { json } = require('stream/consumers');

try{

    const dados = fs.readFileSync("temperaturas.json")
    const temperaturas = JSON.parse(dados)

    for(let i = 0; i < temperaturas.length; i++){
        if (temperaturas[i] <= 350){
            console.log(`Leitura: ${temperaturas[i]} - NORMAL`);
        }else{
            throw new Error (`Temperatura de ${temperaturas[i]}°C excedeu o limite permitido`)
        }
    }

} catch (error){
    console.log("=== Alerta ===");
    console.log(`ALARME: ${error.message}`);
}