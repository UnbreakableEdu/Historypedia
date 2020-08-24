-- MySQL Workbench Synchronization
-- Generated: 2020-08-24 15:33
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: eduar

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `history_tcc`.`exercises_answer` (
  `idexercises_answer` INT(11) NOT NULL AUTO_INCREMENT,
  `correct` VARCHAR(600) NOT NULL,
  `incorrect` VARCHAR(600) NOT NULL,
  `exercises_question_idexercises_question` INT(11) NOT NULL,
  PRIMARY KEY (`idexercises_answer`),
  INDEX `fk_exercises_answer_exercises_question1_idx` (`exercises_question_idexercises_question` ASC),
  CONSTRAINT `fk_exercises_answer_exercises_question1`
    FOREIGN KEY (`exercises_question_idexercises_question`)
    REFERENCES `history_tcc`.`exercises_question` (`idexercises_question`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `history_tcc`.`comment` (
  `User_idUser` INT(11) NOT NULL,
  `Post_idPost` INT(11) NOT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  `datetime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX `fk_User_has_Post_Post1_idx` (`Post_idPost` ASC),
  INDEX `fk_User_has_Post_User_idx` (`User_idUser` ASC),
  CONSTRAINT `fk_User_has_Post_Post1`
    FOREIGN KEY (`Post_idPost`)
    REFERENCES `history_tcc`.`post` (`idpost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Post_User`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `history_tcc`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `history_tcc`.`exercises_question` (
  `idexercises_question` INT(11) NOT NULL,
  `question` LONGTEXT NOT NULL,
  `question_group_idquestion_group` INT(11) NOT NULL,
  PRIMARY KEY (`idexercises_question`),
  INDEX `fk_exercises_question_question_group1_idx` (`question_group_idquestion_group` ASC),
  CONSTRAINT `fk_exercises_question_question_group1`
    FOREIGN KEY (`question_group_idquestion_group`)
    REFERENCES `history_tcc`.`question_group` (`idquestion_group`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `history_tcc`.`post` (
  `idpost` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `text` LONGTEXT NOT NULL,
  `image` VARCHAR(150) NULL DEFAULT NULL,
  `datetime` TIMESTAMP NOT NULL,
  `type_idtype` INT(11) NOT NULL,
  `user_iduser` INT(11) NOT NULL,
  PRIMARY KEY (`idpost`),
  INDEX `fk_post_type1_idx` (`type_idtype` ASC),
  INDEX `fk_post_user1_idx` (`user_iduser` ASC),
  CONSTRAINT `fk_post_type1`
    FOREIGN KEY (`type_idtype`)
    REFERENCES `history_tcc`.`type` (`idtype`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `history_tcc`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `history_tcc`.`question_group` (
  `idquestion_group` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(150) NOT NULL,
  `desc_question_group` VARCHAR(600) NULL DEFAULT NULL,
  `user_iduser` INT(11) NOT NULL,
  PRIMARY KEY (`idquestion_group`),
  INDEX `fk_question_group_user1_idx` (`user_iduser` ASC),
  CONSTRAINT `fk_question_group_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `history_tcc`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `history_tcc`.`topic` (
  `idtopic` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `desc_topic` VARCHAR(600) NULL DEFAULT NULL,
  PRIMARY KEY (`idtopic`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `history_tcc`.`user` (
  `iduser` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `avatar` LONGBLOB NULL DEFAULT NULL,
  `user_type_iduser_type` INT(11) NOT NULL,
  PRIMARY KEY (`iduser`),
  INDEX `fk_user_user_type1_idx` (`user_type_iduser_type` ASC),
  CONSTRAINT `fk_user_user_type1`
    FOREIGN KEY (`user_type_iduser_type`)
    REFERENCES `history_tcc`.`user_type` (`iduser_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `history_tcc`.`type` (
  `idtype` INT(11) NOT NULL AUTO_INCREMENT,
  `post_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtype`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `history_tcc`.`user_type` (
  `iduser_type` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iduser_type`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `history_tcc`.`user_answer` (
  `user_iduser` INT(11) NOT NULL,
  `exercises_answer_idexercises_answer` INT(11) NOT NULL,
  `exercises_question_idexercises_question` INT(11) NOT NULL,
  `datetime` TIMESTAMP NULL DEFAULT NULL,
  INDEX `fk_user_has_exercises_answer_exercises_answer1_idx` (`exercises_answer_idexercises_answer` ASC),
  INDEX `fk_user_has_exercises_answer_user1_idx` (`user_iduser` ASC),
  INDEX `fk_user_answer_exercises_question1_idx` (`exercises_question_idexercises_question` ASC),
  CONSTRAINT `fk_user_has_exercises_answer_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `history_tcc`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_exercises_answer_exercises_answer1`
    FOREIGN KEY (`exercises_answer_idexercises_answer`)
    REFERENCES `history_tcc`.`exercises_answer` (`idexercises_answer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_answer_exercises_question1`
    FOREIGN KEY (`exercises_question_idexercises_question`)
    REFERENCES `history_tcc`.`exercises_question` (`idexercises_question`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `history_tcc`.`post_has_topic` (
  `post_idpost` INT(11) NOT NULL,
  `topic_idtopic` INT(11) NOT NULL,
  INDEX `fk_post_has_topic_topic1_idx` (`topic_idtopic` ASC),
  INDEX `fk_post_has_topic_post1_idx` (`post_idpost` ASC),
  CONSTRAINT `fk_post_has_topic_post1`
    FOREIGN KEY (`post_idpost`)
    REFERENCES `history_tcc`.`post` (`idpost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_has_topic_topic1`
    FOREIGN KEY (`topic_idtopic`)
    REFERENCES `history_tcc`.`topic` (`idtopic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `history_tcc`.`question_group_has_topic` (
  `question_group_idquestion_group` INT(11) NOT NULL,
  `topic_idtopic` INT(11) NOT NULL,
  INDEX `fk_question_group_has_topic_topic1_idx` (`topic_idtopic` ASC),
  INDEX `fk_question_group_has_topic_question_group1_idx` (`question_group_idquestion_group` ASC),
  CONSTRAINT `fk_question_group_has_topic_question_group1`
    FOREIGN KEY (`question_group_idquestion_group`)
    REFERENCES `history_tcc`.`question_group` (`idquestion_group`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_group_has_topic_topic1`
    FOREIGN KEY (`topic_idtopic`)
    REFERENCES `history_tcc`.`topic` (`idtopic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `history_tcc`.`media` (
  `idmedia` INT(11) NOT NULL,
  `post_idpost` INT(11) NOT NULL,
  `exercises_question_idexercises_question` INT(11) NOT NULL,
  `url` VARCHAR(600) NOT NULL,
  `category_media_idcategory_media` INT(11) NOT NULL,
  PRIMARY KEY (`idmedia`),
  INDEX `fk_media_post1_idx` (`post_idpost` ASC),
  INDEX `fk_media_exercises_question1_idx` (`exercises_question_idexercises_question` ASC),
  INDEX `fk_media_category_media1_idx` (`category_media_idcategory_media` ASC),
  CONSTRAINT `fk_media_post1`
    FOREIGN KEY (`post_idpost`)
    REFERENCES `history_tcc`.`post` (`idpost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_media_exercises_question1`
    FOREIGN KEY (`exercises_question_idexercises_question`)
    REFERENCES `history_tcc`.`exercises_question` (`idexercises_question`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_media_category_media1`
    FOREIGN KEY (`category_media_idcategory_media`)
    REFERENCES `history_tcc`.`category_media` (`idcategory_media`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `history_tcc`.`category_media` (
  `idcategory_media` INT(11) NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategory_media`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
