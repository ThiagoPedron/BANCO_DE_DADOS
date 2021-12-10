
CREATE TABLE  CLIENTE(
	id_cliente integer primary key not null, 
	nome_cliente varchar(50),
	endereco varchar(50),
	cidade varchar(50),
	CEP char(8),
	UF char(2),
	CNPJ numeric(20),
	IE numeric(20),
);

CREATE TABLE  VENDEDOR(
	id_vendedor integer primary key not null, 
	nome_vendedor varchar(50),
	salario_fixo numeric(10,2),
	faixa_comissao char (1),
);

CREATE TABLE  PEDIDO(
	id_pedido integer primary key not null, 
	prazo_entrega integer,
	id_cliente integer,
	id_vendedor integer,

	FOREIGN KEY (id_cliente) REFERENCES CLIENTE,
	FOREIGN KEY (id_vendedor) REFERENCES VENDEDOR,
);
CREATE TABLE  PRODUTO(
	id_produto integer primary key not null, 
	unidade_produto varchar(5),
	desc_produto varchar(100),
	val_uni_produto numeric(10,2),
);


CREATE TABLE  ITEM_PEDIDO(
	id_pedido integer, 
	id_produto integer,
	quantidade integer,
	FOREIGN KEY (id_pedido) REFERENCES PEDIDO,
	FOREIGN KEY (id_produto) REFERENCES PRODUTO,
);

INSERT INTO CLIENTE(id_cliente,nome_cliente,endereco,cidade,CEP,UF,CNPJ,IE)
VALUES
(720, 'Ana', 'Rua 17 n.19', 'Niteroi', '24358310', 'RJ', 12113231000134, 2134),
(870, 'Flávio', 'AV. Pres. Vargas 10', 'São Paulo', '22763931', 'SP', 2253412693879, 4631),
(110, 'Jorge', 'Rua Caiapo 13',	'Curitiba',	'30078500',	'PR', 1451276498349, NULL),
(222, 'Lúcia', 'Rua Itabira 123 Loja 9', 'Belo Horizonte', '22124391', 'MG', 2831521393488, 2985),
(830, 'Mauricio', 'Av. Paulista 1236 s1/2345', 'São Paulo', '3012683', 'SI', 3281698574656, 9343),
(130, 'Edmar', 'Rua da Praia sn/', 'Salvador', '30079300', 'BA',	234632842349, 7121),
(410, 'Rodolfo', 'Largo da Lapa 27 sobrado','Rio de Janeiro','30078900','RJ', 1283512823469,7431),
(20, 'Beth', 'Av. Climério n. 45','São Paulo', '25679300','SI',3248512673268,9280),
(157, 'Paulo', 'Tv. Moraes c/3','Londrina',NULL,'PR', 328482233242, 1923),
(180, 'Livia', 'Av. Beira Mar n.1256', 'Florianopolis', '30077500', 'SC', 1273657123474	, NULL),
(260, 'Susana', 'Rua Lopes Mendes 12', 'Niteroi', '30046500', 'RJ', 217635712329, 2530),
(290, 'Renato', 'Rua Meireles n. 123 b1.2 s1.345', 'São Paulo', '30225900', 'SI', 1327657112314, 1820),
(390, 'Sebastião', 'Rua da Igreja n. 10', 'Uberaba', '304387', 'MG', 321765472133, 9071),
(234, 'Jose', 'Quadra 3 bl. 3 sl.1003', 'Brasília', '22841650', 'DF',	2176357612323, 2931);



INSERT INTO VENDEDOR(id_vendedor,nome_vendedor,salario_fixo,faixa_comissao)
VALUES
(209, 'José',1800,'C'),
(111,'Carlos', 2490, 'A'),
(11,'Joao', 2780, 'C'),
(240,'Antônio', 9500, 'C'),
(720,'Felipe', 4600, 'A'),
(213,'Jonas', 2300, 'A'),
(101,'João', 2650, 'C'),
(310,'Josias', 870, 'B'),
(250,'Mauricio', 2930, 'B');

