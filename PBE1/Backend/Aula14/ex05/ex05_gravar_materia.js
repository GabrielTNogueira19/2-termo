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
        descricao: "Aluminio", 
        quantidade: 75, 
        valorUnitario: 47.00 
    },
    { 
        codigo: 103, 
        descricao: "Cobre", 
        quantidade: 115, 
        valorUnitario: 38.00
    } 
];

const dadosParaGravar = JSON.stringify(materiais, null, 2);
const nomeDoArquivo = "materiais.json";

fs.writeFileSync(nomeDoArquivo, dadosParaGravar);
console.log("Gravacao concluida")