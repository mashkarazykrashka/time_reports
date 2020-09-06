-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 06 2020 г., 12:19
-- Версия сервера: 10.3.13-MariaDB
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `employees_time`
--

-- --------------------------------------------------------

--
-- Структура таблицы `time_reports`
--

CREATE TABLE `time_reports` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `hours` float NOT NULL,
  `date` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `time_reports`
--

INSERT INTO `time_reports` (`id`, `employee_id`, `hours`, `date`) VALUES
(1, 4, 3.87, '09/09/2020'),
(2, 1, 4.59, '09/09/2020'),
(3, 2, 6.57, '09/09/2020'),
(4, 3, 8.97, '09/09/2020'),
(5, 4, 5.76, '09/10/2020'),
(6, 1, 6.78, '09/10/2020'),
(7, 2, 3.75, '09/10/2020'),
(8, 3, 6.78, '09/10/2020'),
(9, 4, 3.74, '09/16/2020'),
(10, 3, 5.78, '09/16/2020'),
(11, 1, 8.67, '09/17/2020'),
(12, 2, 6.78, '09/17/2020');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `time_reports`
--
ALTER TABLE `time_reports`
  ADD PRIMARY KEY (`id`,`employee_id`),
  ADD KEY `fk_time_reports_employees_idx` (`employee_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `time_reports`
--
ALTER TABLE `time_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `time_reports`
--
ALTER TABLE `time_reports`
  ADD CONSTRAINT `fk_time_reports_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
