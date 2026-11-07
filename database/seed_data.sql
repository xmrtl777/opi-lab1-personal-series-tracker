-- ТЕСТОВЫЕ ДАННЫЕ

INSERT INTO Users (username, email) VALUES 
('alex_ivanov', 'alex@example.com'),
('maria_petrova', 'maria@example.com');

INSERT INTO Networks (name) VALUES 
('Netflix'), ('HBO'), ('Amazon Prime');

INSERT INTO Genres (name) VALUES 
('Драма'), ('Комедия'), ('Фантастика'), ('Триллер');

INSERT INTO Series (title, total_seasons, release_year, network_id) VALUES 
('Очень странные дела', 4, 2016, 1),
('Игра престолов', 8, 2011, 2),
('Пацаны', 3, 2019, 3);

INSERT INTO Series_Genres (series_id, genre_id) VALUES 
(1, 3), -- Очень странные дела - Фантастика
(1, 4), -- Очень странные дела - Триллер
(2, 1), -- Игра престолов - Драма
(3, 2), -- Пацаны - Комедия
(3, 1); -- Пацаны - Драма

INSERT INTO User_Series (user_id, series_id, status, rating) VALUES 
(1, 1, 'Просмотрено', 9),
(1, 2, 'Смотрю', 8),
(2, 3, 'Запланировано', NULL);
