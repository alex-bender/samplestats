CREATE TABLE `sample` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`hash` char NOT NULL,
	`file` char NOT NULL,
	`compiled_at` DATETIME,
	`created_at` DATETIME,
	`size` bigint NOT NULL,
	`arch` char NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `section` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`sample` bigint NOT NULL AUTO_INCREMENT,
	`name` char NOT NULL,
	`hash` char NOT NULL,
	`entropy` char NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `report` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`sample` bigint NOT NULL AUTO_INCREMENT,
	`details` longtext NOT NULL,
	`summary` TEXT NOT NULL,
	`created_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `import` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`sample` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `function` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	`description` TEXT NOT NULL,
	`importtable` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `argument` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`function` bigint NOT NULL,
	`name` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `section` ADD CONSTRAINT `section_fk0` FOREIGN KEY (`sample`) REFERENCES `sample`(`id`);

ALTER TABLE `report` ADD CONSTRAINT `report_fk0` FOREIGN KEY (`sample`) REFERENCES `sample`(`id`);

ALTER TABLE `import` ADD CONSTRAINT `import_fk0` FOREIGN KEY (`sample`) REFERENCES `sample`(`id`);

ALTER TABLE `function` ADD CONSTRAINT `function_fk0` FOREIGN KEY (`importtable`) REFERENCES `import`(`id`);

ALTER TABLE `argument` ADD CONSTRAINT `argument_fk0` FOREIGN KEY (`function`) REFERENCES `function`(`id`);

