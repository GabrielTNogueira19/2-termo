const entrada = require('readline-sync');

function calcularEficiencia(real, prevista) {
    return (real/prevista)*100;
}
function classificarEficiencia(percentual) {
    if (percentual >= 90) {
        return "META ATINGIDA";
    } else if (percentual > 70 && percentual < 90){
        return "ATENCAO";
    } else {
        return "ABAIXO DA META";
    }
}

const producaoPrevista = entrada.questionInt("Informe a producao prevista para a linha de producao: ");
const producaoReal = entrada.questionInt("Informe a producao real da linha de producao: ");

const percentualEficiencia = calcularEficiencia(producaoReal, producaoPrevista);
const classificacaoReal = classificarEficiencia(percentualEficiencia);

console.log("=== RESUMO DE EFICIENCIA ===");
console.log(`Producao Prevista: ${producaoPrevista}`);
console.log(`Producao Real: ${producaoReal}`);
console.log(`Percentual de Eficiencia: ${percentualEficiencia}%`);
console.log(`Classificacao da Linha: ${classificacaoReal}!`);
