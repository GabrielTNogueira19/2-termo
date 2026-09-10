const entrada = require('readline-sync');

let listaVisistantes = [];

let novoVisitante = true;

while ((novoVisitante = entrada.keyInYNStrict("Deseja cadastrar um novo visitante? ")) === true){
    let nomeVisitante = entrada.question("Informe seu nome completo: ")
    let empresaVisitante = entrada.question("Informe o nome da sua empresa: ")

    listaVisistantes.push({nome:nomeVisitante, empresa: empresaVisitante })
}

console.log("=== LISTA DE VISITANTES ===");
console.log(listaVisistantes);