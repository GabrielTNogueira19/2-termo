const fs = require('fs');
console.log("=== SISTEMA DE PERSISTÊNCIA: REGISTRO DE MÁQUINAS ===");

const maquinasIndustriais = [
{ id: 101, nome: "Torno Mecânico Universal", setor: "Usinagem", operacional: true },
{ id: 102, nome: "Fresadora Ferramenteira", setor: "Usinagem", operacional: false },
{ id: 103, nome: "Prensa Hidráulica 50T", setor: "Estampagem", operacional: true }
];

const dadosParaGravar = JSON.stringify(maquinasIndustriais, null, 2);

const nomeDoArquivo = "maquinas.json";

fs.writeFileSync(nomeDoArquivo, dadosParaGravar);
console.log(`\nGravação concluída com sucesso.`);
console.log(`Verifique o arquivo '${nomeDoArquivo}' gerado na barra lateral do VS Code.`);