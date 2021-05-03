# **Relacionamentos entre tabelas no SQL e como consultá-las**

## **O que vamos aprender?**
Hoje você vai aprender a identificar os diferentes tipos de relacionamento entre tabelas, sendo eles:
  *1:1 (um para um)
  *1:N (um para muitos ou muitos para um)
  *N:N (muitos para muitos)

Além disso veremos como consultar os dados de tabelas relacionadas.

## **Por que isso é importante?**

# **Conteúdos**

## **Entendendo os relacionamentos**

1. **1:1 (um para um)**
Em um relacionamento um para um, um registro de uma tabela está associado a um e apenas um registro de outra tabela e vice-versa. Por exemplo imagine apenas por questões didáticas, que temos uma tabela com os nomes de todos os alunos da Trybe e outra com seu número de matricula, temos entre essas duas tabelas uma relacao de um para um, pois cada estudante está ligado a apenas um número de matricula, e cada número é atribuido apenas para um estudante.

2. **1:N (um para muitos ou muitos para um)**
Em um relacionamento um para muitos, um registro de uma tabela pode estar associado a muitos outros da outra tabela, mas cada registro dessa segunda tabela está associado a apenas um registro da primeira tabela. Um pouco confuso, não? vamos à um breve exemplo:
vamos imaginar um relacionamento entre proprietários de veículos e os veículos, cada proprietário pode ter muitos veículos em seu nome, mas ainda assim cada veículo pode apenas estar no nome de uma pessoa.

3. **N:N (muitos para muitos)**
Em um relacionamento muitos para muitos, um registro de uma tabela pode estar associado a muitos registros da outra tabela. O Spotify é uma plataforma de streaming musical, nele você pode seguir os artistas que você mais gosta, analizando o relacionamento entre pessoas e artistas, uma pessoa pode seguir quantos artistas desejar, assim como cada artista pode ser seguido por diversas pessoas. temos então um relacionamento muitos para muitos.

## **Para aquecer**

**Tente identificar os diferentes tipos de relação**
Imagine daqui a 5 anos, você é um programador de sucesso e decidiu fazer um cruzeiro nas férias, você acaba de embarcar no navio, será que pode identificar as seguintes relações?

1. Relação entre tripulantes e comandante.
> N:1 - neste cenário do cruzeiro, muitos passageiros estão ligados a apenas um comandante do navio.

2. Relação entre quartos e tripulantes.
> 1:N - cada quarto pode abrigar mais de uma pessoa, mas cada pessoa pertence a apenas um quarto.

3. Relação entre tripulantes e garçons.
> N:N - uma pessoa pode ser servida por diferentes garçons em diferentes momentos, assim como o mesmo garçon serve diversas pessoas.

4. Relação entre tripulantes e passagens.
>1:1 - cada pessoa tem exclusivamente uma passagem e cada passagem é destinada a apenas uma pessoa.

## **Como as tabelas são relacionadas no SQL **

**Observe as tabelas abaixo e identifique a relação entre elas:**
>vamos considerar que cada canção só pode estar presente em um album, para fins didáticos  


*Albuns*  

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

### **Mas o que associa as tabelas?**
A essa altura do campeonato você ja deve estar se perguntando: "tá, mas como identificamos quais dados estão ligados entre si?", e é isso que vamos ver agora, e pra isso você deve compreender o que é uma "chave primária" e uma "chave estrangeira".

### **Primary Key**
A Primary key ou chave primária de uma tabela, é a coluna identificadora de cada dado da tabela, obrigatoriamente toda tabela deve ter uma chave primaria, ela não pode ser nula e deve ser única, ou seja, não pode se repetir. É a identidade de cada linha.  
volte nas tabelas acima e identifique a primary key de cada uma.

### **Foreign Key**
A Foreign Key ou chave estrnageira de uma tabela, é a coluna onde vamos relacionar a quais dados essa linha pertence, deve-se especificar nessa coluna, a qual coluna e tabela que ela está relacionada.
no caso das tabelas acima a foreign key foi montada na tabela canções a partir do `album_id` e através dela, podemos identificar quais canções pertencem a quais albuns.

