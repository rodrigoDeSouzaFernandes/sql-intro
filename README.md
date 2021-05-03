# Relacionamentos entre tabelas no SQL e como consultá-las

## O que vamos aprender?
Hoje você vai aprender a identificar os diferentes tipos de relacionamento entre tabelas, sendo eles:
  *1:1 (um para um)
  *1:N (um para muitos ou muitos para um)
  *N:N (muitos para muitos)

Além disso veremos como consultar os dados de tabelas relacionadas.

## Por que isso é importante?

## Conteúdos

### Entendendo os relacionamentos

1. **1:1 (um para um)**
Em um relacionamento um para um, um registro de uma tabela está associado a um e apenas um registro de outra tabela e vice-versa. Por exemplo imagine apenas por questões didáticas, que temos uma tabela com os nomes de todos os alunos da Trybe e outra com seu número de matricula, temos entre essas duas tabelas uma relacao de um para um, pois cada estudante está ligado a apenas um número de matricula, e cada número é atribuido apenas para um estudante.

2. **1:N (um para muitos ou muitos para um)**
Em um relacionamento um para muitos, um registro de uma tabela pode estar associado a muitos outros da outra tabela, mas cada registro dessa segunda tabela está associado a apenas um registro da primeira tabela. Um pouco confuso, não? vamos à um breve exemplo:
vamos imaginar um relacionamento entre proprietários de veículos e os veículos, cada proprietário pode ter muitos veículos em seu nome, mas ainda assim cada veículo pode apenas estar no nome de uma pessoa.

3. **N:N (muitos para muitos)**
Em um relacionamento muitos para muitos, um registro de uma tabela pode estar associado a muitos registros da outra tabela. O Spotify é uma plataforma de streaming musical, nele você pode seguir os artistas que você mais gosta, analizando o relacionamento entre pessoas e artistas, uma pessoa pode seguir quantos artistas desejar, assim como cada artista pode ser seguido por diversas pessoas. temos então um relacionamento muitos para muitos.

### Para aquecer

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

### Como as tabelas são relacionadas no SQL 

**Observe as tabelas abaixo e identifique a relação entre elas:**
>vamos considerar que cada canção só pode estar presente em um album para fins didáticos  
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

#### Mas o que associa as tabelas?
A essa altura do campeonato você ja deve estar se perguntando: "tá, mas como identificamos quais dados estão ligados entre si?", e é isso que vamos ver agora, e pra isso você deve compreender o que é uma "chave primária" e uma "chave estrangeira".

#### Primary Key
A Primary key ou chave primária de uma tabela, é a coluna identificadora de cada dado da tabela, obrigatoriamente toda tabela deve ter uma chave primaria, ela não pode ser nula e deve ser única, ou seja, não pode se repetir. É a identidade de cada linha.  
volte nas tabelas acima e identifique a primary key de cada uma.

#### Foreign Key
A Foreign Key ou chave estrnageira de uma tabela, é a coluna onde vamos relacionar a quais dados essa linha pertence, deve-se especificar nessa coluna, a qual coluna e tabela que ela está relacionada.
no caso das tabelas acima a foreign key foi montada na tabela canções a partir do `album_id` e através dela, podemos identificar quais canções pertencem a quais albuns.


