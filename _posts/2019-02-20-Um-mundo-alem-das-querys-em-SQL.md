---
title: Um mundo além das querys em SQL
date: 2019-02-20 00:00:00 Z
---


Um dos meu primeiros objetivo ao aprender Python, era poder substituir ou diminuir o uso da linguagem SQL que me acompanha a muitos anos. Vejo de tudo no meu dia a dia como analista de dados. Tudo é feito pelo banco utilizando SQL já que todos falam: "É MAIS FÁCIL USAR SQL DO QUE FAZER EM JAVA e o famoso FAZ O PROGRAMA NO BANCO QUE É MAIS RÁPIDO".

Apesar de ser uma linguagem muito útil, eu sabia que existia um outro mundo além de querys SQL, e após muito estudo descobri uma biblioteca muito poderosa chamada Pandas dentro da linguagem Python.

Não tenho a pretensão de ensinar o que é Python ou Pandas, existem diversos tutoriais na internet, inclusive na própria [documentação] do Pandas já é feito essa comparação (entre SQL e Python), mas num olhar mais técnico. Aqui seria quase um "FOR DUMMIES" em português, que servirá também para que eu possa centralizar algumas informações para consulta rápida e diminuir meus post-its no meu desktop, se for útil para alguém, ótimo.

Tentarei fazer mais posts relacionados a este, fazendo uma progressão de complexidade utilizando essa mesma fonte de dados. Já estou preparando os posts que darão exemplos de como realizar um dataquality, sobre como utilizar funções analíticas e agregadas em cima de partições ou amostras e criação de gráficos utilizando o Matplotlib.


#### **Criando estrutura do banco relacional**

Na internet existem diversas fontes que podem ser utilizadas como exemplo. Vou utilizar uma que achei bem interessante e divertida. Encontrei nesse [endereço], mas para que pudesse trabahar com o banco que tenho (Oracle) tive que alterar o nome das colunas. Esses arquivos alterados estão logo abaixo.

O primeiro arquivo contém os dados demográficos de cada herói/Vilão, bem como, de quais quadrinhos / estúdios eles são originários. [super_heroes_information.csv]

O segundo arquivo contém cada herói e o poder que ele possui. Os dados aqui são mostrados de forma booleana (TRUE/FALSE).  [super_heroes_powers.csv]

O script SQL para criação dos objetos de banco de dados serão disponibilizados nesse [script.sql]. Em posts futuros planejo trabalhar também com o banco de dados através de bibliotecas como a do Oracle (cx_Oracle), mas agora será somente acesso a arquivos.

Após a criação das tabelas, basta importar o arquivo .CSV utilizando qualquer procedimento de ETL ou ferramenta, como por exemplo, o SQL Developer.

#### **Acessando um arquivo CSV pelo Python e Pandas**

Próximo passo é testar o acesso aos arquivos pelo python/pandas.

Primeiramente importar a biblioteca do pandas.

{% highlight python %}
# Python:
import pandas as pd
{% endhighlight %}

Logo após, criar uma variável que irá receber o resultado do método que transforma o .csv em um objeto do tipo dataframe


{% highlight python %}
# Python:
df_origem = pd.read_csv('C:/files/super_heroes_information.csv', sep=',', encoding='ISO-8859-1')
{% endhighlight %}

Propriedades utilizadas no método read_csv:

*Sep* vai dizer qual o separador de colunas que o arquivo possui.

*Enconding* para conseguir trabalhar com arquivos que possuam caracteres especiais ou acentos.

Partirei agora para alguns exemplos convertendo do SQL para o Python


#### **SELECT**

{% highlight sql %}
-- SQL:
-- Retornar todas as informações da tabela super_heroes_information
Select * from super_heroes_information; 
{% endhighlight %}

{% highlight python %}
# Python:
df_origem
{% endhighlight %}

![Imagem1.PNG]({{site.baseurl}}/assets/images/20190220/Imagem1.PNG)

{% highlight sql %}
-- SQL:
-- Retornar apenas 3 colunas da tabela 
Select id, name, Gender from super_heroes_information; super_heroes_information)
{% endhighlight %}

{% highlight python %}
# Python:
df_origem[['id','name','Gender']]
{% endhighlight %}

![Imagem2.PNG]({{site.baseurl}}/assets/images/20190220/Imagem2.PNG)


{% highlight sql %}
-- SQL:
-- Retornar os primeiros 10 registros da tabela super_heroes_information
Select * from super_heroes_information where rownum <= 10; 
{% endhighlight %}

{% highlight python %}
# Python:
df_origem.head(10)
{% endhighlight %}

![Imagem3.PNG]({{site.baseurl}}/assets/images/20190220/Imagem3.PNG)

{% highlight sql %}
-- SQL:
-- Trazer os 10 registros e apresentar somente 3 colunas
Select id, name, Gender from super_heroes_information where rownum <= 10; 
{% endhighlight %}

{% highlight python %}
# Python:
df_origem[['id','name','Gender']].head(10)
{% endhighlight %}

![Imagem4.PNG]({{site.baseurl}}/assets/images/20190220/Imagem4.PNG)

#### **WHERE**

