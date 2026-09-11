const entrada = require('readline-sync');

const producaoCiclo = entrada.questionInt("Informe a quantidade de pecas que a maquina produz por ciclo: ");

for(let i = 0; i < 10; i++){
    console.log(`Ciclo ${i+1} = ${producaoCiclo*(i+1)}`);
}