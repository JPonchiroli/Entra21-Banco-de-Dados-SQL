-- 3. a) Criacao do Database
create database trabalho_estoque; 
-- 3. b) Criacaco do Usuario com Senha
create user 'admin' identified by '123'; 
-- 3. c) Garantindo Privilégios ao Usuario
grant all privileges on trabalho_estoque.* to 'admin'; 

-- 3. d) Criacao da Tabela Produtos
create table produtos( 
    id_produto int auto_increment,
    nome_produto varchar(45) not null,
    descricao_produto varchar(45) not null,
    preco_unitario decimal(10, 2),
    primary key(id_produto)
);

-- 3. d) Criacao da Tabela Entradas Estoque
drop table entradas_estoque;
create table entradas_estoque( 
    id_entrada int auto_increment,
    id_produto int not null,
    quantidade_entrada int not null,
    data_entrada date not null,
    primary key(id_entrada),
    foreign key(id_produto) references produtos(id_produto)
);

-- 3. d) Criacao da Tabela Saidas Estoque
create table saidas_estoque(
    id_saida int auto_increment,
    id_produto int not null,
    quantidade_saida int not null,
    data_saida date not null,
    primary key(id_saida),
    foreign key(id_produto) references produtos(id_produto)
);

-- 4.1 Inserção de Dados
insert into produtos (nome_produto, descricao_produto, preco_unitario) values 
    ('Meia Soquete Masculina', 'Tam. 39 a 41', 7),
    ('Meia Soquete Feminina', 'Tam. 34 a 39', 7),
    ('Meia Soquete Infantil', 'Tam. P 23 a 26', 5),
    ('Meia Soquete Infantil', 'Tam. M 27 a 30', 5),
    ('Meia Soquete Infantil', 'Tam. G 31 a 34', 5),
    ('Meia Sapatilha Invisível Masculina', 'Tam. 39 a 41', 6),
    ('Meia Sapatilha Invisível Feminina', 'Tam. 34 a 39', 6),
    ('Meia Sapatilha Invisível Infantil', 'Tam. P 23 a 26', 4.5),
    ('Meia Sapatilha Invisível Infantil', 'Tam. M 27 a 30', 4.5),
    ('Meia Sapatilha Invisível Infantil', 'Tam. G 31 a 34', 4.5);
    

-- 4.2 Inserção de Dados
insert into entradas_estoque (id_produto, quantidade_entrada, data_entrada) values 
    (1, 10, '2023-11-01'),
    (2, 15, '2023-11-02'),
    (3, 11, '2023-11-03'),
    (4, 16, '2023-11-04'),
    (5, 12, '2023-11-05'),
    (6, 17, '2023-11-06'),
    (7, 13, '2023-11-07'),
    (8, 18, '2023-11-08'),
    (9, 14, '2023-11-09'),
    (10, 19, '2023-11-10');
    
    
-- 4.3 Inserção de Dados    
insert into saidas_estoque (id_produto, quantidade_saida, data_saida) values 
    (1, 5, '2023-11-01'),
    (2, 8, '2023-11-02'),
    (3, 6, '2023-11-03'),
    (4, 8, '2023-11-04'),
    (5, 6, '2023-11-05'),
    (6, 9, '2023-11-06'),
    (7, 7, '2023-11-07'),
    (8, 9, '2023-11-08'),
    (9, 7, '2023-11-09'),
    (10, 10, '2023-11-10');
    

-- 5.1.1 Execute comandos INSERT para adicionar novos produtos, operações de entrada e saída.
insert into produtos (nome_produto, descricao_produto, preco_unitario) values 
    ('Meia Cano Longo Masculina', 'Tam. 39 a 41', 10),
    ('Meia Cano Longo Feminina', 'Tam. 34 a 39', 10),
    ('Meia Cano Longo Infantil', 'Tam. P 23 a 26', 8),
    ('Meia Cano Longo Infantil', 'Tam. M 27 a 30', 8),
    ('Meia Cano Longo Infantil', 'Tam. G 31 a 34', 8);
 

-- 5.1.2 Execute comandos INSERT para adicionar novas operações de entrada.
insert into entradas_estoque (id_produto, quantidade_entrada, data_entrada) values -- 5.1.2 Inserção de Dados
    (11, 5, '2023-11-02'),
    (12, 7, '2023-11-04'),
    (13, 6, '2023-11-06'),
    (14, 8, '2023-11-08'),
    (15, 6, '2023-11-10');

-- 5.1.3 Execute comandos INSERT para adicionar novas operações de saída.
insert into saidas_estoque (id_produto, quantidade_saida, data_saida) values 
    (11, 2, '2023-11-01'),
    (12, 3, '2023-11-02'),
    (13, 3, '2023-11-03'),
    (14, 4, '2023-11-04'),
    (15, 3, '2023-11-05');
   
   
-- 5.2 Utilize comandos UPDATE para modificar a quantidade em estoque de um produto.
update entradas_estoque 
set quantidade_entrada = 12
where id_entrada = 1 and
      id_produto  = 1;

-- 5.3 Execute comandos DELETE para remover registros
delete from saidas_estoque
where id_saida = 15;

-- 5.4.1 Explore diferentes variações de comandos SELECT
select * from produtos
order by nome_produto;

-- 5.4.2 Explore diferentes variações de comandos SELECT
select * from entradas_estoque
order by quantidade_entrada;

-- 5.4.3 Explore diferentes variações de comandos SELECT
select * from saidas_estoque
order by quantidade_saida desc;

-- 5.4.4 Explore diferentes variações de comandos SELECT
select count(nome_produto) as "Quantiade de Produtos Cadastrados" 
from produtos;

-- 5.5

-- 5.6 Liste as operações de entrada em um determinado período.
select p.id_produto, p.nome_produto, e.quantidade_entrada, e.data_entrada
from produtos p, entradas_estoque e
where p.id_produto = e.id_produto and
e.data_entrada = '2023-11-01';

-- 5.7 Mostre as operações de saída de um produto específico.
select p.id_produto, p.nome_produto, s.quantidade_saida
from produtos p, saidas_estoque s
where p.id_produto = s.id_produto and
p.nome_produto like 'Meia Soquete%'

-- 5.8
-- 5.9
-- 5.10
