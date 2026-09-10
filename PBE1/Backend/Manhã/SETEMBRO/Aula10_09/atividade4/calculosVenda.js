function calcularTotal(preco, quantidade) {
    return preco*quantidade;
}

function gerarCupom(nome, valor) {
    return `Cliente: ${nome} - Total: R$ ${valor.toFixed(2)}`;
}

module.exports = {
    calcularTotal,
    gerarCupom
}