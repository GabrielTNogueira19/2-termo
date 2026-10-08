const fs = require('fs');

if(fs.existsSync("materiais.json")){

    const dados = fs.readFileSync("materiais.json", "utf-8")
    const materiais = JSON.parse(dados);

    for(let i = 0; i < materiais.length; i++){
        
        console.log(`\n=== Material ${i+1} ===`);
        console.log(`Descricao: ${materiais[i].descricao}`);
        console.log(`Quantidade: ${materiais[i].quantidade}`);
        console.log(`Valor Unitario: R$${materiais[i].valorUnitario.toFixed(2)}`);
        
        const valorEstoque = materiais[i].quantidade * materiais[i].valorUnitario 
        
        console.log(`Valor em Estoque: R$${valorEstoque.toFixed(2)}`);
        console.log("=================");
    }

} else {

    console.log("Arquivo nao existente");
}