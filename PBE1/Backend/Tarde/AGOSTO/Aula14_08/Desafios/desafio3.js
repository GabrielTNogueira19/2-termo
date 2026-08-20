const entrada = require('readline-sync');

function calcularArea(largura, comprimento){
    return largura*comprimento
}
// JEITO 1:
const largura1 = entrada.questionFloat("Informe a largura do terreno 1: ")
const comprimento1 = entrada.questionFloat("Informe o comprimento do terreno 1:") 

const largura2 = entrada.questionFloat("Informe a largura do terreno 2:")
const comprimento2 = entrada.questionFloat("Informe o comprimento do terreno 2:") 

const largura3 = entrada.questionFloat("Informe a largura do terreno 3:") 
const comprimento3 = entrada.questionFloat("Informe o comprimento do terreno 3:")

const area1 = calcularArea(largura1,comprimento1)
const area2 = calcularArea(largura2,comprimento2)
const area3 = calcularArea(largura3,comprimento3)

console.log(`O terreno 1 tem uma area de ${area1} metros quadrados!`);
console.log(`O terreno 2 tem uma area de ${area2} metros quadrados!`);
console.log(`O terreno 3 tem uma area de ${area3} metros quadrados!`);

// JEITO 2
for(let i = 0; i < 3; i++){
    let largura = entrada.questionFloat(`Informe a largura do terreno ${i+1}: `)
    let comprimento = entrada.questionFloat(`Informe o comprimento do terreno ${i+1}:`)
    
    let area = calcularArea(largura,comprimento)

    console.log(`O terreno ${i+1} tem uma area de ${area} metros quadrados!`);
}

