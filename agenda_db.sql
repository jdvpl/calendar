

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------

CREATE DATABASE agenda_db;

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `fecha_inicio` varchar(20) NOT NULL,
  `fecha_fin` varchar(20) DEFAULT NULL,
  `hora_inicio` varchar(20) DEFAULT NULL,
  `hora_fin` varchar(20) DEFAULT NULL,
  `allday` tinyint(1) DEFAULT NULL,
  `fk_usuarios` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

CREATE TABLE `usuarios` (
  `email` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `usuarios` (`email`, `nombre`, `password`, `fecha_nacimiento`) VALUES
('raulrlopez@mail.com', 'Raul Lopez', '$2y$10$W8FD0TxTSe7SI9PcYjX/kOGacZDWI/2vog.D6G/jjNmY/Ss7ZYH9.', '1975-12-26'),
('nelsaalmanzar@mail.com', 'Nelsa Almanzar', '$2y$10$Ha7A76KRykNP1GEK5AEjh.iOWdaj4YOJNn5KkxIG/pfL.MbrkIUH2', '1988-12-07'),
('joseAlopez@mail.com', 'Jose Lopez', '$2y$10$CKtvyp6EMBZHMnbA4bgLpOFnXOn./QLqHDsHQhiDJv2QP4kjy..rK', '2000-02-01'),
('enmaMlopez@mail.com', 'Enma M Lopez', '$2y$10$TZRZt4cb/j54ZWfCGM9BoeN.1z4tES/rYlRRJc2tS7t0e5/mNmPOu', '1990-04-08'),
('juanJ@mail.com', 'Juan Jose', '$2y$10$OLwyAFahqQXnniZB0lbLQ.tKeKApIHtnqPTsX8K9bFcfWr/AmjJdG', '1997-12-21'),
('cristaMlopez@mail.com', 'Crista M Lope', '$2y$10$oehYLZno8Cm7g6799HRmietD/ps.turmjQ.RUcLZJv4oJ54mXdFc2', '1995-2-03');


ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuarios` (`fk_usuarios`);


ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`email`);

ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_usuarioemail_evento` FOREIGN KEY (`fk_usuarios`) REFERENCES `usuarios` (`email`);
COMMIT;

