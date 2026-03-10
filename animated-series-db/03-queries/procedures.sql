-- Objetivo: Criar uma Stored Procedure simples que não recebe nenhum parâmetro e retorna todas as colunas e registros da tabela Criadores.

DELIMITER $$

CREATE PROCEDURE sp_ListarCriadores()

BEGIN

SELECT * FROM Criadores;

END $$

DELIMITER ;

-- Objetivo: Criar uma procedure que aceite o ID de uma série como entrada e retorne todos os episódios pertencentes apenas a essa série.

DELIMITER $$

CREATE PROCEDURE sp_BuscarEpisodiosPorSerie(IN p_serieID INT)

BEGIN

    Select
        s.id_serie,
        s.titulo as serie_pertencente,
        e.id_episodio as id, 
        e.titulo_ep as titulo, 
        e.num_temporada as temporada
    from 
        Episodios e 
    JOIN 
        Series s ON e.serie_ref_id = s.id_serie 
    WHERE 
        e.serie_ref_id = p_serieID; 
        
END $$

DELIMITER ;

-- Objetivo: Criar uma procedure que facilite a adição de um novo personagem ao banco de dados.

DELIMITER $$ 

CREATE PROCEDURE sp_AdicionarPersonagem(
    IN novo_personagem VARCHAR(100), 
    IN descricao_poder VARCHAR(255), 
    IN id_serie_pertencente INT
)

BEGIN
    insert into Personagens (nome_personagem, descricao_poder, serie_pertence_id) 
    values 
    (novo_personagem, descricao_poder, id_serie_pertencente);
END $$

DELIMITER ;

-- Objetivo: Criar uma procedure que atualize o status de uma série (de em_andamento = TRUE para em_andamento = FALSE) e, ao mesmo tempo, retorne o título da série que foi atualizada.

DELIMITER $$ 

CREATE PROCEDURE sp_ConcluirSerie(
    IN p_id_serie INT, 
    OUT p_titulo_serie VARCHAR(100)
)

BEGIN

    update series set em_andamento = FALSE where id_serie = p_id_serie;
    set p_titulo_serie = (select titulo from Series where id_serie = p_id_serie) ;

END $$

DELIMITER ;

-- Objetivo: Criar uma procedure que receba o ID de um criador e retorne o número total de temporadas que ele criou (somando as temporadas de todas as séries associadas a ele).

DELIMITER $$ 

CREATE PROCEDURE sp_ContarTotalTemporadasPorCriador(
    IN p_id_criador INT
)

BEGIN

    select SUM(total_temporadas) from series
    join serie_criadores on serie_associada_id = id_serie
    where criador_associado_id = p_id_criador;
    
END $$

DELIMITER ;


-- DESAFIO: REMOCAO CONDICIONAL DE VINCULO CRIADOR-SERIE
-- 
-- Crie uma Stored Procedure chamada DesvincularCriador que remova o vinculo 
-- de um criador com uma serie especifica, mas SOMENTE SE o criador estiver 
-- vinculado a PELO MENOS DUAS series.
-- 
-- REQUISITOS:
-- 
-- 1. Parametros de Entrada (IN):
--    - p_nome_criador (VARCHAR(100)): O nome completo do criador.
--    - p_titulo_serie (VARCHAR(100)): O titulo da serie a ser desvinculada.
-- 
-- 2. Parametros de Saida (OUT):
--    - p_status_operacao (VARCHAR(50)): Uma mensagem de status indicando o que aconteceu.
-- 
-- ESTRUTURA CONDICIONAL E LOGICA DE NEGOCIO:
-- 
-- 1. Pre-Busca de IDs:
--    - Primeiro, use o p_nome_criador para buscar o id_criador e o p_titulo_serie 
--      para buscar o id_serie.
-- 
-- 2. Validacao de Vinculo e Contagem:
--    - SE o id_criador ou o id_serie nao forem encontrados, defina p_status_operacao como 
--      'ERRO: Criador ou Serie nao encontrados.' e saia.
--    - Conte quantos vinculos existem para o id_criador na tabela Serie_Criadores.
-- 
-- 3. Logica de Remocao:
--    - SE o criador tiver mais de 1 vinculo (ou seja, 2 ou mais), entao remova a linha 
--      especifica da tabela Serie_Criadores que conecta id_criador com id_serie.
--        - Defina p_status_operacao como 'SUCESSO: Vinculo removido.'.
--    - SENAO (se o criador so tiver 1 vinculo), entao nao faca a remocao e defina 
--      p_status_operacao como 'NEGADO: Criador tem apenas um vinculo de serie.'


DELIMITER $$

CREATE PROCEDURE sp_DesvincularCriador( IN p_nome_criador varchar(100), IN p_titulo_serie varchar(100), OUT p_status_operacao varchar(100))

BEGIN

declare criador int;
declare serie int;
declare total_vinculos int;

set criador = (select id_criador from Criadores where nome_completo = p_nome_criador);
set serie = (select id_serie from Series where titulo = p_titulo_serie);



if criador is not null and serie is not null then

	set total_vinculos = (
    select COUNT(*) 
    from Serie_Criadores 
    where criador_associado_id = criador
	);

	if  total_vinculos > 1 then 
		
        if exists (SELECT 1 from Serie_Criadores where criador_associado_id = criador and serie_associada_id = serie) then
        
        delete from serie_criadores 
		where criador_associado_id = criador 
		and serie_associada_id = serie;
        
		set p_status_operacao = "SUCESSO: Vinculo removido.";
        else 
			SET p_status_operacao = 'NEGADO: Registro de vínculo não existe.';
        end if;
    else
		set p_status_operacao = "NEGADO: Criador deve ter no mínimo 2 vínculos de série";
    end if;
else
	set p_status_operacao = "ERRO: Criador ou Série não encontrados";
end if;

END $$

DELIMITER ;


-- Chamar a procedure
CALL sp_DesvincularCriador("Pendleton Ward","Hora de Aventura", @res);
select @res;

