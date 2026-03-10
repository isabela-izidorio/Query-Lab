create database animacoes;
use animacoes;

-- TABELA 1: Criadores

CREATE TABLE Criadores (
    id_criador INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    data_nascimento DATE, 
    nacionalidade VARCHAR(50)
);


-- TABELA 2: Series

CREATE TABLE Series (
    id_serie INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL UNIQUE,
    data_estreia DATE,         
    total_temporadas INT,      
    em_andamento BOOLEAN DEFAULT FALSE,
    sinopse TEXT
);

-- TABELA 3: Personagens
-- Relação 1-N com Series (Uma série tem muitos personagens).

CREATE TABLE Personagens (
    id_personagem INT AUTO_INCREMENT PRIMARY KEY,
    nome_personagem VARCHAR(100) NOT NULL,
    descricao_poder VARCHAR(255),
    primeira_aparicao_ep INT,  
    
    -- Foreign Key
    serie_pertence_id INT,
    FOREIGN KEY (serie_pertence_id) REFERENCES Series(id_serie)
);

-- TABELA 4: Episodios
-- Relação 1-N com Series (Uma série tem muitos episódios).

CREATE TABLE Episodios (
    id_episodio INT AUTO_INCREMENT PRIMARY KEY,
    titulo_ep VARCHAR(150) NOT NULL,
    num_temporada INT NOT NULL,      
    num_episodio_total INT NOT NULL, 
    data_exibicao DATE,              
    duracao_min INT,                 
    
    -- Foreign Key
    serie_ref_id INT,
    FOREIGN KEY (serie_ref_id) REFERENCES Series(id_serie)
);

-- TABELA 5: Serie_Criadores (Tabela de Junção N-N)
-- Uma série pode ter vários criadores; um criador pode ter várias séries

CREATE TABLE Serie_Criadores (
    -- Foreign Key: 'serie_associada_id' referencia 'id_serie'
    serie_associada_id INT,
    
    -- Foreign Key: 'criador_associado_id' referencia 'id_criador'
    criador_associado_id INT,
    
    -- Chave Primária Composta para garantir que a relação é única
    PRIMARY KEY (serie_associada_id, criador_associado_id),
    
    -- Definição das Foreign Keys
    FOREIGN KEY (serie_associada_id) REFERENCES Series(id_serie),
    FOREIGN KEY (criador_associado_id) REFERENCES Criadores(id_criador)
);
