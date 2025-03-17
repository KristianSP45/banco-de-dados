create database academia;
use academia;

create table if not exists clientes(
id_cliente int auto_increment,
nome_cliente varchar(45)not null,
sexo_cliente char(1) not null,
cpf_cliente varchar(14) not null,
email_clientes varchar(45) not null,
telefone varchar(20) not null,
data_inscricao date not null,
primary key(id_cliente)
);

create table if not exists funcionarios(
id_funcionarios int auto_increment,
nome_funcionarios varchar(45) not null,
cpf_funcionarios varchar(14) not null,
email_funcionarios varchar(45) not null,
telefone_funcionarios varchar(20) not null,
salario_funcionarios double not null,
data_contratacao date null,
cargo varchar(45) not null,
primary key(id_funcionarios)
);

create table if not exists tipo_plano(
id_tipo_plano int auto_increment,
valor_plano double not null,
nome_plano varchar(45) not null,
descricao varchar(100) not null,
primary key (id_tipo_plano)
);

create table if not exists salario(
id_salario int auto_increment,
cargo_salario varchar(45) not null,
valor_salario double not null,
primary key (id_salario)
);

create table if not exists pagamento(
id_pagamento int auto_increment,
tipo_pagamento varchar(30) not null,
id_cliente int,
id_tipo_plano int,
id_funcionarios int,
id_salario int,
data_pagamento date not null,
foreign key (id_tipo_plano) references tipo_plano(id_tipo_plano),
foreign key (id_funcionarios) references funcionarios(id_funcionarios),
primary key (id_pagamento)
);

create table if not exists frequencia_clientes(
id_frequencia int auto_increment,
id_cliente int,
data_frequencia date not null,
hora_entrada time not null,
hora_saida time not null,
foreign key (id_cliente) references clientes(id_cliente),
primary key (id_frequencia)
);

insert into clientes(id_cliente, nome_cliente ,sexo_cliente, cpf_cliente, email_clientes, telefone, data_inscricao)
			  values(null,"Carlos Da Silva","M","133.623.905-78","carlos@gmail.com","(61) 95236-1883","2024-01-23"),
					(null,"Davi Sousa","M","339.381.700-00","davi00@gmail.com","(61) 98964-5473","2024-03-02"),
                    (null,"Daniel Machado","M","813.938.430-50","machadodoido@gmail.com","(61) 99642-1436","2024-07-13"),
                    (null,"Maria Fernanda Oliveira","F","984.328.390-27","mariazinha@gmail.com","(61) 93594-4626","2024-05-13"),
                    (null,"Bruna Rodrigues","F","645.964.140-41","brunabarbie@gmail.com","(61) 92588-3786","2024-01-23");
                    
insert into funcionarios(id_funcionarios, nome_funcionarios, cpf_funcionarios, email_funcionarios, telefone_funcionarios, salario_funcionarios, data_contratacao, cargo)
				   value(null,"Vicente Matheus Costa","372.681.906-11","vicente_costa@gmail.com","(61) 99394-6894",5000.00,null,"Dono"),
						(null,"Luiza Isabel Letícia Almada","089.146.627-48","luiza_isabel_almada@gmail.com","(61) 98404-0229",1569.71,"2024-01-06","Personal Trainer"),
						(null,"Noah Fernando Lucas Duarte","902.843.819-00","noah_duarte@gmail.com","(61) 98599-7241",1569.71,"2024-01-06","Personal Trainer"),
                        (null,"Nicole Aparecida da Conceição","955.328.297-05","nicole-daconceicao74@gmail.com","(68) 99755-6524",1230.45,"2024-02-29","Recepcionista"),
                        (null,"Miguel Edson Pietro Aragão","146.022.216-45","miguel_aragao@gmail.com","(61) 99546-2110",1230.45,"2024-01-04","Recepcionista");
                        
