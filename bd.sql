-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 18 2024 г., 21:19
-- Версия сервера: 8.0.30
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `site`
--

-- --------------------------------------------------------

--
-- Структура таблицы `components`
--

CREATE TABLE `components` (
  `id_component` int NOT NULL,
  `name_component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `view_id` int NOT NULL,
  `parameters` text NOT NULL,
  `delivery_date` int NOT NULL,
  `technical_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `components`
--

INSERT INTO `components` (`id_component`, `name_component`, `image`, `view_id`, `parameters`, `delivery_date`, `technical_information`, `user_id`) VALUES
(1, 'Микросхема К555ИД5, корпус DIP-16', 'K555ID5microchip.jpg', 1, 'Прочность', 2323, 'Стандартные серии ТТЛ: 533, 555. Время задержки 10 нс, мощность потребления 2 мВт/вентиль\r\nСдвоенный декодер 2 в 4 с открытым коллектором\r\nКорпус: 238.16-2 (DIP16)\r\nИмпортный аналог: SN74LS156', NULL),
(2, 'CF-100 (С1-4) 1 Вт, 1 Ом, 5%, Резистор углеродистый', 'CF-100Carbonresistor.jpg', 3, 'Стойкость', 10, 'Резисторы с углеродным проводящим слоем предназначены для работы в цепях постоянного, переменного и импульсного тока.\r\nЯвляются заменой отечественных резисторов С1-4\r\nНоминальная мощность: 0.25 Вт, 0.5 Вт, 1 Вт, 2 Вт\r\nДиапазон номинальных сопротивлений: 1 Ом - 10 МОм; ряд E24\r\nТочность: 5% (J)\r\nДиапазон рабочих температур: -55 …+125°C', NULL),
(3, 'AWM42150VH, расход 25см3/мин 8.5мВ', '/AWM42150VH.jpg', 2, 'Водонепроницаемость', 22, 'датчики расхода газа\r\nAir Flow Sensor В±25sccm Female, 0.19\" (4.826mm) Silicon', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `notes`
--

CREATE TABLE `notes` (
  `id_note` int NOT NULL,
  `component_id` int NOT NULL,
  `content` text NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `notes`
--

INSERT INTO `notes` (`id_note`, `component_id`, `content`, `user_id`) VALUES
(1, 3, 'Работает исправно', 3),
(2, 2, 'Работает не очень', 2),
(3, 1, 'Ну нормально', 3),
(4, 1, 'Очень хорошо', 4),
(5, 2, '', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id_role` int NOT NULL,
  `name_role` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id_role`, `name_role`) VALUES
(1, 'Администратор (редактирование списка пользователей, изменение полномочий пользователей)'),
(2, 'Разработчик (только чтение)'),
(3, 'Разработчик (добавление своих компонентов и их редактирование, добавление заметок к чужим компонентам)'),
(4, 'Разработчик (редактирование всех компонентов)');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `fio` varchar(100) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `fio`, `login`, `password`, `role_id`) VALUES
(1, 'Романова Мадина Тимуровна', 'devel1', 'devel1', 2),
(2, 'Мартынов Дмитрий Денисович', 'admin1', 'admin1', 1),
(3, 'Николаева Василиса Владимировна', 'devel2', 'devel2', 3),
(4, 'Захаров Егор Александрович', 'devel3', 'devel3', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `views`
--

CREATE TABLE `views` (
  `id_view` int NOT NULL,
  `name_view` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `views`
--

INSERT INTO `views` (`id_view`, `name_view`) VALUES
(1, 'Микросхема'),
(2, 'Датчик'),
(3, 'Резистор');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id_component`),
  ADD KEY `FK_view` (`view_id`);

--
-- Индексы таблицы `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id_note`),
  ADD KEY `FK_notes` (`component_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `login` (`login`) USING BTREE,
  ADD KEY `FK_roles` (`role_id`);

--
-- Индексы таблицы `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id_view`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `components`
--
ALTER TABLE `components`
  MODIFY `id_component` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `notes`
--
ALTER TABLE `notes`
  MODIFY `id_note` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `views`
--
ALTER TABLE `views`
  MODIFY `id_view` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `components`
--
ALTER TABLE `components`
  ADD CONSTRAINT `FK_view` FOREIGN KEY (`view_id`) REFERENCES `views` (`id_view`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `FK_notes` FOREIGN KEY (`component_id`) REFERENCES `components` (`id_component`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
