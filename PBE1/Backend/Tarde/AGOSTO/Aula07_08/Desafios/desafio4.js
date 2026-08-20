const entrada = require('readline-sync');

const idade = entrada.questionInt("Informe sua idade: ");

if (idade >= 5 && idade <= 10){
    console.log("Voce esta na turma INFANTIL");
}
else if (idade >= 11 && idade <= 17){
    console.log("Voce esta na turma JUVENIL");
}
else if (idade >= 18 && idade <= 60){
    console.log("Voce esta na turma ADULTO");
}
else if (idade > 60){
    console.log("Voce esta na turma SÊNIOR");
}
else{
    console.log("Sinto muito, pois você não esta apto para nenhuma turma.");
    
}
