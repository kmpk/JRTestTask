Use test;
DROP TABLE IF EXISTS book;
CREATE TABLE `book` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `printYear` INT NOT NULL,
  `readAlready` BIT NOT NULL,
  PRIMARY KEY (`ID`)
)
ENGINE=InnoDB 
DEFAULT CHARSET=utf8;

INSERT INTO book (title, description, author, isbn, printYear,readAlready) VALUES
("Граф Монте-Кристо", "Приключенческий роман, классика французской литературы.", "Александр Дюма", "978-5-389-12741-8", 2017, false),
("Сэр Найджел. Белый отряд", "Два исторических романа, объединенных одним героем. Действие романов происходит во времена Столетней войны.", "Артур Конан Дойл", "5-289-00963-9", 1992,false),
("Дерек Джармен", "Настоящая биография представляет собой подробный анализ жизни и творчества Джармена, дает наиболее полную картину его личности. Майкл Чарлсворт обращается не только к истории искусств и кинокритике, но и к дневниковым записям Джармена.", "Майкл Чарлсворт", "978-5-91103-383-5", 2017, true),
("Book4", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, false);
("Book5", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, false);
("Book6", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, false);
("Book7", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, false);
("Book8", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book9", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book10", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book11", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, false);
("Book12", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, false);
("Book13", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book14", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book15", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, false);
("Book16", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book17", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book18", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book19", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, false);
("Book20", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, false);
("Book21", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book22", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, false);
("Book23", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book24", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book25", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book26", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, false);
("Book27", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, false);
("Book28", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book29", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book30", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, false);
("Book31", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);
("Book32", "Some letters and words that describe some thoughts.", "Authors name", "000-1-22222-333-4", 1234, true);