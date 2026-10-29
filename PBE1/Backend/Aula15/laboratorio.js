const fs = require('fs');

const texto = fs.readFileSync('maquinas.json', 'utf8');
const maquinas = JSON.parse(texto);

// --- ex1 ---

// • Quantos objetos existem no array?
// R: Existem 4 objetos no array.
// ---
// • Qual propriedade representa o identificador único?
// R: O identificador unico é representado pela propriedade "id".
// ---
// • Qual é o tipo de dado do valor da propriedade id?
// R: O valor de id é um dado no tipo "Number".
// ---
// • Quais máquinas estão no setor Usinagem?
// R: No setor de usinagem estão ao maquinas:
// - Torno C
// - Fresa D
// ---


// --- ex2 ---
// console.log(typeof texto);
// console.log(texto);

// --- ex3 ---
// console.log(Array.isArray(maquinas));
// console.log(maquinas.length);
// console.log(maquinas[0].nome);

// --- ex4 ---
// maquinas.forEach((maquina, indice) => {
//     console.log(`${indice + 1}. ${maquina.nome} - ${maquina.setor} -- ${maquina.status}`);
// });

// --- ex5 ---
// const procurada = maquinas.find(maquina => maquina.id === 2);
// console.log(procurada);

// if (procurada !== undefined) {
//     console.log(procurada.nome);
// } else{
//     console.log("Maquina Nao Encontrada");
// }

// --- ex6 ---
// const emManutencao = maquinas.filter(
//     maquina => maquina.status === "Manutencao"
// );

// console.log(emManutencao.length);
// console.log(emManutencao);

// const paradas = maquinas.filter(maquina => maquina.status === "Parada");
// console.log(paradas);
// console.log(paradas.length);

// teste com maquinas de usinagem
// ---
// const maquinasUsinagem = maquinas.filter(maquina => maquina.setor === "Usinagem");
// console.log(maquinasUsinagem.length);
// console.log(maquinasUsinagem);

// teste com maquinas de montagem
// ---
// const maquinasMontagem = maquinas.filter(maquina => maquina.setor === "Montagem");
// console.log(maquinasMontagem.length);
// console.log(maquinasMontagem);

// --- ex7 ---
// Acredito que o mais recomendado seria o filter(), pois ele seleciona todas as maquinas que estivessem com o status "parado" 

// --- ex9 ---
// try{
//     const texto = fs.readFileSync('maquinas.json', 'utf8');
//     const maquinas = JSON.parse(texto);
//     console.log(`Registros carregados: ${maquias.length}`);
// } catch(erro) {
//     console.log("Não foi possível carregar os dados");
//     console.log(erro.message);
// }

// mensagem com o nome correto:
// Registros carregados: 4
// ---
// mensagem com o nome errado
// Não foi possível carregar os dados
// maquias is not defined
// ---


// --- ex10 ---
// Desafio A - Fundamental. Exiba uma linha para cada máquina no padrão ID | Nome | Status. Utilize o array carregado do JSON.

// maquinas.forEach((maquina, indice) => {
//     console.log(`ID: ${maquina.id} | Nome: ${maquina.nome} | Status: ${maquina.status}`);
// });

// ---

// Desafio B - Intermediário. Leia um ID de uma variável, localize a máquina e mostre o setor. Se não existir, apresente uma mensagem amigável.

// const procurarId = maquinas.find(maquina => maquina.id === 1)

// if (procurarId !== undefined) {
//     console.log(`Maquina: ${procurarId.nome} | Setor: ${procurarId.setor}`);
// } else{
//     console.log("A maquina procurada Nao foi Encontrada");
// }

// ---

// Desafio C - Intermediário. Crie uma variável com o nome de um setor. Exiba quantas máquinas pertencem a ele e os nomes encontrados.

// const usinagem = maquinas.filter(maquina => maquina.setor.toLowerCase() === "usinagem")

// console.log(`\nQuantidade de maquinas no setor: ${usinagem.length}\n`);
// console.log(usinagem);

// ---

// Desafio D - Avançado. Crie uma função que receba um status por parâmetro e devolva o array
// filtrado. Teste com status existente e inexistente.

// const entrada = require('readline-sync');

// function filtrarStatus(statusDesejado) {
//     const filtro = maquinas.filter(
//         maquina => maquina.status.toLowerCase() === statusDesejado.toLowerCase()
//     );

//     return filtro;
// }

// const status = entrada.question("Qual status voce deseja consultar? ");
// const maquinasFiltro = filtrarStatus(status);

// if (maquinasFiltro.length > 0) {
//     console.log(`\nMaquinas com o status "${status}":\n`);

//     maquinasFiltro.forEach(maquina => {
//         console.log(`ID: ${maquina.id} | Nome: ${maquina.nome} | Setor: ${maquina.setor}`);
//     });

//     console.log(`\nTotal encontrado: ${maquinasFiltro.length}\n`);
// } else {
//     console.log(`\nNenhuma maquina encontrada com o status "${status}".\n`);
// }