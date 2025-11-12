# Indexes

Un índice es una estructura auxiliar que acelera las consultas (SELECT) permitiendo buscar datos sin recorrer toda la tabla (búsqueda secuencial).
Actúa como un atajo para encontrar filas más rápido.

##### Desventaja:

Los índices ocupan espacio y hacen más lentas las operaciones de escritura (INSERT, UPDATE, DELETE) porque deben mantenerse actualizados.

## Tipos de índices principales

### 1. B-Tree (por defecto)

- Tipo de índice más usado.
- Optimizado para:
  - Comparaciones: =, <, >, <=, >=
  - Rangos: BETWEEN
  - ORDER BY
- Se crea automáticamente en claves primarias o columnas únicas.

Ejemplo:

```sql
CREATE INDEX idx_users_name ON users(name);
```

Uso:

```sql
SELECT _ FROM users WHERE name = 'Gustavo';
SELECT _ FROM users WHERE name BETWEEN 'A' AND 'M';
```

### 2. Hash Index

- Solo útil para comparaciones de igualdad (=).
- Es más rápido que B-Tree en este caso específico.
- Desde PostgreSQL 10 son durables y transaccionales.

Ejemplo:

```sql
CREATE INDEX idx_users_email_hash ON users USING hash(email);
```

Uso:

```sql
SELECT \* FROM users WHERE email = 'user@example.com';
```

### 3. GIN (Generalized Inverted Index)

- Ideal para:
  - Arrays
  - JSONB
  - Búsqueda de texto completo (Full Text Search)

Ejemplo con JSONB:

```sql
CREATE INDEX idx_data_gin ON users USING gin(data);
```

Ejemplo con texto completo:

```sql
CREATE INDEX idx_posts_content_gin ON posts USING gin(to_tsvector('english', content));
```

Uso:

```sql
SELECT \* FROM posts WHERE to_tsvector('english', content) @@ to_tsquery('postgres');
```

### 4. GiST (Generalized Search Tree)

- Más flexible, usado para:
  - Datos geométricos o espaciales (PostGIS)
  - Rangos de valores
  - Similaridad de texto

Ejemplo (con rangos):

```sql
CREATE INDEX idx_events_daterange_gist ON events USING gist(daterange(start_date, end_date, '[]'));
```

Uso:

```sql
SELECT \* FROM events WHERE daterange(start_date, end_date, '[]') @> DATE '2025-01-01';
```

### 5. BRIN (Block Range INdex)

- Usa rangos de bloques en lugar de filas individuales.
- Ideal para tablas grandes ordenadas por fecha o ID secuencial.
- Muy eficiente en espacio.

Ejemplo:

```sql
CREATE INDEX idx_logs_date_brin ON logs USING brin(created_at);
```

Uso:

```sql
SELECT \* FROM logs WHERE created_at BETWEEN '2025-01-01' AND '2025-01-31';
```

### Índices únicos (UNIQUE INDEX)

- Aseguran que no existan valores duplicados en una columna.

Ejemplo:

```sql
CREATE UNIQUE INDEX idx_users_email_unique ON users(email);
```

Equivalente a:

```sql
ALTER TABLE users ADD CONSTRAINT unique_email UNIQUE(email);
```

Uso:

```sql
INSERT INTO users (email) VALUES ('test@example.com');
-- Error si el email ya existe
```

### Índices parciales

- Indexan solo las filas que cumplen una condición.
- Sirven para ahorrar espacio y mejorar rendimiento cuando solo un subconjunto se consulta frecuentemente.

Ejemplo:

```sql
CREATE INDEX idx_active_users ON users(email) WHERE active = true;
```

Uso:

```sql
SELECT \* FROM users WHERE active = true AND email LIKE '%gmail.com';
```

### Índices compuestos

- Contienen más de una columna.
- Son útiles para consultas con varios filtros.

Ejemplo:

```sql
CREATE INDEX idx_orders_user_status ON orders(user_id, status);
```

Uso:

```sql
SELECT \* FROM orders WHERE user_id = 10 AND status = 'pending';
```

- El orden importa:
  - El índice (user_id, status) sirve para WHERE user_id = ...
  - Pero no sirve para WHERE status = ... solo.

#### Consultar información de índices

- Ver todos los índices creados:

```sql
\d users
```

- O ver estadísticas:

```sql
SELECT \* FROM pg_stat_user_indexes;
```

- Ver si una consulta usa un índice:

```sql
EXPLAIN ANALYZE
SELECT \* FROM users WHERE email = 'test@example.com';
```

#### Mantenimiento y eliminación

Reconstruir índice dañado o desactualizado:

```sql
REINDEX INDEX idx_users_name;
```

Eliminar índice:

```sql
DROP INDEX IF EXISTS idx_users_name;
```

#### Buenas prácticas

- Crea índices para:
- Columnas usadas en WHERE, JOIN, ORDER BY o GROUP BY
- Columnas con alta selectividad (muchos valores distintos)

#### Evita índices en:

- Tablas pequeñas (PostgreSQL puede leerlas más rápido sin índice)
- Columnas booleanas o con pocos valores distintos
- Columnas que cambian muy seguido (porque cada cambio actualiza el índice)
