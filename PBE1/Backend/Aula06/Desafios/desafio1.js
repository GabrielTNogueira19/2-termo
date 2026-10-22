const entrada = require('readline-sync');

console.log("=== VERIFICADOR DE APOSENTADORIA ===");

const nome = entrada.question("Insira seu nome:");
const idade = entrada.questionInt("Insira sua idade:");
const tempoContribuicao = entrada.questionInt("Insira seu tempo de contribuicao:");

if (idade >= 65 || tempoContribuicao >= 30){
    console.log(`Parabens ${nome}! Voce ja pode se aposentar!!!`);
}
else{
    console.log(`Sinto muito ${nome}, voce ainda nao pode se aposentar`);
}