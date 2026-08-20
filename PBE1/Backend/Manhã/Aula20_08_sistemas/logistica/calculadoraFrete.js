function calcularBase(km) {
    return km*2.10
}
function calcularSeguro(valorCarga) {
    return valorCarga*0.01
}
function verificarPrazo(km) {
    if (km < 100){
        return "1 Dia Util"
    }else {
        return "3 a 5 Dias Uteis"
    }
}

module.exports = {
    calcularBase,
    calcularSeguro,
    verificarPrazo
}