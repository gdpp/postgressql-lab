# Checkpoint 1

## Este es el primer checkpoint para practicar los siguentes temas aprendidos:

1. Queries
2. Creacion de bases de datos
3. Creación de tablas
4. Drop / Truncate
5. SELECT
6. INSERT
7. DELETE
8. UPDATE
9. Funciones y operadores como:

- Substring
- Position
- Concat
- ||
- Constrains básicos
- Serial

10. Aggregation Functions
11. Count
12. Min
13. Max
14. Avg
15. Group By
16. Round
17. Between
18. Introducción a subqueries
19. Distinct
20. Agrupaciones por partes de strings
21. Exposición sobre las relaciones de bases de datos
22. Exposición sobre las llaves y diferentes tipos de llaves
23. Checks de columnas y tablas
24. Indices
25. Llaves foráneas
26. Restricciones con las relaciones
27. Eliminaciones y actualizaciones en cascada
28. Otros tipos de acciones automáticas.
29. Actualizaciones masivas
30. Creación y volcado de información
31. Alteración de índices y checks
32. Eliminación de checks
33. Modificación de columnas mediante GUI y manualmente
34. Creación de tablas
35. Relaciones

## 50 ejercicios prácticos

A continuación te dejo los 50 ejercicios (sin respuestas). Algunos implican escribir queries, otros crear, alterar, eliminar o modificar datos, así como subconsultas o agrupaciones.

### Sección A: Creación y manipulación básica (1–10)

- [x] Crea la base de datos y todas las tablas según la estructura anterior.
- [ ] Inserta al menos 5 reinos distintos.
- [ ] Inserta al menos 6 razas distintas, relacionando algunas con diferentes reinos.
- [ ] Inserta 10 héroes con distintas combinaciones de razas y reinos.
- [ ] Inserta 8 misiones con distintos niveles de dificultad y recompensas.
- [ ] Inserta 10 objetos con combinaciones variadas de rareza y poder.
- [ ] Inserta 5 batallas con distintas fechas y reinos ganadores.
- [ ] Inserta una raza con una vida útil negativa y verifica que falle por el constraint.
- [ ] Inserta un objeto con rareza no válida y observa el error.
- [ ] Elimina una raza y verifica el efecto en los héroes (por el ON DELETE CASCADE).

### Sección B: SELECT, filtros y operadores (11–20)

- [ ] Muestra todos los héroes ordenados por nivel de poder descendente.
- [ ] Obtén los héroes nacidos después del año 1000.
- [ ] Encuentra los objetos legendarios fabricados antes del año 1500.
- [ ] Muestra las misiones con dificultad entre 5 y 9.
- [ ] Muestra los nombres de reinos que contienen la palabra “Val”.
- [ ] Usa || o CONCAT para mostrar el nombre completo del héroe con su título.
- [ ] Muestra las misiones con recompensa mayor al promedio.
- [ ] Usa DISTINCT para listar todas las rarezas existentes.
- [ ] Usa POSITION y SUBSTRING para mostrar las tres primeras letras del nombre del reino.
- [ ] Muestra los héroes cuyo título contiene la palabra “Guardian”.

### Sección C: Agregaciones y agrupaciones (21–30)

- [ ] Muestra cuántos héroes hay por raza.
- [ ] Calcula el promedio de poder de los héroes por reino.
- [ ] Encuentra el máximo y mínimo reward_gold de todas las misiones.
- [ ] Muestra el número total de objetos por rareza.
- [ ] Agrupa los reinos por si son mágicos o no y muestra el promedio de población.
- [ ] Muestra las razas con promedio de esperanza de vida mayor a 500 años.
- [ ] Calcula el número de misiones pendientes por héroe.
- [ ] Muestra las batallas agrupadas por reino con la suma de muertes (death_count).
- [ ] Usa HAVING para mostrar solo los reinos con más de 2 héroes.
- [ ] Redondea el promedio de power_level de los héroes a 2 decimales.

### Sección D: Subqueries y joins (31–40)

- [ ] Muestra los héroes que participaron en misiones con dificultad mayor al promedio.
- [ ] Muestra los nombres de reinos que tienen héroes con poder mayor al promedio general.
- [ ] Muestra los héroes que no tienen misiones asignadas.
- [ ] Encuentra los héroes con más de una misión.
- [ ] Muestra el nombre de las razas cuyos héroes pertenecen a más de un reino.
- [ ] Muestra las batallas donde ganó un reino con población mayor a 1 millón.
- [ ] Muestra los objetos creados en el mismo reino donde nació su héroe portador (usa JOIN).
- [ ] Muestra los reinos y su cantidad de batallas ganadas (usa LEFT JOIN).
- [ ] Muestra los héroes con misiones completadas y la cantidad de misiones terminadas.
- [ ] Encuentra el héroe más poderoso de cada reino.

### Sección E: Mantenimiento y alteraciones (41–50)

- [ ] Agrega una nueva columna mana_level a heroes con valor por defecto 0.
- [ ] Actualiza los héroes cuyo poder sea mayor a 90 para asignarles mana_level = 100.
- [ ] Elimina el índice de quests y recréalo con otro nombre.
- [ ] Modifica la columna population de realms para permitir NULL.
- [ ] Crea un nuevo índice compuesto en heroes(name, power_level).
- [ ] Elimina todos los objetos malditos (is_cursed = TRUE).
- [ ] Duplica la tabla heroes a heroes_backup usando CREATE TABLE AS.
- [ ] Restaura la tabla heroes desde heroes_backup.
- [ ] Crea un CHECK para que reward_gold de las misiones sea mayor que 0.
- [ ] Crea un volcado (backup) de la base completa con pg_dump y restaura en otra base llamada valoria_backup.

### Índices a crear

- [ ] Índice en heroes(power_level)
- [ ] Índice en quests(difficulty, reward_gold)
- [ ] Índice único en items(name, realm_id)
- [ ] Índice compuesto en battles(realm_id, date)
- [ ] Índice GIN o BTREE en realms(name) (dependiendo del tipo de búsqueda que hagas)
