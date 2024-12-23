CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    bookname VARCHAR(20) NOT NULL,      -- 書名
    page INT ,                          -- 頁數
    author VARCHAR(20) ,                -- 作者
    publisher VARCHAR(20) ,             -- 出版社
    category_id VARCHAR(2) ,            -- 類別
    muser VARCHAR(20),                  -- 最後修改用戶
    mdate VARCHAR(8),                   -- 最後修改日期
    mtime VARCHAR(6)                    -- 最後修改時間
);

CREATE TABLE category (
 category_id  VARCHAR(2) PRIMARY KEY,
    category_name VARCHAR(20) NOT NULL
);

INSERT INTO `bookstore`.`book`(`bookname`)VALUES
('你就是不寫測試才會沒時間'),
('企業級go項目開發實戰'),
('Kubernetes聖經'),
('資料庫系統實現'),
('程式揭密'),
('工程師的自我修養'),
('提升程式設計師的面試力');

select * from book