INSERT INTO PRODUTO(id_produto,unidade_produto,desc_produto,val_uni_produto)
VALUES
(25,'Kg','Queijo', 0.97),
(31,'BAR','Chocolate',0.87),
(78,'L','Vinho',2.00),
(22,'M','Linho',0.11),
(30,'SAC','Açúcar',0.30),
(53,'M','Linha',1.80),
(13,'G','Ouro',6.18),
(45,'M','Madeira',0.25),
(87,'M','Cano',1.97),
(77,'M','Papel',1.05);

INSERT INTO PEDIDO(id_pedido,prazo_entrega,id_cliente,id_vendedor)
VALUES
(121,20,410,209),
(97,20,720,101),
(101,15,720,101),
(137,20,720,720),
(148,20,720,101),
(189,15,870,213),
(104,30,110,101),
(203,30,830,250),
(98,20,410,209),
(143,30,20,111),
(105,15,180,240),
(111,20,260,240),
(103,20,260,11),
(91,20,260,11),
(138,20,260,11),
(108,15,290,310),
(119,30,390,250),
(127,10,410,11);

INSERT INTO ITEM_PEDIDO(id_pedido,id_produto,quantidade)
VALUES
(121,25,10),
(121,31,35),
(97,77,20),
(101,31,9),
(101,78,18),
(101,13,5),
(98,77,5),
(148,45,8),
(148,31,7),
(148,77,3),
(148,25,10),
(148,78,30),
(104,53,32),
(203,31,6),
(189,78,45),
(143,31,20),
(143,78,10),
(105,78,10),
(111,25,10),
(111,78,70),
(103,53,57),
(91,77,40),
(138,22,10),
(138,77,35),
(138,53,18),
(108,13,17),
(119,77,40),
(119,13,6),
(119,22,10),
(119,53,43),
(137,13,8);

/* 1 LISTAR TODOS OS PRODUTOS - DESCRICAO - UNIDADE - VAL UNITARIO*/
SELECT desc_produto,unidade_produto,val_uni_produto FROM PRODUTO
/*2  CLIENTE - CNPJ - NOME - ENDERECO*/
SELECT CNPJ,nome_cliente,endereco FROM CLIENTE
/*3 VENDEDOR TOTAL*/
SELECT * FROM VENDEDOR
/*4 VENDEDOR - CODVENDEDOR -> NUMERO - NOME_VENDEDOR -> NOME - SALARIO_FIXO -> RENDIMENTOS - FAIXA COMICAO -> COMICAO */
SELECT id_vendedor AS Numero,nome_vendedor AS Nome,salario_fixo AS  Rendimentos,faixa_comissao AS  Comicao FROM VENDEDOR
/*5 NOME DO VENDEDOR  E SALARIO_FIXO *2 */
SELECT nome_vendedor,salario_fixo*2 FROM VENDEDOR

/*6*/
SELECT id_pedido,id_produto,quantidade FROM ITEM_PEDIDO WHERE quantidade = 35

/*7*/
SELECT nome_cliente,cidade FROM CLIENTE WHERE cidade = 'Niteroi'

UPDATE CLIENTE
SET cidade='Niteroi'
WHERE id_cliente = 720;

/*8*/
SELECT desc_produto FROM PRODUTO WHERE unidade_produto = 'M' AND val_uni_produto = 1.05

/*9*/
SELECT nome_cliente,endereco FROM CLIENTE WHERE cidade = 'São Paulo' OR  (CEP >= 30077000 AND CEP <= 30079000)

/*10*/
SELECT id_pedido FROM PEDIDO WHERE prazo_entrega != 15

/*11*/
SELECT id_produto,desc_produto FROM PRODUTO WHERE val_uni_produto BETWEEN 0.32 AND 2.00

/*12*/
SELECT * FROM PRODUTO WHERE desc_produto LIKE 'Q%'
/*13*/
SELECT * FROM VENDEDOR WHERE nome_vendedor NOT LIKE 'Jo%'
/*14*/
SELECT * FROM VENDEDOR WHERE faixa_comissao ='A' OR faixa_comissao = 'B' ORDER BY nome_vendedor
/*15*/
SELECT * FROM CLIENTE WHERE IE IS NULL
/*16*/
SELECT nome_vendedor,salario_fixo FROM VENDEDOR ORDER BY nome_vendedor
/*17*/
SELECT nome_cliente,cidade,UF FROM CLIENTE ORDER BY UF DESC,cidade DESC

