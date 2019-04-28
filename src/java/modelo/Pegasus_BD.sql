CREATE DATABASE pegasus IF NOT EXISTS;

CREATE TABLE admin (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(128) NULL,
  senha VARCHAR(16) NULL,
--   tipoUsuario VARCHAR(10) NULL,
  email VARCHAR(60) NULL,
  documento VARCHAR(20) NULL,
  telefone VARCHAR(20) NULL,
  celular VARCHAR(20) NULL,

  PRIMARY KEY(id)
);

CREATE TABLE remetente (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(128) NULL,
  senha VARCHAR(16) NULL,
--   tipoUsuario VARCHAR(10) NULL,
  docRegistro VARCHAR(20) NULL,
  email VARCHAR(60) NULL,
  telefone VARCHAR(20) NULL,
  cep VARCHAR(8) NULL,
  endereco VARCHAR(100) NULL,
  bairro VARCHAR(60) NULL,
  cidade VARCHAR(60) NULL,
  estado CHAR(2) NULL,
  latitude VARCHAR(20) NULL,
  longitude VARCHAR(20) NULL,
  PRIMARY KEY(id)
);

CREATE TABLE entregador (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(128) NULL,
  email VARCHAR(60) NULL,
  senha VARCHAR(16) NULL,
--   tipoUsuario VARCHAR(10) NULL,
  docRegistro VARCHAR(14) NULL,
  telefone VARCHAR(12) NULL,
  cep VARCHAR(8) NULL,
  endereco VARCHAR(60) NULL,
  bairro VARCHAR(60) NULL,
  estado CHAR(2) NULL,
  latitude VARCHAR(20) NULL,
  longitude VARCHAR(20) NULL,
  tipoVeiculo VARCHAR(20) NULL,
  banco VARCHAR(128) NULL,
  agencia CHAR(6) NULL,
  numConta VARCHAR(8) NULL,
  saldo DOUBLE NULL,
  totalRecebido DOUBLE NULL,
  status VARCHAR(10) NULL,
  PRIMARY KEY(id)
);

CREATE TABLE postagem (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idFkRemetente INTEGER UNSIGNED NOT NULL,
  idFkEntregador INTEGER UNSIGNED NULL,
  descricao VARCHAR(256) NULL,
  peso DOUBLE NULL,
  altura DOUBLE NULL,
  largura DOUBLE NULL,
  profundidade DOUBLE NULL,
  valorProd DOUBLE NULL,
  postUrgente CHAR(1) NULL,
  tipoPost CHAR(20) NULL,
  periodoPost VARCHAR(20) NULL,
  nomeDest VARCHAR(100) NULL,
  telefoneDest VARCHAR(12) NULL,
  emailDest VARCHAR(60) NULL,
  cepDest VARCHAR(8) NULL,
  enderecoDestino VARCHAR(100) NULL,
  bairroDestino VARCHAR(60) NULL,
  cidadeDestino VARCHAR(60) NULL,
  estadoDestino CHAR(2) NULL,
  distancia DOUBLE NULL,
  valorDistancia DOUBLE NULL,
  valorTotal DOUBLE NULL,
  statusPost VARCHAR(20) NULL,
  horaCadastro TIMESTAMP NULL,
  horaVinculo TIMESTAMP NULL,
  horaConclusao TIMESTAMP NULL,
  PRIMARY KEY(id),
  INDEX postagem_FKIndex1(idFkEntregador),
  INDEX postagem_FKIndex2(idFkRemetente)
);

CREATE TABLE escalaPeso (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(10) NULL,
  pesoMax DOUBLE NULL,
  pesoMin DOUBLE NULL,
  preco DOUBLE NULL,
  PRIMARY KEY(id)
);


