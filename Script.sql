CREATE DATABASE notrello;

USE notrello;

CREATE TABLE quadro (
    id INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    ativo BIT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE lista (
    id INT AUTO_INCREMENT,
    quadro_id INT NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    ativo BIT NOT NULL,
    CONSTRAINT pk_lista PRIMARY KEY(id),
    CONSTRAINT fk_lista_quadro FOREIGN KEY(quadro_id) REFERENCES quadro(id)
);

CREATE TABLE colaborador (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    ativo BIT NOT NULL,
    CONSTRAINT pk_colaborador PRIMARY KEY(id)
);

CREATE TABLE etiqueta (
	id INT AUTO_INCREMENT,
    descricao VARCHAR(25) NOT NULL,
    ativo BIT NOT NULL,
    CONSTRAINT pk_etiqueta PRIMARY KEY(id)
);

CREATE TABLE cartao (
    id INT AUTO_INCREMENT,
    lista_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    url_pr VARCHAR(255) NOT NULL,
    url_branch VARCHAR(255) NOT NULL,
    ativo BIT NOT NULL,
    CONSTRAINT pk_cartao PRIMARY KEY(id),
    CONSTRAINT fk_cartao_lista FOREIGN KEY(lista_id) REFERENCES lista(id)
);

CREATE TABLE cartao_colaborador (
    id INT AUTO_INCREMENT,
    cartao_id INT NOT NULL,
    colaborador_id INT NOT NULL,
    CONSTRAINT pk_cartao_colaborador PRIMARY KEY(id),
    CONSTRAINT fk_cartao_colaborador_cartao FOREIGN KEY(cartao_id) REFERENCES cartao(id),
    CONSTRAINT fk_cartao_colaborador_colaborador FOREIGN KEY(colaborador_id) REFERENCES colaborador(id)
);

CREATE TABLE cartao_etiqueta (
    id INT AUTO_INCREMENT,
    cartao_id INT NOT NULL,
    etiqueta_id INT NOT NULL,
    CONSTRAINT pk_cartao_etiqueta PRIMARY KEY(id),
    CONSTRAINT fk_cartao_etiqueta_cartao FOREIGN KEY(cartao_id) REFERENCES cartao(id),
    CONSTRAINT fk_cartao_etiqueta_etiqueta FOREIGN KEY(etiqueta_id) REFERENCES etiqueta(id)
);

CREATE TABLE cartao_arquivo (
    id INT AUTO_INCREMENT,
    cartao_id INT NOT NULL,
    url_arquivo VARCHAR(255) NOT NULL,
    CONSTRAINT pk_cartao_arquivo PRIMARY KEY(id),
    CONSTRAINT fk_cartao_arquivo_cartao FOREIGN KEY(cartao_id) REFERENCES cartao(id)
);

CREATE TABLE cartao_historico (
    id INT AUTO_INCREMENT,
    cartao_id INT NOT NULL,
    colaborador_id INT NOT NULL,
    data DATETIME NOT NULL,
    historico TEXT NOT NULL,
    CONSTRAINT pk_cartao_historico PRIMARY KEY(id),
    CONSTRAINT fk_cartao_historico_cartao FOREIGN KEY(cartao_id) REFERENCES cartao(id),
    CONSTRAINT fk_cartao_historico_colaborador FOREIGN KEY(colaborador_id) REFERENCES colaborador(id)
);
