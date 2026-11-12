const entrada = require('readline-sync');

let situaçãoMaquina = "";
const temperaturaAtual = entrada.questionFloat("Informe a temperatura atual da maquina em graus Celcius: ");

if (temperaturaAtual <= 60) {
    situaçãoMaquina = "NORMAL";
} else if (temperaturaAtual > 60 && temperaturaAtual <= 80){
    situaçãoMaquina = "ATENCAO";
} else {
    situaçãoMaquina = "CRITICA";
}

console.log(`A maquina com ${temperaturaAtual}ºC encontra-se em situacao ${situaçãoMaquina}!`);