insert into tipo_plano (id_tipo_plano, valor_plano, nome_plano, descricao)
				 values(null,75.00,"Plano Fit 3x","Treine 3 vezes por semana e mantenha sua forma com flexibilidade e eficiência."),
					   (null,85.00,"Plano Power 5x","Aumente a intensidade com 5 treinos semanais e veja resultados mais rápidos."),
                       (null,100.00,"Plano Full Energy","Treine todos os dias e alcance o máximo desempenho com acesso ilimitado à academia.");
                       
insert into salario (id_salario, cargo_salario, valor_salario)
               values(null, "Personal Trainer", 1569.71),
                     (null, "Recepcionista", 1230.45),
                     (null, "Dono", 5000.00);
                     
insert into pagamento (id_pagamento, tipo_pagamento, id_cliente, id_tipo_plano, id_funcionarios, id_salario, data_pagamento)
			    values(null, 'Cartão', 1, 1, null, null, '2024-01-25'),  -- Carlos Da Silva pagando o Plano Fit 3x
					  (null, 'Boleto', 2, 2, null, null, '2024-03-05'),  -- Davi Sousa pagando o Plano Power 5x
					  (null, 'Cartão', 3, 3, null, null, '2024-07-15'),  -- Daniel Machado pagando o Plano Full Energy
					  (null, 'Pix', 4, 1, null, null, '2024-05-15'),     -- Maria Fernanda pagando o Plano Fit 3x
					  (null, 'Dinheiro', 5, 2, null, null, '2024-01-25');-- Bruna Rodrigues pagando o Plano Power 5x

insert into pagamento (id_pagamento, tipo_pagamento, id_cliente, id_tipo_plano, id_funcionarios, id_salario, data_pagamento)
				values(null, 'Transferência', null, null, 1, 1, '2024-01-31'),  -- Pagamento para Luiza Isabel Letícia Almada (Treinadora)
					  (null, 'Transferência', null, null, 2, 2, '2024-01-31'),  -- Pagamento para Noah Fernando Lucas Duarte (Treinador)
					  (null, 'Transferência', null, null, 3, 3, '2024-01-31'),  -- Pagamento para Nicole Aparecida da Conceição (Recepcionista)
					  (null, 'Transferência', null, null, 5, 3, '2024-01-31');  -- Pagamento para Miguel Edson Pietro Aragão (Recepcionista)

insert into frequencia_clientes (id_frequencia, id_cliente, data_frequencia, hora_entrada, hora_saida)
						  values(null, 1, '2024-01-25', '08:00:00', '09:00:00'),
								(null, 2, '2024-03-07', '09:00:00', '10:00:00'),
								(null, 3, '2024-07-16', '07:30:00', '08:30:00'),
								(null, 4, '2024-05-17', '06:00:00', '07:00:00'),
								(null, 5, '2024-01-26', '18:00:00', '19:00:00');
                                
DELIMITER $$
CREATE TRIGGER verificar_cfp
before insert on clientes
	for each row
		begin
			declare cpf_existente int default 0;
            SELECT count(cpf_cliente) INTO cpf_existente FROM clientes WHERE cpf_cliente = new.cpf_cliente;
            if cpf_existente > 0 then
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CPF já cadastrado para outro cliente.';
			end if;
        end$$
DELIMITER ;

insert into clientes(id_cliente, nome_cliente , cpf_cliente, email_clientes, telefone, data_inscricao)
			  values(null," Vinicius Novaes","133.623.905-78","vini@gmail.com","(61) 94682-3773","2024-03-29");
              
DELIMITER $$
create function total_salario_funcionarios()
returns decimal(10,2)
begin
	declare soma decimal(10,2);
	select sum(salario_funcionarios) into soma from funcionarios where id_funcionarios > 1;
    return soma;
end$$
DELIMITER ;

SELECT total_salario_funcionarios();

DELIMITER $$
create procedure selecionar_sexo (in tipo_sexo char(1))
begin
	if(tipo_sexo is null) then
		select * from clientes;
    else
		select sexo_cliente, nome_cliente, cpf_cliente from clientes where sexo_cliente=tipo_sexo;
	end if;
end $$
DELIMITER ;

call selecionar_sexo("M");