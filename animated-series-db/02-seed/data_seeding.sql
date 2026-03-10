-- Criadores
INSERT INTO Criadores (nome_completo, data_nascimento, nacionalidade) VALUES
('Rebecca Sugar', '1987-07-09', 'Americana'),        
('Pendleton Ward', '1982-07-08', 'Americano'),       
('Alex Hirsch', '1985-06-18', 'Americano'),         
('Dana Terrace', '1990-12-08', 'Americana');        

-- Séries
INSERT INTO Series (titulo, data_estreia, total_temporadas, em_andamento, sinopse) VALUES
('Steven Universo', '2013-11-04', 5, FALSE, 'Um jovem garoto herda uma pedra preciosa mágica de sua mãe...'), 
('Hora de Aventura', '2010-04-05', 10, FALSE, 'As aventuras de um garoto humano e seu cão mágico na Terra de Ooo.'), 
('Gravity Falls', '2012-06-15', 2, FALSE, 'Os gêmeos Dipper e Mabel passam o verão com seu tio-avô Stan em uma cidade cheia de mistérios.'), 
('A Casa Coruja', '2020-01-10', 3, FALSE, 'Uma adolescente humana chamada Luz tropeça em um portal para um reino mágico...'), 
('Bravest Warriors', '2012-11-08', 4, FALSE, 'Quatro heróis adolescentes viajam pelo universo salvando alienígenas fofos.'); 

-- Relações N-N Serie-Criador
INSERT INTO Serie_Criadores (serie_associada_id, criador_associado_id) VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 2); 

-- Personagens 
INSERT INTO Personagens (nome_personagem, descricao_poder, primeira_aparicao_ep, serie_pertence_id) VALUES
('Steven Cuarzo Universo', 'Poderes de Gem (escudo, cura)', 1, 1), 
('Garnet', 'Visão do futuro, super-força', 1, 1),            
('Finn, o Humano', 'Habilidade com espada', 1, 2),            
('Jake, o Cão', 'Poderes de esticar', 1, 2),                  
('Dipper Pines', 'Investigação, Diário 3', 1, 3),             
('Mabel Pines', 'Otimismo, gancho de escalada', 1, 3),       
('Luz Noceda', 'Magia com glifos', 1, 4);                     

-- Episódios
INSERT INTO Episodios (titulo_ep, num_temporada, num_episodio_total, data_exibicao, duracao_min, serie_ref_id) VALUES
('O Brilho da Pedra', 1, 1, '2013-11-04', 11, 1), 
('O Canhão de Laser', 1, 2, '2013-11-04', 11, 1), 
('Pânico na Festa do Pijama', 1, 1, '2010-04-05', 11, 2), 
('Armadilha para Turistas', 1, 1, '2012-06-15', 22, 3), 
('Uma Bruxa Mentirosa e um Guarda', 1, 1, '2020-01-10', 22, 4); 
