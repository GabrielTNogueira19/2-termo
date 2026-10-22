const entrada = require('readline-sync');

console.log("=== GERENCIADOR DE PARCELAS ===");

const valorPedido = entrada.questionFloat("Informe o valor total do pedido: ")
const parcelas = entrada.questionInt("Informe em quantas parcelas voce deseja dividir o valor (no maximo 12): ")

if (parcelas > 12 || parcelas < 1){
    console.log("Insira um numero de parcelas compativel, de 1 ate 12!");
}
else{
    const valorParcela = valorPedido/parcelas
    for(let i = 0; i < parcelas; i++){
    console.log(`parcela ${i+1}: R$ ${valorParcela.toFixed(2)}`);
}
}