/*18*/
SELECT desc_produto,val_uni_produto FROM PRODUTO WHERE unidade_produto = 'M' ORDER BY  val_uni_produto
/*19*/

SELECT nome_vendedor,(salario_fixo *1.75 + 120)AS Novo_Salario FROM VENDEDOR WHERE faixa_comissao = 'C' ORDER BY  nome_vendedor

/*20*/

SELECT MIN(salario_fixo)AS 'Minimo',MAX(salario_fixo) AS 'Maximo' FROM VENDEDOR

/*21*/

SELECT SUM(quantidade) AS 'Quantidade de Vinho' FROM ITEM_PEDIDO WHERE id_produto = (SELECT id_produto FROM PRODUTO WHERE desc_produto  ='Vinho')
/*22*/
SELECT AVG(salario_fixo) AS 'Media de Salarios' FROM VENDEDOR
/*23*/
SELECT COUNT(salario_fixo) AS 'Salario > 2500' FROM VENDEDOR WHERE salario_fixo > 2500
/*24*/
SELECT DISTINCT unidade_produto FROM PRODUTO 
/*25*/
SELECT id_pedido,COUNT(id_produto) FROM ITEM_PEDIDO GROUP BY id_pedido
/*26*/
SELECT id_pedido,COUNT(id_produto) FROM ITEM_PEDIDO  GROUP BY id_pedido HAVING COUNT(id_produto) > 3
/*27*/
SELECT CLIENTE.id_cliente,CLIENTE.nome_cliente,PEDIDO.id_pedido 
FROM PEDIDO
INNER JOIN CLIENTE ON PEDIDO.id_cliente = CLIENTE.id_cliente;
/*28*/
SELECT CLIENTE.id_cliente,CLIENTE.nome_cliente,PEDIDO.id_pedido 
FROM PEDIDO,CLIENTE;
/*29*/

SELECT CLIENTE.nome_cliente,PEDIDO.id_cliente,PEDIDO.id_pedido
FROM CLIENTE 
LEFT JOIN PEDIDO
ON CLIENTE.id_cliente = PEDIDO.id_cliente;

/*30*/

SELECT DISTINCT CLIENTE.nome_cliente, CLIENTE.UF, PEDIDO.prazo_entrega
FROM PEDIDO
INNER JOIN CLIENTE ON PEDIDO.id_cliente = CLIENTE.id_cliente
WHERE (CLIENTE.UF = 'SP' OR CLIENTE.UF='RJ') AND PEDIDO.prazo_entrega > 15;

/*31*/
SELECT DISTINCT CLIENTE.nome_cliente, PEDIDO.prazo_entrega
FROM PEDIDO
INNER JOIN CLIENTE ON PEDIDO.id_cliente = CLIENTE.id_cliente
ORDER BY PEDIDO.prazo_entrega DESC;
/*32*/

SELECT DISTINCT VENDEDOR.nome_vendedor,VENDEDOR.salario_fixo,PEDIDO.prazo_entrega
FROM PEDIDO
INNER JOIN VENDEDOR ON PEDIDO.id_vendedor = VENDEDOR.id_vendedor
WHERE PEDIDO.prazo_entrega > 15 AND VENDEDOR.salario_fixo > 1000
ORDER BY VENDEDOR.nome_vendedor;

/*33 ERRO*/
SELECT DISTINCT CLIENTE.nome_cliente
FROM PEDIDO
INNER JOIN CLIENTE ON PEDIDO.id_cliente = CLIENTE.id_cliente
INNER JOIN PRODUTO ON ITEM_PEDIDO.id_produto = PRODUTO.id_produto
WHERE CLIENTE.prazo_entrega > 15 AND CLIENTE.UF = 'RJ' AND PRODUTO.desc_produto = 'Queijo'
ORDER BY VENDEDOR.nome_vendedor;