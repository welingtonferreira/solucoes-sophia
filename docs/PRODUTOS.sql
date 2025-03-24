CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(255) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `estoque_disponivel` int(11) DEFAULT '0',
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `uq_produto_nome` (`nome_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1