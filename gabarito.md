## Exercícios de Fixação

### Primary key e Foreign Key

1. Qual é a relação entre as tabelas?  
R: 1:N - Um álbum pode ter muitas canções, mas cada canção pertence a somente um álbum.

2. Qual coluna é a chave primária da tabela "Albuns"  
R: Album_id

3. Qual das tabelas têm uma chave estrangeira?  
R: A tabela "cancoes"

4. Qual coluna é a chave estrangeira da tabela do exercicio anterior?  
R: A coluna "album_id" na tabela "cancoes" serve pra identificar a qual linha da tabela "albuns" cada dado está associado.

### INNER JOIN

1. monte uma query que recupere os dados do exemplo acima, porém que exiba também o nome do artista associado ao álbum.  

```SQL
SELECT
  t2.album,
  t1.cancao,
  t3.artista
FROM SpotifyClone.cancoes AS t1
INNER JOIN SpotifyClone.albuns AS t2
ON t1.album_id = t2.album_id
INNER JOIN SpotifyClone.artistas AS t3
ON t3.artista_id = t2.artista_id;
```

2. Quando a relação entre as tabelas é N:N(muitos para muitos), devemos usar uma tabela intermediária para associar os dados, este é o papel da tabela "artistas_seguidos" nesse caso, use as tabelas "usuarios", "artistas_seguidos" e "artistas" e monte uma query que recupere uma coluna com o nome de cada usuário e o nome de cada artista que esse usuário segue.

```SQL
  SELECT
      t1.nome,
      t3.artista
    FROM SpotifyClone.usuario AS t1
    INNER JOIN SpotifyClone.artistas_seguidos AS t2
    ON t1.usuario_id = t2.usuario_id
    INNER JOIN SpotifyClone.artistas AS t3
    ON t3.artista_id = t2.artista_id;
  ```

### LEFT JOIN E RIGHT JOIN

1. Agora faça um LEFT JOIN buscando o mesmo resultado, sendo a tabela 1, a tabela "albuns" e a 2 a tabela "cancoes".

```SQL
SELECT
  t1.album,
  t2.cancao
FROM SpotifyClone.albuns AS t1
LEFT JOIN SpotifyClone.cancoes AS t2
ON t1.album_id = t2.album_id;
```

2. Agora que você já aprendeu, inverta a ordem de chamada das tabelas e faça um RIGHT JOIN, o resultado deve ser o mesmo.

```SQL
SELECT
  t2.album,
  t1.cancao
FROM SpotifyClone.cancoes AS t1
RIGHT JOIN SpotifyClone.albuns AS t2
ON t1.album_id = t2.album_id;
```

---

## Exercícios
**1.** Identifique o tipo de relacionamento da tabela "film" com a tabela "film_actor".  
R: Relacionamento muitos para muitos, um ator pode fazer muitos filmes assim como um filme contém muitos atores.

**2.** Identifique a relação entre "customer" e "rental".  
R: Um para muitos, cada cliente pode fazer diversos aluguéis, mas cada rental_id é referente a apenas um cliente.

**3.** Usando as tabelas "country" e "city" monte uma query que exiba o nome das cidades e o nome do país a qual cada cidade pertence.

```SQL
SELECT --selecionamos as colunas
  t2.city,
  t1.country
FROM sakila.country AS t1 --define tabela 1
INNER JOIN sakila.city AS t2 --define tabela 2
ON t1.country_id = t2.country_id --compara a foreign key que faz ligação entre as tabelas.
```

**4.** Usando a tabela "customer" e "rental", monte uma query que retorne uma tabela de 2 colunas, sendo a primeira nomeada de "Nome completo" e que traga o nome completo do cliente e a segunda nomeada de "Total de aluguéis" contendo o número total de aluguéis feitos por cada cliente.

```SQL
SELECT
  CONCAT(t1.first_name, ' ', t1.last_name) AS "Nome completo",
  COUNT(*) AS "Total de alugéis" --quando agrupado, conta o número de dados referente àquela linha.
FROM sakila.customer AS t1
INNER JOIN sakila.rental AS t2
ON t1.customer_id = t2.customer_id --compara a foreign key que faz a ligação das tabelas.
GROUP BY t1.customer_id; --agrupa pelo id, garantindo um correto agrupamento, sem chances de erros como poderiam ocorrer ao agrupar por nomes em caso de nomes repetidos.
```



---

## Bônus
