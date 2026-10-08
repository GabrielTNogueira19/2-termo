const entrada = require('readline-sync')
const balanca = require('./funcoesBalanca')

let sistemaAtivo = true

while(sistemaAtivo){
    try{
        let leitura = entrada.question("Informe o peso da peca ou digite sair para encerrar o sistema: ")

        if (leitura.toLowerCase() === 'sair') break;

        let resultado = balanca.verificarPeso(leitura)
        
        console.log(`\n✅ SUCESSO: A peca pesa ${resultado}g`);

    } catch (erro) {
        console.log(`\n⚠️  ALERTA: ${erro.message}`);
    }
}