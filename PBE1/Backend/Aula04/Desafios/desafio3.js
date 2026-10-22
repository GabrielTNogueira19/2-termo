const entrada = require('readline-sync');

const precoGasolina = entrada.questionFloat("Insira o valor do litro de gasolina: ");
const precoAlcool = entrada.questionFloat("Insira o valor do litro de alcool: ");

const diferenca = precoAlcool / precoGasolina;

if (diferenca < 0.7){
    console.log("Abasteça com alcool!");
} else{
    console.log("Abasteça com gasolina!");    
}
