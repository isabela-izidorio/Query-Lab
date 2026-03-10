-- Cálculo de Duração Total por Série (Função Simples de Agregação)
-- Crie uma função chamada fn_CalcularDuracaoTotalSerie que receba o ID da Série como parâmetro (INT) e retorne o tempo total de exibição de todos os episódios dessa série em minutos (INT).

DELIMITER $$

CREATE FUNCTION fn_CalcularDuracaoTotalSerie(p_idSerie int)
RETURNS INT DETERMINISTIC

	BEGIN 

		RETURN (select sum(duracao_min) from episodios where serie_ref_id = p_idSerie);

	END $$

DELIMITER ;


SELECT fn_CalcularDuracaoTotalSerie(2);

--  Determinação de Faixa Etária de Criadores (Função com Condicional IF/ELSE)
--
-- Crie uma funcao chamada fn_DeterminarFaixaEtaria que receba o ID do Criador (INT) 
-- e retorne uma string (VARCHAR) que descreva a faixa etaria do criador.
-- 
-- Logica:
-- Se o Criador nasceu antes de 1980, retorne: 'Geracao Classica'.
-- Se o Criador nasceu entre 1980 e 1990 (inclusive), retorne: 'Geracao Millennial'.
-- Caso contrario (depois de 1990), retorne: 'Geracao Z'.

DELIMITER $$

CREATE FUNCTION fn_DeterminarFaixaEtaria(p_idCriador int)
RETURNS VARCHAR(100) DETERMINISTIC

BEGIN 
declare ano int;
declare res varchar(100);

set ano = (select year(data_nascimento) from Criadores where id_criador = p_idCriador);

	if ano < 1980 then 
		set res = "Geração Clássica";
	elseif ano between  1980 and 1990 then 
		set res = "Geração Millennial";
	elseif ano > 1990 then 
		set res = "Geração Z";
    end if;
    
    return res;

END $$

DELIMITER ;


select fn_DeterminarFaixaEtaria(4);

-- Verificar Vínculo Múltiplo de Criador (Função que Retorna um Booleano)
-- Crie uma função chamada fn_CriadorTemMultiplosVinculos que receba o ID do Criador (INT) e retorne TRUE se esse criador estiver associado a mais de uma série (contando linhas na tabela Serie_Criadores). Retorne FALSE caso contrário.

DELIMITER $$

CREATE FUNCTION fn_CriadorTemMultiplosVinculos(p_idCriador int)
RETURNS BOOLEAN DETERMINISTIC

BEGIN 

	DECLARE num_vinculos int;

	set num_vinculos = (select COUNT(criador_associado_id) from serie_criadores where criador_associado_id = p_idCriador);

	-- Retorna TRUE se a condição for verdadeira, FALSE caso contrário
    RETURN num_vinculos > 1;
	

	return res;

END $$

DELIMITER ;

	select fn_CriadorTemMultiplosVinculos(2);
    
-- Localizar Personagens com Poderes Especificos (Funcao com Parametro de Texto e LIKE)
-- 
-- Crie uma funcao chamada fn_ContarPersonagensComPoder que receba duas strings como parametro:
-- 
-- p_id_serie (INT)
-- p_palavra_chave (VARCHAR)
-- 
-- A funcao deve retornar a contagem (INT) de personagens daquela serie 
-- cujo descricao_poder contenha a p_palavra_chave.
-- 
-- Dica: Use a clausula WHERE com o operador LIKE e concatene a palavra-chave 
-- com % (ex: '%sua_palavra_aqui%') para buscar a substring.
-- 
-- Exemplo de Uso: SELECT fn_ContarPersonagensComPoder(1, 'cura'); 
-- deve retornar 1 (para Steven Universo).

DELIMITER $$

CREATE FUNCTION fn_ContarPersonagensComPoder(p_id_serie int, p_palavra_chave varchar(100))
RETURNS INT DETERMINISTIC

BEGIN 
    
  return (
	select count(descricao_poder) from personagens 
	where descricao_poder like concat('%', p_palavra_chave ,'%')
	and serie_pertence_id = p_id_serie
  );

END $$

DELIMITER ;



select fn_ContarPersonagensComPoder(2, 'a');
