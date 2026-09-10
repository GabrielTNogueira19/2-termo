function checarTemperatura(valor) {
    if (valor > 40) {
        return "ALERTA: Caldeira Superaquecida";
    } else {
        return "Temperatura Atual NORMAL!"
    }
}

function checarUmidade(valor) {
    if (valor < 20) {
        return "ALERTA: Ar Muito Seco"
    } else {
        return "Umidade Atual NORMAL!"
    }
}

module.exports = {
    checarTemperatura,
    checarUmidade
}