{% highlight sql %}
-- SQL:
-- Retorna somente o grupo X-man
Select * from super_heroes_information where name = 'X-Man'; 
{% endhighlight %}

{% highlight python %}
# Python:
df_origem[df_origem['name']=='X-Man']
{% endhighlight %}

![Imagem5.PNG]({{site.baseurl}}/assets/images/20190220/Imagem5.PNG)

{% highlight sql %}
-- SQL:
-- Traz somente uma coluna
Select name from super_heroes_information where name = 'X-Man'; 
{% endhighlight %}

{% highlight python %}
# Python:
df_origem[['name']][df_origem['name']=='X-Man']
{% endhighlight %}

![Imagem6.PNG]({{site.baseurl}}/assets/images/20190220/Imagem6.PNG)

{% highlight sql %} 
-- SQL:
-- Retorna todas as heroínas do universo DC
Select * from super_heroes_information where Publisher = 'DC Comics' and Gender = 'Female'; 
{% endhighlight %}

{% highlight python %}
# Python:
df_origem[(df_origem['Publisher']=='DC Comics') & (df_origem['Gender']=='Female')]
{% endhighlight %}

![Imagem7.PNG]({{site.baseurl}}/assets/images/20190220/Imagem7.PNG)

{% highlight sql %} 
-- SQL:
-- Traz somente somente uma coluna
Select name from super_heroes_information where Publisher = 'DC Comics' and Gender = 'Female'; 
{% endhighlight %}

{% highlight python %}
# Python:
df_origem[['name']][df_origem['name']=='X-Man']
{% endhighlight %}

![Imagem8.PNG]({{site.baseurl}}/assets/images/20190220/Imagem8.PNG)

#### **ORDER BY**

{% highlight sql %} 
-- SQL:
-- Ordena os hérois por nome
Select * from super_heroes_information order by name;
{% endhighlight %}

{% highlight python %}
# Python:
df_origem.sort_values(['name'])
{% endhighlight %}

![Imagem9.PNG]({{site.baseurl}}/assets/images/20190220/Imagem9.PNG)

{% highlight sql %} 
-- SQL:
-- Traz somente a coluna nome e fonte de publicação, ordenando por fonte de publicação e nome
Select name, Publisher from super_heroes_information order by Publisher, name; 
{% endhighlight %}

{% highlight python %}
# Python:
df_origem[['name','Publisher']].sort_values(['Publisher','name'])
{% endhighlight %}

![Imagem10.PNG]({{site.baseurl}}/assets/images/20190220/Imagem10.PNG)

#### **GROUP BY**

{% highlight sql %} 
-- SQL: 
-- Retorna quantos registros cada fonte de publicação possui
Select gender, eye_color from super_heroes_information group by gender, eye_color;
{% endhighlight %}

{% highlight python %}
# Python:
df_origem.groupby(['Publisher']).size()
{% endhighlight %}

![Imagem11.PNG]({{site.baseurl}}/assets/images/20190220/Imagem11.PNG)

#### **JOIN**

{% highlight sql %} 
-- SQL:
-- Retorna todas as informações dos heróis e seus poderes
select * from super_heroes_information info inner join super_heroes_powers powers on info.name = powers.hero_names; 
{% endhighlight %}

Nesse caso será necessário acessar o outro arquivo.
Primeiramente acessar o arquivo contendo as informações.

{% highlight python %}
# Python:
df_informacoes = pd.read_csv('C:/files/super_heroes_information.csv', sep=',', encoding='ISO-8859-1')
{% endhighlight %}

E logo em seguida acessar os dados contendo os poderes.

{% highlight python %}
# Python:
df_poderes = pd.read_csv('C:/files/super_heroes_powers.csv', sep=',', encoding='ISO-8859-1')
{% endhighlight %}

Agora poderá utilizar o merge para ligar as duas fontes de informação. O nome das colunas é diferentes, portanto deverá ser informado nas propriedades left_on e right_on o nome das colunas que fazem a ligação das duas fontes.

{% highlight python %}
# Python:
pd.merge(df_informacoes, df_poderes, left_on=['name'], right_on=['hero_names'])
{% endhighlight %}

![Imagem12.PNG]({{site.baseurl}}/assets/images/20190220/Imagem12.PNG)

#### **UNION**

Para simular um union quebro o dataframe de informação em 2, um com heróis do sexo masculino e outra com o sexo feminino. 

{% highlight python %}
# Python:
df_origem = pd.read_csv('C:/files/super_heroes_information.csv', sep=',', encoding='ISO-8859-1')
df_masculino = df_origem[df_origem['Gender'] == 'Male'].head(5)
df_feminino = df_origem[df_origem['Gender'] == 'Female'].head(5)
df_union = pd.concat([df_masculino, df_feminino])
df_union
{% endhighlight %}

![Imagem13.PNG]({{site.baseurl}}/assets/images/20190220/Imagem13.PNG)

[endereço]: https://www.kaggle.com/claudiodavi/superhero-set
[super_heroes_information.csv]: /assets/files/super_heroes_information.csv
[super_heroes_powers.csv]: /assets/files/super_heroes_powers.csv
[script.sql]: /assets/files/2010-02-20-analogia-sql-python_bd.sql
[documentação]: https://pandas.pydata.org/
