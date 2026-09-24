const entrada = require('readline-sync');

const num = entrada.questionInt("Tabuada de qual número? ")

for(let i = 1; i<=10; i++){
    console.log(`${num} x ${i} = ${num * i}`); 
}