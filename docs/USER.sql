CREATE TABLE [user] (
    id INT IDENTITY(1,1) NOT NULL,                 -- ID do Usuário
    nome NVARCHAR(100) NOT NULL,                  -- Nome do Usuário
    cpf CHAR(11) NULL,                            -- CPF
    rg NVARCHAR(20) NULL,                         -- RG
    email NVARCHAR(100) NULL,                     -- E-mail
    cel NVARCHAR(15) NULL,                        -- Celular
    tel NVARCHAR(15) NULL,                        -- Telefone
    login NVARCHAR(50) NOT NULL,                  -- Login
    senha NVARCHAR(100) NOT NULL,                 -- Senha
    administrador BIT NOT NULL DEFAULT 0,         -- Administrador (0 = Não, 1 = Sim)
    PRIMARY KEY (id)                              -- Chave Primária
);

-- user/senha: sophia / sophia
INSERT INTO [user] (login, senha, nome, administrador)
VALUES ('sophia', '2EE0272B8E1A9705DC3EBE91C10B32F4', 'Soluções Sophia', 1);
