-- View: "O Curriculo dos Criadores" (Agregacao N:N)
-- 
-- O Desafio: Crie uma view chamada vw_curriculo_criadores. 
-- O objetivo e saber o quanto cada criador ja produziu. 
-- Voce precisa listar:
-- 
-- 1. O nome do criador.
-- 2. A quantidade de series que ele criou.
-- 3. A soma total de temporadas de todas as series dele.
-- 4. A media de temporadas por serie (arredondada para 1 casa decimal).

create view vw_curriculo_criadores as 
select c.nome_completo, COUNT(sc.serie_associada_id) as num_series_criadas,
SUM(s.total_temporadas) as total_temporadas_carreira, 
ROUND(AVG(s.total_temporadas), 1) AS media_temp_por_serie
from Criadores c
inner join serie_criadores sc on c.id_criador = sc.criador_associado_id
inner join series s on s.id_serie = sc.serie_associada_id
group by c.id_criador, c.nome_completo;

select * from vw_curriculo_criadores;
