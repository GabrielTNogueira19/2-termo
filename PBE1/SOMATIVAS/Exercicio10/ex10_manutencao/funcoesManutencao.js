function calcularMaoDeObra(horas){
    const valorHora = 80.00;
    return valorHora*horas;
}

function calcularTotal(valorPecas, valorHoras){
    return valorPecas+valorHoras;
}

function verificarGarantia(meses){
    if (meses <= 6){
        return "EM GARANTIA";
    } else{
        return "FORA DA GARANTIA";
    }
}

module.exports = {
    calcularMaoDeObra,
    calcularTotal,
    verificarGarantia
}