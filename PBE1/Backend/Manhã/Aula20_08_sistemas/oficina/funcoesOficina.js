function calcularOrcamento(precoPeca, horasTrabalho) {
    const valorHora = 85.00;
    const totalMaoDeObra = valorHora*horasTrabalho;
    return precoPeca + totalMaoDeObra;
}

function verificarGarantia(meses) {
    if (meses <= 3){
        return "Dentro da Garantia";
    } else {
        return "Garantia Expirada";
    }
}

function aplicarDesconto(valorTotal){
    return valorTotal*0.95;
}

module.exports = {
    calcularOrcamento,
    verificarGarantia,
    aplicarDesconto
}