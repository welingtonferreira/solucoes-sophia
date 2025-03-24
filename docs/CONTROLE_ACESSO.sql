CREATE TABLE controle_acesso (
    id_usuario INT NOT NULL,	
    codigo_menu INT NOT NULL,
    caption_menu VARCHAR(100) NOT NULL,
    menu VARCHAR(100) NOT NULL,
    permitir SMALLINT NOT NULL DEFAULT 0,  -- 0 para não permitir, 1 para permitir
    PRIMARY KEY (id_usuario, codigo_menu)
);