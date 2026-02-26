USE FlorestaDivertida;

-- SELECT + WHERE: Listar todos os visitantes com idade maior que 18 que são da cidade "Verdejante".
SELECT * FROM Visitantes WHERE idade > 18 AND cidade = 'Verdejante';

-- UPDATE: Atualizar a dificuldade da trilha chamada "Trilha Encantada" para "Difícil".
SET SQL_SAFE_UPDATES = 0;
UPDATE Trilhas SET dificuldade = 'Difícil' WHERE nome = 'Trilha Encantada';

-- DELETE: Remover da tabela Animais todos os que tenham ativo = FALSE.
DELETE FROM Animais WHERE ativo = FALSE;
SET SQL_SAFE_UPDATES = 1;

-- ALTER TABLE: Adicionar à tabela Eventos a coluna preco_ingresso DECIMAL(6,2).
alter table Eventos add preco_ingresso DECIMAL(6,2);

-- JOIN: Listar os eventos agendados, mostrando nome do evento, data, nome da trilha e sua dificuldade.
SELECT e.nome AS evento, e.data_evento, t.nome AS trilha, t.dificuldade
FROM Eventos e
JOIN Trilhas t ON e.trilh_id = t.id;

-- GROUP BY: Listar cada trilha e a média de notas recebidas nas avaliações.
SELECT t.nome AS trilha, AVG(a.nota) AS media_notas 
FROM Avaliacoes a
JOIN Trilhas t ON a.trilha_id = t.id
GROUP BY t.nome;

-- Funções de Data: Listar os eventos que acontecerão nos próximos 30 dias a partir de hoje (CURDATE()).
SELECT * FROM Eventos 
WHERE data_evento BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);

/*
Consulta integrada:

Mostre os visitantes que fizeram avaliações em trilhas, trazendo:

- Nome do visitante
- Nome da trilha
- Nota dada
- Comentário
- E, caso a nota seja menor que 3, exiba a string `"Precisa Melhorar"`; caso contrário `"Boa Experiência"`.
*/ 

SELECT 
    v.nome AS visitante, 
    t.nome AS trilha, 
    a.nota, 
    a.comentario,
    CASE
        WHEN a.nota < 3 THEN 'Precisa Melhorar'
        ELSE 'Boa Experiência'
    END AS status_avaliacao
FROM Avaliacoes a 
JOIN Trilhas t ON a.trilha_id = t.id
JOIN Visitantes v ON a.visitante_id = v.id;

-- Listar Trilhas, seus respectivos Guias e a média de notas que os visitantes deram
SELECT 
    t.nome AS trilha, 
    g.nome AS guia_responsavel, 
    g.especialidade,
    AVG(a.nota) AS media_satisfacao
FROM Trilhas t
JOIN Guias g ON t.guia_id = g.id
LEFT JOIN Avaliacoes a ON a.trilha_id = t.id
GROUP BY t.id, g.id;
