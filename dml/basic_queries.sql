USE FlorestaDivertida;

-- SELECT + WHERE
SELECT * FROM Visitantes WHERE idade > 18 AND cidade = 'Verdejante';

-- UPDATE
UPDATE Trilhas SET dificuldade = 'Difícil' WHERE nome = 'Trilha Encantada';

-- DELETE
DELETE FROM Animais WHERE ativo = FALSE;

-- JOIN 
SELECT e.nome AS evento, e.data_evento, t.nome AS trilha, t.dificuldade
FROM Eventos e
JOIN Trilhas t ON e.trilh_id = t.id;

-- GROUP BY 
SELECT t.nome AS trilha, AVG(a.nota) AS media_notas 
FROM Avaliacoes a
JOIN Trilhas t ON a.trilha_id = t.id
GROUP BY t.nome;

-- Funções de Data 
SELECT * FROM Eventos 
WHERE data_evento BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);

-- Consulta Integrada 
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
