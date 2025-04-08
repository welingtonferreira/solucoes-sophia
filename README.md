## Teste prático - SOLUCOES SOPHIA

Nome: ____________________________________________ Data: ____ / ____ / ____

Escopo do projeto
Você deverá desenvolver uma aplicação que fará um controle de vendas para clientes.
Este sistema deverá conter o cadastro de clientes, produtos e vendas. Desenvolva a
aplicação com uma boa arquitetura e estrutura de projeto, que permita futuras
expansões e manutenções. Preze pela legibilidade e organização do código.

Cadastro de cliente
Neste cadastro serão manipulados os dados dos clientes da empresa. Informações
necessárias:

? CPF, obrigatório com validação de duplicidade
? Nome, obrigatório
? Data nascimento
? E-mail
? Telefone

Cadastro de produto
Neste cadastro serão manipulados os dados dos produtos comercializados pela
empresa. Informações necessárias:

? Nome, obrigatório com validação de duplicidade

Cadastro de vendas
É a principal funcionalidade do sistema. Deve possuir uma interface com boa
usabilidade, pois será a ferramenta de trabalho dos operadores. A tela de vendas deve
permiOr selecionar um cliente pelo CPF ou Nome e realizar o lançamento de diversos
produtos em única operação. Para cada lançamento, deve exigir a seleção do produto,
seu valor unitário e a quanOdade de itens. Por fim, deve apresentar totalizadores por
item e por venda.
Informações necessárias:

? Um idenOficador da venda;
? Data da venda, sugestão da data do dia;
? CPF e Nome do cliente;
? Relação dos produtos, suas respecOvas quanOdades e preços;
? Totalização da venda.

Teste práOco

Nome: ____________________________________________ Data: ____ / ____ / ____

Delphi
? O banco de dados a ser uOlizado é o SQL Server e o desenvolvimento deve ser
realizado no Delphi 6 ou superior;
? Você deve uOlizar chaves primárias, estrangeiras, índices, campos obrigatórios e
normalização;
? Não é permiOdo uOlizar o componente TTable ou similares, use TQuery,
TADOQuery ou similares;
? UOlize preferencialmente componentes dataware, tal como TDBEdit,
TDBRadioGroup, etc;
? UOlize DataModules para colocar os componentes de acesso a banco de dados;
? Crie sua aplicação uOlizando preferencialmente a arquitetura 3-Oer (três
camadas), usando Datasnap / Midas;
? UOlize sua criaOvidade para criar uma interface simples e agradável para o
usuário.

Não uOlize somente scaffolding (geradores de código e interface)! Queremos avaliar o
código que você é capaz de produzir, o sistema em si é apenas um meio de mostrar
seus conhecimentos.

Envie o script completo de criação do banco