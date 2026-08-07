const entrada = require('readline-sync')

const precoGasolina = entrada.questionFloat("Insira o valor do litro de gasolina: ")
const precoAlcool = entrada.questionFloat("Insira o valor do litro de álcool: ")

const diferenca = precoAlcool / precoGasolina;

if (diferenca < 0.7){
    console.log("Abasteça com álcool!");
} else{
    console.log("Abasteça com gasolina!");    
}
