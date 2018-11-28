create database project6;

use project6;

CREATE TABLE `info` (
	`id`	INT PRIMARY KEY AUTO_INCREMENT,
	`name`	varchar(50),
	`count`	int
);

insert `info`(`name`, `count`) VALUES ("材料1", 100);
insert `info`(`name`, `count`) VALUES ("材料2", 200);
insert `info`(`name`, `count`) VALUES ("材料3", 300);
insert `info`(`name`, `count`) VALUES ("材料4", 400);
insert `info`(`name`, `count`) VALUES ("材料5", 500);


GRANT ALL PRIVILEGES ON `project6` TO 'project6'@'localhost' IDENTIFIED BY 'project6';
GRANT ALL PRIVILEGES ON `project6` TO 'project6'@'127.0.0.1' IDENTIFIED BY 'project6';
FLUSH PRIVILEGES;



GRANT ALL PRIVILEGES ON `project6` TO 'project6'@"%" IDENTIFIED BY 'project6';



select * from info;
