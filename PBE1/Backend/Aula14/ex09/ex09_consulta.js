const entrada = require('readline-sync');
const fs = require('fs');

const dados = fs.readFileSync("materiais.json")
const materiais = JSON.parse(dados)

const codigoDesejado = entrada.questionInt("Informe o codigo do material que deseja consultar: ")

materiais.forEach((material, index) => {
    if (material.codigo === codigoDesejado){
        console.log(`Quantidade Atual em Estoque: ${material.quantidade}`);

        const novoEstoque = entrada.questionInt("Informe a nova quantidade disponivel em estoque: ")

        fs.writeFileSync("materiais_backup.json", materiais)
        console.log("Gravacao Concluida");

        material.quantidade.push(novoEstoque)

        fs.writeFileSync("materiais.json", materiais)
        console.log("Gravacao Concluida");
    }
});