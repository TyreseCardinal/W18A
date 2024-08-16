-- Queries --
SELECT * FROM blogger
WHERE created_at > '2020-01-01';

UPDATE blogger
SET password = 'bad_password'
WHERE password = 'pass';

SELECT bp.content, bp.title, b.username
FROM blog_post bp
JOIN blogger b ON bp.blogger_id = b.id;

SELECT bpc.content, bp.title, b.username
FROM blog_post_comment bpc
JOIN blog_post bp ON bpc.blog_post_id = bp.id
JOIN blogger b ON bpc.blogger_id = b.id;



-- Database Structure --
-- blogger table --
CREATE TABLE blogger (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(255) UNIQUE NOT NULL
);
-- blog post table -- 
CREATE TABLE blog_post (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    title VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    blogger_id INT,
    FOREIGN KEY (blogger_id) REFERENCES blogger(id) ON DELETE CASCADE
);
-- blog post comments table --
CREATE TABLE blog_post_comment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    blogger_id INT,
    blog_post_id INT,
    FOREIGN KEY (blogger_id) REFERENCES blogger(id) ON DELETE CASCADE,
    FOREIGN KEY (blog_post_id) REFERENCES blog_post(id) ON DELETE CASCADE
);

-- Data Insertion --
-- Insert Data into 'blogger' table --
INSERT INTO blogger (username, password, name, email, created_at)
VALUES 
('alice123', 'password1', 'Alice Johnson', 'alice@example.com', '2023-07-01'),
('bobsmith', 'password2', 'Bob Smith', 'bob@example.com', '2021-10-15'),
('carol89', 'password3', 'Carol White', 'carol@example.com', '2020-03-22'),
('david_w', 'pass', 'David Wilson', 'david@example.com', '2022-08-05'),
('evelee', 'pass', 'Eve Lee', 'eve@example.com', '2019-12-25');

-- Insert Data into 'blog_post' table --
INSERT INTO blog_post (content, title, created_at, blogger_id)
VALUES 
('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'A Journey Through Time', '2023-07-01', 1),
('Vestibulum viverra massa eget lacus tempus, a condimentum dui aliquam.', 'Tech Innovations in 2023', '2022-08-05', 4),
('Curabitur non lectus et urna sollicitudin facilisis.', 'Healthy Living: Tips and Tricks', '2021-10-15', 2),
('Mauris malesuada, nisl in auctor pretium, velit ligula dictum nunc, vel tempor sapien ligula eu risus.', 'The Future of AI', '2020-03-22', 3),
('Phasellus vehicula leo ut metus congue, et volutpat magna luctus.', 'Exploring the World of Quantum Computing', '2023-07-01', 1);

-- Insert Data into 'blog_post_comment' table --
INSERT INTO blog_post_comment (content, created_at, blogger_id, blog_post_id)
VALUES 
('Great insights! Thanks for sharing.', '2023-07-02', 2, 1),
('I totally agree with your points.', '2023-07-02', 3, 1),
('Interesting perspective, but I have some doubts.', '2022-08-06', 1, 2),
('Thanks for the tips! Very useful.', '2021-10-16', 4, 3),
('This is a game-changer for the industry.', '2020-03-23', 2, 4),
('Looking forward to more posts like this!', '2023-07-02', 3, 5),
('Can you explain more about this topic?', '2023-07-03', 5, 5);
