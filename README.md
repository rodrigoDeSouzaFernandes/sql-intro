# Relacionamentos entre tabelas no SQL e como consultá-las

<br>

## O que vamos aprender?

Entender os diferentes tipos de relações entre tabelas e utilizar os JOINS para consultar informações relacionadas em diferentes tabelas.

### Você será capaz de:

* Identificar os diferentes tipos de relacionamento entre tabelas, sendo eles:
  * 1:1 (um para um)
  * 1:N (um para muitos ou muitos para um)
  * N:N (muitos para muitos)

* Além disso veremos como consultar os dados de tabelas relacionadas, você será capaz de entender e fazer consultas com:
  * INNER JOIN
  * LEFT JOIN
  * RIGHT JOIN

---

## Por que isso é importante?
Bem, estamos vivendo na era digital, em todo o globo praticamente todas as informações relevantes ao nosso dia a dia são armazenadas em algum tipo de banco de dados.  
Já entendemos que a maioria dos dados estão em banco de dados e isso consequentemente aumenta a demanda por profissionais que conheçam sobre essa tecnologia, saber manipular esse dados é essencial para aumentar sua empregabilidade.

---

## Conteúdos

### Entendendo os relacionamentos

#### Tipos de relacionamento entre tabelas.

1. **1:1 (um para um)**
Em um relacionamento um para um, um registro de uma tabela está associado a um e apenas um registro de outra tabela e vice-versa. Por exemplo imagine apenas por questões didáticas, que temos uma tabela com os nomes de todos os alunos da Trybe e outra com seu número de matricula, temos entre essas duas tabelas uma relação de um para um, pois cada estudante está ligado a apenas um número de matrícula, e cada número é atribuído a apenas um estudante.

2. **1:N (um para muitos ou muitos para um)**
Em um relacionamento um para muitos, um registro de uma tabela pode estar associado a muitos outros da outra tabela, mas cada registro dessa segunda tabela está associado a apenas um registro da primeira tabela. Um pouco confuso, não? vamos à um breve exemplo:
vamos imaginar um relacionamento entre proprietários de veículos e os veículos, cada proprietário pode ter muitos veículos em seu nome, mas ainda assim cada veículo pode apenas estar no nome de uma pessoa.

3. **N:N (muitos para muitos)**
Em um relacionamento muitos para muitos, um registro de uma tabela pode estar associado a muitos registros da outra tabela. O Spotify é uma plataforma de streaming musical, nele você pode seguir os artistas que você mais gosta, analizando o relacionamento entre pessoas e artistas, uma pessoa pode seguir quantos artistas desejar, assim como cada artista pode ser seguido por diversas pessoas. temos então um relacionamento muitos para muitos.

#### Para fixar

**Tente identificar os diferentes tipos de relação**  

Imagine daqui a 5 anos, você é um programador de sucesso e decidiu fazer um cruzeiro nas férias, você acaba de embarcar no navio, será que pode identificar os seguintes tipos de relações?

**Primeiro tente identificar sozinho, depois clique no item para exibir a resposta correta.**

1. <details>
    <summary>Relação entre tripulantes e comandante.</summary>
    <br>
    N:1 - Neste cenário do cruzeiro, muitos passageiros estão ligados a apenas um comandante do navio.
  </details>

2. <details>
    <summary>Relação entre quartos e tripulantes.</summary>
    <br>
    1:N - Cada quarto pode abrigar mais de uma pessoa, mas cada pessoa pertence a apenas um quarto.
  </details>

3. <details>
    <summary>Relação entre tripulantes e garçons.</summary>
    <br>
    N:N - Uma pessoa pode ser servida por diferentes garçons em diferentes momentos, assim como o mesmo garçon serve diversas pessoas.
  </details>

4. <details>
    <summary>Relação entre tripulantes e passagens.</summary>
    <br>
    1:1 - Cada pessoa tem exclusivamente uma passagem e cada passagem é destinada a apenas uma pessoa.
    </details>

