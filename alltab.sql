-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 19 2023 г., 22:28
-- Версия сервера: 8.0.29
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `марафон`
--

-- --------------------------------------------------------

--
-- Структура таблицы `результаты`
--

CREATE TABLE `результаты` (
  `ID_результа` int NOT NULL,
  `ID_спортсмена` int NOT NULL,
  `ID_соревнования` int NOT NULL,
  `место_в_зачёте` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `результаты`
--

INSERT INTO `результаты` (`ID_результа`, `ID_спортсмена`, `ID_соревнования`, `место_в_зачёте`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 1, 3),
(4, 4, 4, 4),
(5, 1, 2, 2),
(6, 2, 2, 1),
(7, 5, 2, 3),
(8, 6, 3, 4),
(9, 1, 3, 3),
(10, 2, 3, 2),
(11, 3, 3, 1),
(12, 6, 3, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `список_призёров`
--

CREATE TABLE `список_призёров` (
  `ID_списка` int NOT NULL,
  `ID_соревнования` int NOT NULL,
  `Призёр1` int NOT NULL,
  `Призёр2` int NOT NULL,
  `Призёр3` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `спортсмены`
--

CREATE TABLE `спортсмены` (
  `ID_спортсмена` int NOT NULL,
  `ФИО` varchar(65) NOT NULL,
  `e_mail` varchar(320) NOT NULL,
  `телефон` varchar(20) NOT NULL,
  `дата_рождения` date NOT NULL,
  `время_создания_записи` datetime NOT NULL,
  `номер_паспорта` int NOT NULL,
  `биография` text NOT NULL,
  `видеопрезентация` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `спортсмены`
--

INSERT INTO `спортсмены` (`ID_спортсмена`, `ФИО`, `e_mail`, `телефон`, `дата_рождения`, `время_создания_записи`, `номер_паспорта`, `биография`, `видеопрезентация`) VALUES
(1, 'Спортсмен1', 'fff@mail.ru', '89000000000', '2023-05-01', '2023-05-19 21:45:46', 123456, 'agag', 'agagag'),
(2, 'Спортсмен2', '1234', '89000000000', '2023-04-03', '2023-05-19 21:48:07', 124456, '12345', '12345'),
(3, 'Спортсмен3', '1235', '89000000000', '2023-02-28', '2023-05-19 22:03:23', 122456, '123156', '124556'),
(4, 'Спортсмен4', '12356', '89000000000', '2023-03-06', '2023-05-19 22:03:55', 213567, '1234156', '1231246'),
(5, 'Спортсмен5', '1231265', '89000000000', '2023-05-01', '2023-05-19 22:04:18', 5637734, '1231245', '124125'),
(6, 'Спортсмен6', '1231246', '89000000000', '2023-02-14', '2023-05-19 22:04:46', 2136265, '23124126516', '12312431256');

-- --------------------------------------------------------

--
-- Структура таблицы `соревнования`
--

CREATE TABLE `соревнования` (
  `ID_соревнования` int NOT NULL,
  `дата_проведения` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `соревнования`
--

INSERT INTO `соревнования` (`ID_соревнования`, `дата_проведения`) VALUES
(1, '2023-04-10'),
(2, '2023-05-15'),
(3, '2023-04-03'),
(4, '2023-03-16'),
(5, '2023-05-25'),
(6, '2023-03-13');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `результаты`
--
ALTER TABLE `результаты`
  ADD PRIMARY KEY (`ID_результа`),
  ADD KEY `ID_спортсмена` (`ID_спортсмена`),
  ADD KEY `ID_соревнования` (`ID_соревнования`);

--
-- Индексы таблицы `список_призёров`
--
ALTER TABLE `список_призёров`
  ADD KEY `ID_соревнования` (`ID_соревнования`,`Призёр1`,`Призёр2`,`Призёр3`),
  ADD KEY `Призёр1` (`Призёр1`),
  ADD KEY `Призёр2` (`Призёр2`),
  ADD KEY `Призёр3` (`Призёр3`);

--
-- Индексы таблицы `спортсмены`
--
ALTER TABLE `спортсмены`
  ADD PRIMARY KEY (`ID_спортсмена`);

--
-- Индексы таблицы `соревнования`
--
ALTER TABLE `соревнования`
  ADD PRIMARY KEY (`ID_соревнования`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `результаты`
--
ALTER TABLE `результаты`
  MODIFY `ID_результа` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `спортсмены`
--
ALTER TABLE `спортсмены`
  MODIFY `ID_спортсмена` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `соревнования`
--
ALTER TABLE `соревнования`
  MODIFY `ID_соревнования` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `результаты`
--
ALTER TABLE `результаты`
  ADD CONSTRAINT `результаты_ibfk_1` FOREIGN KEY (`ID_спортсмена`) REFERENCES `спортсмены` (`ID_спортсмена`),
  ADD CONSTRAINT `результаты_ibfk_2` FOREIGN KEY (`ID_соревнования`) REFERENCES `соревнования` (`ID_соревнования`);

--
-- Ограничения внешнего ключа таблицы `список_призёров`
--
ALTER TABLE `список_призёров`
  ADD CONSTRAINT `список_призёров_ibfk_1` FOREIGN KEY (`ID_соревнования`) REFERENCES `соревнования` (`ID_соревнования`),
  ADD CONSTRAINT `список_призёров_ibfk_2` FOREIGN KEY (`Призёр1`) REFERENCES `результаты` (`ID_результа`),
  ADD CONSTRAINT `список_призёров_ibfk_3` FOREIGN KEY (`Призёр2`) REFERENCES `результаты` (`ID_результа`),
  ADD CONSTRAINT `список_призёров_ibfk_4` FOREIGN KEY (`Призёр3`) REFERENCES `результаты` (`ID_результа`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
