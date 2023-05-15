CREATE TABLE pessoas (
	id char(36) PRIMARY KEY,
	nome varchar(100) NOT NULL,
	documento varchar(50),
	email varchar(50),
	telefone varchar(20), 
	created_at timestamp default current_timestamp
);

CREATE TABLE enderecos (
	id char(36) PRIMARY KEY,
	pessoa_id char(36) NOT NULL,
	cep char(8) NOT NULL,
	logradouro varchar(100) NOT NULL,
	complemento varchar(50),
	bairro varchar(50) NOT NULL,
	cidade varchar(50) NOT NULL,
	uf char(2) NOT NULL,
	created_at timestamp default current_timestamp,
	CONSTRAINT enderecos_pessoa_id_fk FOREIGN KEY (pessoa_id) REFERENCES pessoas(id) ON DELETE CASCADE
);
CREATE INDEX enderecos_pessoa_id ON enderecos (pessoa_id);