---

### Primary Key e Foreign Key

#### Mas o que associa as tabelas?
A essa altura do campeonato você ja deve estar se perguntando: "mas como identificamos quais dados estão ligados entre si?", e é isso que vamos ver agora, e pra isso você deve compreender o que é uma "chave primária" e uma "chave estrangeira".

#### Primary Key
A Primary key ou chave primária de uma tabela, é a coluna identificadora de cada dado da tabela, obrigatoriamente toda tabela deve ter uma chave primária, ela não pode ser nula e deve ser única, ou seja, não pode se repetir. É a identidade de cada linha.  

#### Foreign Key
A Foreign Key ou chave estrangeira de uma tabela, é a coluna onde vamos relacionar a quais dados essa linha pertence, deve-se especificar nessa coluna, a qual coluna e tabela que ela está relacionada.
no caso das tabelas abaixo a foreign key foi montada na tabela canções a partir do `album_id` e através dela, podemos identificar quais canções pertencem a quais álbuns.

#### Exercícios de fixação

**Observe as tabelas abaixo**
>vamos considerar que cada canção só pode estar presente em um álbum, para fins didáticos  

*Álbuns*  
album_id | album
---------|------
1 | Envious
2 | Exuberant
3 | Halowed Steam


*Canções*
cancao_id | album_id | cancao
----------|----------|--------
1|1| Soul For Us
2|1| Reflections of Magic
3|1| Dance With Her Own
4|2| Troubles of my inner fire
5|2| Time fireworks
6|3| Magic Circus
7|3| Honey, So I do
8|3| Sweetie, Let's go Wild  

<br>

1. Qual é a relação entre as tabelas?
2. Qual coluna é a chave primária da tabela "Álbuns"
3. Qual das tabelas tem uma chave estrangeira?
4. Qual coluna é a chave estrangeira da tabela do exercício anterior? 

---

### Recuperando um banco de dados
Aqui vamos recuperar o banco de dados que usaremos para entender  e praticar o conteúdo a seguir.  

