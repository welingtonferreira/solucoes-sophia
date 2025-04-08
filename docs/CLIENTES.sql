CREATE TABLE clientes (
    id_cliente INT IDENTITY(1,1) NOT NULL,
    nome_completo NVARCHAR(255) NOT NULL,
    cpf_cnpj NVARCHAR(18) NOT NULL,
    telefone NVARCHAR(15) NULL,
    email NVARCHAR(100) NULL,
    endereco_completo NVARCHAR(255) NULL,
    PRIMARY KEY (id_cliente),
    UNIQUE (cpf_cnpj)
);
