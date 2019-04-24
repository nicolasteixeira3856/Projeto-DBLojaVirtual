CREATE DATABASE IF NOT EXISTS db_loja_virtual;

CREATE TABLE tb_produtos(
    id_produto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    produto VARCHAR(200) NOT NULL,
    valor FLOAT(8,2) NOT NULL
);

CREATE TABLE tb_descricoes_tecnicas(
    id_descricao_tecnica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_id_produto INT NOT NULL,
    descricao_tecnica TEXT NOT NULL,
    FOREIGN KEY(fk_id_produto) REFERENCES tb_produtos(id_produto)
);


CREATE TABLE tb_imagens (
    id_imagem INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_id_produto INT NOT NULL,
    url_imagem varchar(50),
    FOREIGN KEY(fk_id_produto) REFERENCES tb_produtos(id_produto)
);

CREATE TABLE tb_clientes (
    id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    idade int
);

CREATE TABLE tb_pedidos (
   id_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   fk_id_cliente INT NOT NULL,
   data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY(fk_id_cliente) REFERENCES tb_clientes(id_cliente)
);

CREATE TABLE tb_pedidos_produtos ( 
    fk_id_pedido INT NOT NULL,
    fk_id_produto INT NOT NULL,
    FOREIGN KEY(fk_id_produto) REFERENCES tb_produtos(id_produto),
    FOREIGN KEY(fk_id_pedido) REFERENCES tb_pedidos(id_pedido) 
);

/* ------------------- */;

INSERT INTO tb_produtos(produto, valor) VALUES ('Notebook Dell Inspiron Ultrafino Intel Core i7, 16GB RAM e 240GB SSD', 3500.00);
INSERT INTO tb_produtos(produto, valor) VALUES ('Smart TV LED 40" Samsung Full HD 2 HDMI 1 USB Wi-Fi Integrado', 1475.54);
INSERT INTO tb_produtos(produto, valor) VALUES ('Smartphone LG K10 Dual Chip Android 7.0 4G Wi-Fi Câmera de 13MP', 629.99);

/* ------------------- */;

INSERT INTO tb_descricoes_tecnicas(fk_id_produto, descricao_tecnica) VALUES (1, 'O novo Inspiron Dell oferece um design elegante e tela infinita que amplia seus sentidos, mantendo a sofisticação e medidas compactas...');
INSERT INTO tb_descricoes_tecnicas(fk_id_produto, descricao_tecnica) VALUES (2, 'A smart TV da Samsung possui tela de 40" e oferece resolução Full HD, imagens duas vezes melhores que TVs HDs padrão...');
INSERT INTO tb_descricoes_tecnicas(fk_id_produto, descricao_tecnica) VALUES (3, 'Saia da mesmice. O smartphone LG está mais divertido, rápido, fácil, cheio de selfies e com tela HD de incríveis 5,3"...');

/* ------------------- */;

INSERT INTO tb_imagens(fk_id_produto, url_imagem) VALUES (1, "Notebook_1.jpg"), (1, "Notebook_2.jpg"), (1, "Notebook_3.jpg");
INSERT INTO tb_imagens(fk_id_produto, url_imagem) VALUES (2, "Smart_tv_1.jpg"), (2, "Smart_tv_2.jpg");
INSERT INTO tb_imagens(fk_id_produto, url_imagem) VALUES (3, "Smartphone_1.jpg");

/* ------------------- */;

INSERT INTO tb_clientes (nome, idade) VALUES ('Jorge', 29);
INSERT INTO tb_pedidos (fk_id_cliente) VALUES (1);
INSERT INTO tb_pedidos (fk_id_cliente) VALUES (1);
INSERT INTO tb_pedidos_produtos (fk_id_pedido, fk_id_produto) VALUES (1, 2);
INSERT INTO tb_pedidos_produtos (fk_id_pedido, fk_id_produto) VALUES (1, 3);
INSERT INTO tb_pedidos_produtos (fk_id_pedido, fk_id_produto) VALUES (2, 1);

/* ------------------- */;

INSERT INTO tb_clientes (nome, idade) VALUES ('Nicolas', 20);
INSERT INTO tb_pedidos (fk_id_cliente) VALUES (2);
INSERT INTO tb_pedidos_produtos (fk_id_pedido, fk_id_produto) VALUES (3, 1);

/* ------------------- */;

/*SELECT * FROM tb_clientes LEFT JOIN tb_pedidos ON (tb_clientes.id_cliente = tb_pedidos.fk_id_cliente);
SELECT * FROM tb_produtos LEFT JOIN tb_imagens ON (tb_produtos.id_produto = tb_imagens.fk_id_produto);
SELECT * FROM tb_pedidos INNER JOIN tb_pedidos_produtos ON (tb_pedidos.id_pedido = tb_pedidos_produtos.fk_id_pedido) INNER JOIN tb_produtos ON (tb_pedidos_produtos.fk_id_pedido = tb_produtos.id_produto);*/;






