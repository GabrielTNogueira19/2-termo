const entrada = require('readline-sync');;

const pesoPeca = entrada.questionFloat("Informe o peso da peca que deseja consultar em gramas: ");

if (pesoPeca >= 95 && pesoPeca <= 105) {
    console.log(`Peca com ${pesoPeca}g. PECA APROVADA!`);
} else {
    console.log("PECA REPROVADA!");
}