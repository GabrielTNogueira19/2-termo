const entrada = require('readline-sync');

const cinema = [
    {filme: "batman", idadeMinima: 14 },
    {filme: "cinderela", idadeMinima: 0 },
    {filme: "it", idadeMinima: 18 },
];

const idade = entrada.questionInt("Insira sua idade: ")

for(let i = 0; i < cinema.length; i++){

    if (idade > cinema[i].idadeMinima){
        console.log(`Voce pode ver o filme: ${cinema[i].filme}`);
    }
}