USE FlorestaDivertida;

INSERT INTO Trilhas (nome, dificuldade, duracao_min) VALUES 
('Trilha Encantada', 'Média', 45),
('Caminho do Sol', 'Fácil', 30),
('Pico do Gavião', 'Difícil', 120),
('Trilha dos Esquilos', 'Fácil', 20);

INSERT INTO Visitantes (nome, idade, cidade) VALUES 
('Ana Souza', 25, 'Verdejante'),      
('Carlos Lima', 19, 'Verdejante'),   
('Beatriz Silva', 17, 'Verdejante'), 
('Lucas Rocha', 30, 'Bragança'),     
('Mariana Costa', 22, 'Verdejante'); 

INSERT INTO Animais (nome, especie, idade, ativo) VALUES 
('Bento', 'Capivara', 3, TRUE),
('Soneca', 'Preguiça', 10, FALSE),    
('Fumaça', 'Puma', 4, TRUE);

INSERT INTO Eventos (nome, data_evento, trilh_id, preco_ingresso) VALUES 
('Festival da Primavera', DATE_ADD(CURDATE(), INTERVAL 5 DAY), 1, 25.00),
('Observação de Estrelas', DATE_ADD(CURDATE(), INTERVAL 15 DAY), 2, 10.00),
('Maratona Radical', DATE_ADD(CURDATE(), INTERVAL 45 DAY), 3, 50.00); 

INSERT INTO Avaliacoes (visitante_id, trilha_id, nota, comentario, data_avaliacao) VALUES 
(1, 1, 5, 'Incrível, vi muitos pássaros!', CURDATE()),
(2, 1, 2, 'Muito cansativa e mal sinalizada.', CURDATE()),
(4, 2, 4, 'Trilha leve e relaxante.', CURDATE()),
(5, 3, 5, 'Desafio fenomenal!', CURDATE());
