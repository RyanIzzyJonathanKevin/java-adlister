USE adlister_db;

DROP table IF EXISTS ad_category;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;


CREATE TABLE users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL UNIQUE,
    email    VARCHAR(240) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads
(
    id          INT UNSIGNED  NOT NULL AUTO_INCREMENT,
    user_id     INT UNSIGNED  NOT NULL,
    title       VARCHAR(240)  NOT NULL,
    description TEXT          NOT NULL,
    lat         DECIMAL(6, 3) not null,
    lon         DECIMAL(6, 3) not null,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE
);

CREATE TABLE categories
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(100) NOT NULL
);

CREATE TABLE ad_category
(
    ad_id       INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);


INSERT INTO categories(category)
VALUES ('Concert'),
       ('Movie'),
       ('Charity'),
       ('Sports'),
       ('Musical'),
       ('Arts');