## **Recuperando um banco de dados**
Aqui vamos recuperar o banco de dados que usaremos para entender  e praticar o conteúdo a seguir.  

1. Primeiro vamos acessar o [repositório](https://github.com/rodrigoDeSouzaFernandes/summer-jobs-desafio) que contém o arquivo de recuperação

2. Clique no arquivo "banco-spotifyClone.sql" ![nome do banco](/images/nome-do-arquivo.jpeg)

3. Clique em "Raw" ![raw](/images/raw.jpeg)

4. Agora é só copiar todo o texto, colar no seu workbench e executar!.


## **Como consultar tabelas relacionadas através do método JOIN**

### **Para que servem os JOINS?**
o comando JOIN do SQL nos permite usar um operador de comparação para comparar os valores de colunas provenientes de tabelas associadas. Por meio desta cláusula, os registros de duas tabelas são usados para que sejam gerados os dados relacionados de ambas, ou seja, tem a função básica de agregar tabelas mediante a um campo que faça sentido às mesmas. Vejamos mais a seguir!

Como já contextualizamos os JOINS, qual seria a diferença entre eles? veremos isso logo em seguida!

### **INNER JOIN**
O INNER JOIN faz a junção das tabelas de forma que nos traz como resultado todas a linhas que tem dados correspondentes nas duas tabelas, não trazendo, assim, dados da tabela A ou tabela B que não tem relação na outra tabela, ou seja, podemos vê-lo como uma intersecção de conjuntos.

![INNER JOIN](/images/INNER_JOIN.png)

sua sintaxe é a seguinte:
```SQL
SELECT T1.Coluna_1, T2.Coluna_2 --Aqui selecionamos as colunas que desejamos mostrar na nossa tabela;
FROM tabela_1 AS T1 --Determinamos a primeira tabela e damos um nome curto a ela para manter um código limpo;
INNER JOIN tabela_2 AS T2 --Determinamos a segunda tabela e também passamos um alias para ela;
ON T1.id = T2.foreign_key --Utilizamos os alias para determinar de qual tabela pertence cada coluna e então selecionamos as colunas que estão relacionadas para que possamos compará-las;
``` 
agora vamos praticar com o banco de dados que recuperamos anteriormente.
Primeiro vamos analizar as tabelas que usaremos
1. selecione o banco de dados na aba "Schemas";
2. clique em Tables
3. Procure as tabelas "albuns" e "cancoes", clique com o botão direito do mouse sobre cada uma delas e escolha a opção "select rows", assim abrirá uma nova aba com uma consulta sobre a tabela, analise os dados com calma antes de avançar.  

![Select rows](/images/select-rows.png)

reproduza o código abaixo no workbench para entender melhor como funciona o INNER JOIN.
```SQL
SELECT
  t2.album,
  t1.cancao
FROM SpotifyClone.cancoes AS t1
INNER JOIN SpotifyClone.albuns AS t2
ON t1.album_id = t2.album_id;
```
**Recaptulando**
1. selecionamos as colunas que queremos exibir;
2. usamos o FROM para informar qual é a primeira tabela, como não especificamos o banco de dados antes de iniciar a query, devemos o informar junto à tabela;
3. usamos o INNER JOIN para especificar a qual tabela queremos fazer a junção;
4. definimos as colunas que devem ter seus dados iguais nas duas tabelas para que essas linhas sejam associadas.

#### **Exercicio de fixação**
1. monte uma query que recupere os dados do exemplo acima, porém que exiba também o nome do artista associado ao album.  
~~dica: pode se fazer inúmeros INNER JOINS na mesma query~~
2. use as tabelas "usuarios", "artistas_seguidos" e "artistas" e monte uma query que recupere uma coluna com o nome de cada usuário e o nome de cada artista que esse usuário segue.







