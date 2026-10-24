// PROJETO DO ALUNO - complete as funções abaixo.
// Execute com: npm start
const fs = require('node:fs');
const caminho = require('node:path');
const { json } = require('node:stream/consumers');
const ARQUIVO = caminho.join(__dirname, 'maquinas.json');

function carregarMaquinas(arquivo) {
  // TODO 1: ler ARQUIVO com fs.readFileSync(ARQUIVO, 'utf8').
  // TODO 2: converter o texto JSON em array com JSON.parse(...).
  // TODO 3: retornar o array.
  const texto = fs.readFileSync(arquivo, "utf8");
  const maquinas = JSON.parse(texto)

  return maquinas;

  // throw new Error('Implementar carregarMaquinas');
}

function listarMaquinas(maquinas) {
  // TODO 4: percorrer com forEach e apresentar id, nome e status.

  maquinas.forEach((maquina, indice) => {
      console.log(`id: ${maquina.id} | nome: ${maquina.nome} | setor: ${maquina.setor} | status: ${maquina.status} | horas de uso: ${maquina.horasUso} \n`);
  });
  // throw new Error('Implementar listarMaquinas');
}

function buscarPorId(maquinas, id) {
  // TODO 5: encontrar com find(). O ID recebido deve ser número.
  const idProcurado = maquinas.find(maquina => maquina.id === id);

  if (idProcurado !== undefined) {
      return idProcurado.nome;
  } else{
      return "Maquina Nao Encontrada";
  }
  
  // throw new Error('Implementar buscarPorId');
}

function filtrarPorStatus(maquinas, status) {
  // TODO 6: retornar um novo array com filter().

  const filtro = maquinas.filter(
    maquina => maquina.status.toLowerCase() === status.toLowerCase()
  );

  if (filtro.length > 0) {
    return filtro;
  } else{
    return "Nenhum registro encontrado";
  }

  // throw new Error('Implementar filtrarPorStatus');
}

function filtrarPorSetor(maquinas, setor) {
  // DESAFIO: retornar máquinas do setor informado.

  const filtro = maquinas.filter(
    maquina => maquina.setor.toLowerCase() === setor.toLowerCase()
  );

  if (filtro.length > 0) {
    return filtro;
  } else{
    return "Nenhum registro encontrado";
  }

  // throw new Error('Implementar filtrarPorSetor');
}

function executar() {
  // TODO 7: chamar carregarMaquinas, listarMaquinas e fazer consultas.
  
  console.log('Sistema de consultas industriais - CRUD READ');

  
  const maquinas = carregarMaquinas(ARQUIVO); 
  listarMaquinas(maquinas);

  console.log("Buscas por ID:")
  console.log(buscarPorId(maquinas, 3))
  console.log(buscarPorId(maquinas, 99))
  console.log("\nFiltro por status:")
  console.log(filtrarPorStatus(maquinas, "manutencao"))
  console.log(filtrarPorStatus(maquinas, "operando"))
  console.log("\nFiltro por setor:")
  console.log(filtrarPorSetor(maquinas, "inexistente"))
  console.log(filtrarPorSetor(maquinas, "Usinagem")
)
  
}

if (require.main === module) executar();
module.exports = { carregarMaquinas, listarMaquinas, buscarPorId, filtrarPorStatus, filtrarPorSetor };
