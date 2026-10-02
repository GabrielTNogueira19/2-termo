const fs = require('fs');

const materiais = [ 
    { 
        codigo: 101, 
        descricao: "Aço SAE 1020", 
        quantidade: 50, 
        valorUnitario: 32.50 
    },
    { 
        codigo: 102, 
        descricao: "Alumínio", 
        quantidade: 30, 
        valorUnitario: 25.00 
    },
    { 
        codigo: 103, 
        descricao: "Cobre", 
        quantidade: 20, 
        valorUnitario: 40.00
    } 
];

const dadosParaGravar = JSON.stringify(materiais, null, 2);
const nomeDoArquivo = "materiais.json";

fs.writeFileSync(nomeDoArquivo, dadosParaGravar);
console.log("Gravacao concluida")