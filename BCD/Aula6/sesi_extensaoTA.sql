create DATABASE IF NOT EXISTS sesi_extensaovsta;

use sesi_extensaovsta;

show SCHEMAS;

CREATE Table if NOT exists Alunos(
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR(60) NOT NULL,
    cpf_aluno CHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

SHOW TABLES;
DESCRIBE alunos;