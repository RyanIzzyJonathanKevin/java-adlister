

use adlister_db;

insert into users (username, email, password) values ('sdellenbroker0', 'kmote0@cam.ac.uk', '1Drj3sScPJDq');
insert into users (username, email, password) values ('kpotteridge1', 'cedis1@istockphoto.com', 'Ge7zBXyvWn');
insert into users (username, email, password) values ('rmcairt2', 'rkillner2@ocn.ne.jp', 'yveKmY');
insert into users (username, email, password) values ('dkaret3', 'lstoneham3@state.gov', 'mMVmle2ajir');
insert into users (username, email, password) values ('cenglish4', 'jstapels4@booking.com', 'IlmolK5w');
insert into users (username, email, password) values ('owatman5', 'spendre5@tuttocitta.it', 'EnOZJMt1n');
insert into users (username, email, password) values ('twinterborne6', 'amurcutt6@twitter.com', 'hdpk6JeGsU');
insert into users (username, email, password) values ('urassell7', 'dkenlin7@google.ca', 'pmS0m2aqi6q');
insert into users (username, email, password) values ('spaolazzi8', 'ecarragher8@about.com', 'aQky61wPLA');
insert into users (username, email, password) values ('kmacgettigen9', 'pfarndell9@networksolutions.com', 'MjgOOqbU');

insert into ads (user_id, title, description) values (1, 'beetles concert', 'ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit ');
insert into ads (user_id, title, description) values (2, 'Bond Jovi', 'ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit ');
insert into ads (user_id, title, description) values (2, 'The White Strips', 'ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit ');
insert into ads (user_id, title, description) values (1, 'Cows in Space', 'ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit ');
insert into ads (user_id, title, description) values (4, 'Dirty Boys', 'ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit ');
insert into ads (user_id, title, description) values (5, 'BBOC', 'ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit ' );
insert into ads (user_id, title, description) values (3, 'Park Rock and Rap', 'ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit ');
insert into ads (user_id, title, description) values (8, 'June Cant come Soon Enough','ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit ' );
insert into ads (user_id, title, description) values (4, 'BigglesWorth', 'ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit ');
insert into ads (user_id, title, description) values (10, 'Monologues by Smart People', 'ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit ');

INSERT INTO categories( category) VALUES ('Concert'),
                                         ('Movie'),
                                         ('Charity'),
                                         ('Sports'),
                                         ('Musical'),
                                         ('Arts');

INSERT INTO ad_category(ad_id, category_id) values(1,1),
                                                   (2,3),
                                                   (2,5),
                                                   (3,2),
                                                   (4,6),
                                                   (4,5),
                                                   (5, 1),
                                                   (6, 3),
                                                   (7, 4),
                                                   (8, 5),
                                                   (9, 6),
                                                   (10, 4);


-- SELECT title from ads
-- Join users on users.id = ads.user_id
-- where username = 'dkaret3';

SELECT category FROM categories JOIN ad_category ON category_ad.category_id = categories.id" +
                    "JOIN ads ON ads.id = ad_category.ad_id WHERE ads.id = 1;