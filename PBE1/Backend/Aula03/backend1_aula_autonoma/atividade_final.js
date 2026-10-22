const readline =  require("readline-sync");

const nome = readline.question("Digite o nome do aluno: ");
const idade = Number(readline.question("Digite a idade do aluno: "))

const disciplina = readline.question("Digite a disciplina: ");
const nomeTurma = readline.question("Digite o nome da turma do aluno: ")
const nomeProfessor = readline.question("Digite o nome do professor: ")

const nota1 = Number(readline.question("Informe a primeira nota: "))
const nota2 = Number(readline.question("Informe a segunda nota: "))
const faltas = Number(readline.question("Informe a quantidade de faltas do aluno: "))

const media = (nota1 + nota2) / 2;

console.log("\n--- RELATÓRIO DO ALUNO ---");
console.log("Aluno:", nome);
console.log("Idade:", idade);
console.log("Disciplina:", disciplina);
console.log("Nome da turma:", nomeTurma);
console.log("Nome do professor:", nomeProfessor);
console.log("Nota 1:", nota1);
console.log("Nota 2:", nota2);
console.log("Média:", media);
console.log("Faltas:", faltas);
