// CONSULTA DE FUNCIONÁRIOS - ATIVIDADE GUIADA
// Execute depois do cadastro: node consulta.js
const fs = require('node:fs');

function carregarFuncionarios() {
  const texto = fs.readFileSync('funcionarios.json', 'utf8');
  return JSON.parse(texto);
}

function consultarPorId(funcionarios, id) {
  // PASSO 5: use find() para procurar funcionario.id === id
  const buscaId = funcionarios.find(funcionario => funcionario.id === id);
  return buscaId;
}

function consultarPorNome(funcionarios, nome) {
  // PASSO 6: use find() para procurar nome exato, sem diferenciar maiúsculas
  const buscaNome = funcionarios.find(funcionario => funcionario.nomeFuncionario.toLowerCase() === nome.toLowerCase());
  return buscaNome;
}

function filtrarPorFuncao(funcionarios, funcao) {
  // PASSO 7: use filter() para retornar todos da mesma função
  const filtroFuncao = funcionarios.filter(funcionario => funcionario.funcaoFuncionario.toLowerCase() === funcao.toLowerCase())
  return filtroFuncao;
}

function mostrarFuncionario(funcionario) {
  if (!funcionario) {
    console.log('Funcionário não encontrado.');
    return;
  }
  console.log(`ID: ${funcionario.id} | Nome: ${funcionario.nomeFuncionario} | Idade: ${funcionario.idadeFuncionario} | Função: ${funcionario.funcaoFuncionario}`);
}

try {
  const funcionarios = carregarFuncionarios();
  console.log('=== TODOS OS FUNCIONÁRIOS ===');
  funcionarios.forEach(mostrarFuncionario);
  console.log('\n=== CONSULTA POR ID 2 ===');
  mostrarFuncionario(consultarPorId(funcionarios, 99));
  console.log('\n=== CONSULTA POR NOME ===');
  mostrarFuncionario(consultarPorNome(funcionarios, "Pedro Miguel Costa"));
  console.log('\n=== FILTRO POR FUNÇÃO ===');
  // Troque o valor abaixo por uma função que você cadastrou.
  filtrarPorFuncao(funcionarios, "desenvolvedora").forEach(mostrarFuncionario);
} catch (erro) {
  console.error('Não foi possível ler o JSON. Execute primeiro node cadastro.js.');
  console.error('Detalhe:', erro.message);
}
