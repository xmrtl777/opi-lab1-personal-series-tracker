

CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    created_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE Networks (
    network_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE Genres (
    genre_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE Series (
    series_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    total_seasons INTEGER CHECK(total_seasons > 0),
    release_year INTEGER,
    network_id INTEGER,
    created_at TEXT DEFAULT (datetime('now')),
    FOREIGN KEY (network_id) REFERENCES Networks(network_id) ON DELETE SET NULL
);

CREATE TABLE Series_Genres (
    series_id INTEGER,
    genre_id INTEGER,
    PRIMARY KEY (series_id, genre_id),
    FOREIGN KEY (series_id) REFERENCES Series(series_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id) ON DELETE CASCADE
);

-- Таблица связи Пользователя и Сериала (хранит статус и рейтинг)
CREATE TABLE User_Series (
    user_series_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    series_id INTEGER NOT NULL,
    status TEXT DEFAULT 'Запланировано' CHECK(status IN ('Запланировано', 'Смотрю', 'Просмотрено', 'Брошено')),
    rating INTEGER CHECK(rating >= 1 AND rating <= 10), -- Рейтинг от 1 до 10
    updated_at TEXT DEFAULT (datetime('now')),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (series_id) REFERENCES Series(series_id) ON DELETE CASCADE,
    UNIQUE(user_id, series_id) -- Пользователь может добавить конкретный сериал только один раз
);

-- Индексы для оптимизации запросов
CREATE INDEX idx_series_title ON Series(title);
CREATE INDEX idx_user_series_user_id ON User_Series(user_id);
CREATE INDEX idx_user_series_status ON User_Series(status);
CREATE INDEX idx_series_network_id ON Series(network_id);
