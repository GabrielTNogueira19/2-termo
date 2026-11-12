const entrada = require('readline-sync');

let armazemComponentes = [];

for(let i = 0; i < 3; i++){
    console.log("=======================================================================");
    let nome = entrada.question(`Informe o nome do Componente ${i+1}: `);
    let quantidade = entrada.questionInt(`Informe a quantidade disponivem em estoque do Componente ${i+1}: `);
    let estoqueMinimo = entrada.question(`Informe o estoque minimo necessario para o Componente ${i+1}: `);
    
    armazemComponentes.push({nome: nome, quantidade: quantidade, estoqueMinimo: estoqueMinimo});
}

for(let i = 0; i < armazemComponentes.length; i++){
    console.log(`=== Status do Estoque do Componente ${i+1} ===`);
    if(armazemComponentes[i].quantidade < armazemComponentes[i].estoqueMinimo){
        console.log(`Componente ${i+1} necessario REPOR ESTOQUE!`);
    } else{
        console.log(`Componente ${i+1} ESTOQUE OK!`);
    }
}