1. Primeiro vamos acessar o [repositório](https://github.com/rodrigoDeSouzaFernandes/summer-jobs-desafio) que contém o arquivo de recuperação

2. Clique no arquivo "banco-spotifyClone.sql" ![nome do banco](/images/nome-do-arquivo.jpeg)

3. Clique em "Raw" ![raw](/images/raw.jpeg)

4. Agora é só copiar todo o texto, colar no seu workbench e executar!.

---

### Como consultar tabelas relacionadas através do método JOIN

#### Para que servem os JOINS?
O comando JOIN do SQL nos permite usar um operador de comparação para comparar os valores de colunas provenientes de tabelas associadas. Por meio desta cláusula, os registros de duas tabelas são usados para que sejam gerados os dados relacionados de ambas, ou seja, tem a função básica de agregar tabelas mediante a um campo que faça sentido às mesmas. Vejamos mais a seguir!

#### INNER JOIN
O INNER JOIN faz a junção das tabelas de forma que nos traz como resultado todas a linhas que tem dados correspondentes **nas duas tabelas**, não trazendo, assim, dados da tabela A ou tabela B que não tem relação na outra tabela, ou seja, podemos vê-lo como uma intersecção de conjuntos.

![INNER JOIN](/images/INNER_JOIN.png)

Sua sintaxe é a seguinte:

```SQL
SELECT T1.Coluna_1, T2.Coluna_2 --Aqui selecionamos as colunas que desejamos mostrar na nossa tabela;
FROM tabela_1 AS T1 --Determinamos a primeira tabela e damos um nome curto a ela para manter um código limpo;
INNER JOIN tabela_2 AS T2 --Determinamos a segunda tabela e também passamos um alias para ela;
ON T1.id = T2.foreign_key --Utilizamos os alias para determinar de qual tabela pertence cada coluna e então selecionamos as colunas que estão relacionadas para que possamos compará-las;
```

Agora vamos praticar com o banco de dados que recuperamos anteriormente.  
Primeiro vamos analizar as tabelas que usaremos.
1. Selecione o banco de dados na aba "Schemas";
2. Clique em "Tables";
3. Procure as tabelas "albuns" e "cancoes", clique com o botão direito do mouse sobre cada uma delas e escolha a opção "Select rows", assim abrirá uma nova aba com uma consulta sobre a tabela, analise os dados com calma antes de avançar.  

![Select rows](/images/select-rows.png)

Reproduza o código abaixo no workbench para entender melhor como funciona o INNER JOIN.

```SQL
SELECT
  t2.album,
  t1.cancao
FROM SpotifyClone.cancoes AS t1
INNER JOIN SpotifyClone.albuns AS t2
ON t1.album_id = t2.album_id;
```

**Recaptulando**
1. Selecionamos as colunas que queremos exibir;
2. Usamos o FROM para informar qual é a primeira tabela, como não especificamos o banco de dados antes de iniciar a query, devemos o informar junto à tabela;
3. Usamos o INNER JOIN para especificar a qual tabela queremos fazer a junção;
4. Definimos as colunas que devem ter seus dados iguais nas duas tabelas para que essas linhas sejam associadas.

#### Exercicio de fixação

>dica: pode se fazer inúmeros INNER JOINS na mesma query

1. Monte uma query que recupere os dados do exemplo acima, porém que exiba também o nome do artista associado ao álbum.  

2. Quando a relação entre as tabelas é N:N(muitos para muitos), devemos usar uma tabela intermediária para associar os dados, este é o papel da tabela "artistas_seguidos" nesse caso, use as tabelas "usuarios", "artistas_seguidos" e "artistas" e monte uma query que recupere uma coluna com o nome de cada usuário e o nome de cada artista que esse usuário segue.

---

### LEFT JOIN e RIGHT JOIN
Diferente do INNER JOIN que retorna uma intersecção, o LEFT JOIN retorna todas as linhas da primeira tabela, mesmo quando não há correspondência na segunda tabela. Trazendo todos os dados da primeira tabela e da segunda tabela apenas os que se relacionam com a primeira, como descreve a imagem a seguir:

![LEFT JOIN](/images/LEFT_JOIN.png)

Já o RIGHT JOIN segue o mesmo princípio, porém retorna todos os dados da segunda tabela, mesmo se não houver nenhuma correspondência na primeira tabela.

![RIGHT JOIN](/images/RIGHT_JOIN.png)

#### Exercício de fixação

Primeiramente vamos adicionar uma linha na nossa tabela de álbuns para que possamos treinar o LEFT JOIN e o RIGHT JOIN.

```SQL
  USE SpotifyClone;
  INSERT INTO albuns(album, artista_id) VALUES ("Meu album", 1);
```

Agora temos um álbum que não está relacionado a nenhuma canção.  
Faça novamente um INNER JOIN nas tabelas "albuns" e "cancoes" de forma que recupere uma coluna com o nome dos álbuns e uma com o nome das canções e verifique o resultado, repare que nosso novo álbum não aparece pois ele não tem uma coluna correspondente na outra tabela.

1. Agora faça um LEFT JOIN buscando o mesmo resultado, sendo a tabela 1, a tabela "albuns" e a 2, a tabela "cancoes".

2. Agora que você já aprendeu, inverta a ordem de chamada das tabelas e faça um RIGHT JOIN, o resultado deve ser o mesmo.

resultado esperado:
![Left e right join](/images/resultado-left-join.jpeg)

---

## Exercícios
### Agora a prática
Para os seguintes exercícios utilizaremos o banco de dados sakila, clique [neste link](https://s3.us-east-2.amazonaws.com/assets.app.betrybe.com/back-end/sakila-1ae15ae82697888c35bf1f1c8acbf755.sql) para baixá-lo.  
Caso ocorra algum problema, o banco sakila também está disponível neste [repositório](https://github.com/rodrigoDeSouzaFernandes/summer-jobs-desafio).  

* Abra o arquivo;
* Selecione todo o texto contido nele;
* Cole em uma nova janela no MySQL Workbench e execute o código
* Pronto, já temos nosso banco de dados, agora mão na massa!

**1.** Identifique o tipo de relacionamento da tabela "film" com a tabela "film_actor";

**2.** Identifique a relação entre "customer" e "rental".

**3.** Usando as tabelas "country" e "city" monte uma query que exiba o nome das cidades e o nome do país a qual cada cidade pertence.

**4.** Usando a tabela "customer" e "rental", monte uma query que retorne uma tabela de 2 colunas, sendo a primeira nomeada de "Nome completo" e que traga o nome completo do cliente e a segunda nomeada de "Total de aluguéis" contendo o número total de aluguéis feitos por cada cliente.

**5.** Usando as tabelas "film", "film_category" e "category", monte uma query que exiba 3 colunas, o nome do filme com o alias "Título", a sua descrição com o alias "Descrição" e a categoria do filme com o alias "Categoria". Os resultados devem ser ordenados pela categoria em ordem alfabética.

**6.** Usando as tabelas "payment", "staff" e "customer", monte uma query que exiba todos os pagamentos recebidos pelo funcionário "Mike Hillyer" no mês de agosto, a tabela deve ter 3 colunas, sendo a primeira o nome completo do funcionário que recebeu o pagamento com o alias "Funcionário", a segunda a data do pagamento com o alias "Data" e a terceira o nome completo do cliente com o alias "Cliente". A tabela deve estar ordenada pela data, da mais recente para a mais antiga.

**7.** Usando as tabelas "customer", "address", "city" e "country", monte uma query que retorne uma coluna "Nome" com o nome completo do cliente, as colunas "Telefone", "Endereço", "Distrito", "Cidade" e "País" com os respectivos dados. Ordene o resultado em ordem alfabética pelo nome completo do cliente, e em caso de empate pelo nome do País.

**8.** Agora exiba o nome de cada país com o alias "País" e a quantidade de pessoas cadastradas em cada país com o alias "Pessoas cadastradas" e ordene por pessoas cadastradas de forma decrescente.

### Bônus

**1.** Monte uma query que exiba todos os filmes que começam com a letra "A", e a quantidade de atores relacionados ao filme.

**2** Agora exiba o nome completo de **todos os atores** e a quantidade de filmes em que cada ator participou, ordene os atores em ordem alfabética.

**3** Monte uma query que exiba o Nome completo dos atores, o título dos filmes em que participaram e a categoria dos filmes. Ordene a busca pelo nome do ator em ordem decrescente (alfabética-invertida).

**4** Use a tabela "customer" e "rental" para exibir uma linha com o primeiro nome do cliente com o `customer_id = 1`, a data do ultimo aluguel, a data do primeiro aluguel e a contagem do total de aluguéis feitos por esse cliente.


---

## **Recursos adicionais (opcional)**
  * Entenda mais sobre os SQL JOINS com a [w3schools](https://www.w3schools.com/sql/sql_join.asp)
  * Aprenda JOINS e dê um sorriso em [terminalroot](https://terminalroot.com.br/2019/10/inner-join-left-join-right-join-mysql.html) (Foto engraçada para fixar o conteúdo)
  * Entenda mais sobre relacionamentos através da criação de tabela e uso do INNER JOIN na prática no canal do [Quimello](https://www.youtube.com/watch?v=HUPl-AU_s7Q)
  * SQL: Aprenda a utilizar a chave primária e a chave estrangeira em [devmedia](https://www.devmedia.com.br/sql-aprenda-a-utilizar-a-chave-primaria-e-a-chave-estrangeira/37636)





