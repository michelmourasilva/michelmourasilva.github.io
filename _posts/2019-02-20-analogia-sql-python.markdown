---
layout: post
title:  "Fazendo analogia ao SQL ao utilizar Pandas"
date:   2019-02-20 19:01:00
categories: Python, Pandas, SQL
published: true
---

## Fazendo analogia ao SQL ao utilizar Pandas

Uma das minhas primeiras dificuldades quando estava aprendendo Python, foi como que eu poderia aplicar as consultas que eu já dominava no SQL utilizando python. 

Após muita procura, seja utilizando Google que geralmente me apontava para o Stack Overflow, fui aprendendo aos poucos como poderia navegar dentro de um data set.

Não vou chegar a ensinar o que é Python ou Pandas, pois sei que já existe diversos tutoriais e video aulas muito mais explicativas, inclusive na própria documentação do pandas já é feito essa analogia. Esse post na verdade é muito mais pra que eu possa fazer uma consulta rápida, mas se for útil para alguém, ótimo.

Tentarei fazer mais posts relacionados a este, fazendo uma progressão de complexidade utilizando essas fontes de informação, como por exemplo realizar limpezas de dados, utilizar funções analiticas e agregadas em cima de partições ou amostras, criação de gráficos utilizando o Matplotlib e até aonde minha imaginação mandar.


#### **Criando estrutura do banco relacional**
Na internet existe diversas fontes que podem ser utilizadas como exemplo. Vou utilizar uma que achei bem interessante e divertida. Encontrei nesse [endereço], mas tive que alterar o nome das colunas para poder importar corretamente no Oracle.

O primeiro arquivo contém os dados demográficos de cada herói/Vilão, bem como de quais quadrinhos / estúdios eles são originários. [super_heroes_information.csv]

O segundo arquivo contém cada herói e o poder que ele possui. Os dados aqui são mostrados de forma booleana (TRUE/FALSE).  [super_heroes_powers.csv]

Abaixo está o script para criar uma tabela com a mesma estrutura que o arquivo CSV.

{% highlight sql %}
CREATE TABLE SUPER_HEROES_INFORMATION
(
  ID NUMBER(14) -- Identificador autonumérico
, NAME VARCHAR2(25 BYTE) -- O nome ou alias do super héroi
, GENDER VARCHAR2(6 BYTE) -- Gênero do super héroi
, EYE_COLOR VARCHAR2(23 BYTE) -- Cor do olho
, RACE VARCHAR2(18 BYTE)  -- Raça
, HAIR_COLOR VARCHAR2(16 BYTE)  -- Cor do cabelo
, HEIGHT VARCHAR2(5 BYTE)  -- Medida em cêntimetros 
, PUBLISHER VARCHAR2(17 BYTE) -- Editora de publicação
, SKIN_COLOR VARCHAR2(14 BYTE) -- Cor da pele
, ALIGNMENT VARCHAR2(7 BYTE)  -- Indica o comportamento do Heroi/Vilão
, WEIGHT VARCHAR2(5 BYTE) -- The weight measured in pound
);

CREATE TABLE SUPER_HEROES_POWERS 
(
  HERO_NAMES VARCHAR2(25 BYTE) 
, AGILITY VARCHAR2(5 BYTE) 
, ACCELERATED_HEALING VARCHAR2(5 BYTE) 
, LANTERN_POWER_RING VARCHAR2(5 BYTE) 
, DIMENSIONAL_AWARENESS VARCHAR2(5 BYTE) 
, COLD_RESISTANCE VARCHAR2(5 BYTE) 
, DURABILITY VARCHAR2(5 BYTE) 
, STEALTH VARCHAR2(5 BYTE) 
, ENERGY_ABSORPTION VARCHAR2(5 BYTE) 
, FLIGHT VARCHAR2(5 BYTE) 
, DANGER_SENSE VARCHAR2(5 BYTE) 
, UNDERWATER_BREATHING VARCHAR2(5 BYTE) 
, MARKSMANSHIP VARCHAR2(5 BYTE) 
, WEAPONS_MASTER VARCHAR2(5 BYTE) 
, POWER_AUGMENTATION VARCHAR2(5 BYTE) 
, ANIMAL_ATTRIBUTES VARCHAR2(5 BYTE) 
, LONGEVITY VARCHAR2(5 BYTE) 
, INTELLIGENCE VARCHAR2(5 BYTE) 
, SUPER_STRENGTH VARCHAR2(5 BYTE) 
, CRYOKINESIS VARCHAR2(5 BYTE) 
, TELEPATHY VARCHAR2(5 BYTE) 
, ENERGY_ARMOR VARCHAR2(5 BYTE) 
, ENERGY_BLASTS VARCHAR2(5 BYTE) 
, DUPLICATION VARCHAR2(5 BYTE) 
, SIZE_CHANGING VARCHAR2(5 BYTE) 
, DENSITY_CONTROL VARCHAR2(5 BYTE) 
, STAMINA VARCHAR2(5 BYTE) 
, ASTRAL_TRAVEL VARCHAR2(5 BYTE) 
, AUDIO_CONTROL VARCHAR2(5 BYTE) 
, DEXTERITY VARCHAR2(5 BYTE) 
, OMNITRIX VARCHAR2(5 BYTE) 
, SUPER_SPEED VARCHAR2(5 BYTE) 
, POSSESSION VARCHAR2(5 BYTE) 
, ANIMAL_ORIENTED_POWERS VARCHAR2(5 BYTE) 
, WEAPON_BASED_POWERS VARCHAR2(5 BYTE) 
, ELECTROKINESIS VARCHAR2(5 BYTE) 
, DARKFORCE_MANIPULATION VARCHAR2(5 BYTE) 
, DEATH_TOUCH VARCHAR2(5 BYTE) 
, TELEPORTATION VARCHAR2(5 BYTE) 
, ENHANCED_SENSES VARCHAR2(5 BYTE) 
, TELEKINESIS VARCHAR2(5 BYTE) 
, ENERGY_BEAMS VARCHAR2(5 BYTE) 
, MAGIC VARCHAR2(5 BYTE) 
, HYPERKINESIS VARCHAR2(5 BYTE) 
, JUMP VARCHAR2(5 BYTE) 
, CLAIRVOYANCE VARCHAR2(5 BYTE) 
, DIMENSIONAL_TRAVEL VARCHAR2(5 BYTE) 
, POWER_SENSE VARCHAR2(5 BYTE) 
, SHAPESHIFTING VARCHAR2(5 BYTE) 
, PEAK_HUMAN_CONDITION VARCHAR2(5 BYTE) 
, IMMORTALITY VARCHAR2(5 BYTE) 
, CAMOUFLAGE VARCHAR2(5 BYTE) 
, ELEMENT_CONTROL VARCHAR2(5 BYTE) 
, PHASING VARCHAR2(5 BYTE) 
, ASTRAL_PROJECTION VARCHAR2(5 BYTE) 
, ELECTRICAL_TRANSPORT VARCHAR2(5 BYTE) 
, FIRE_CONTROL VARCHAR2(5 BYTE) 
, PROJECTION VARCHAR2(5 BYTE) 
, SUMMONING VARCHAR2(5 BYTE) 
, ENHANCED_MEMORY VARCHAR2(5 BYTE) 
, REFLEXES VARCHAR2(5 BYTE) 
, INVULNERABILITY VARCHAR2(5 BYTE) 
, ENERGY_CONSTRUCTS VARCHAR2(5 BYTE) 
, FORCE_FIELDS VARCHAR2(5 BYTE) 
, SELF_SUSTENANCE VARCHAR2(5 BYTE) 
, ANTI_GRAVITY VARCHAR2(5 BYTE) 
, EMPATHY VARCHAR2(5 BYTE) 
, POWER_NULLIFIER VARCHAR2(5 BYTE) 
, RADIATION_CONTROL VARCHAR2(5 BYTE) 
, PSIONIC_POWERS VARCHAR2(5 BYTE) 
, ELASTICITY VARCHAR2(5 BYTE) 
, SUBSTANCE_SECRETION VARCHAR2(5 BYTE) 
, ELEMENTAL_TRANSMOGRIFICATION VARCHAR2(5 BYTE) 
, TECHNOPATH_CYBERPATH VARCHAR2(5 BYTE) 
, PHOTOGRAPHIC_REFLEXES VARCHAR2(5 BYTE) 
, SEISMIC_POWER VARCHAR2(5 BYTE) 
, ANIMATION VARCHAR2(5 BYTE) 
, PRECOGNITION VARCHAR2(5 BYTE) 
, MIND_CONTROL VARCHAR2(5 BYTE) 
, FIRE_RESISTANCE VARCHAR2(5 BYTE) 
, POWER_ABSORPTION VARCHAR2(5 BYTE) 
, ENHANCED_HEARING VARCHAR2(5 BYTE) 
, NOVA_FORCE VARCHAR2(5 BYTE) 
, INSANITY VARCHAR2(5 BYTE) 
, HYPNOKINESIS VARCHAR2(5 BYTE) 
, ANIMAL_CONTROL VARCHAR2(5 BYTE) 
, NATURAL_ARMOR VARCHAR2(5 BYTE) 
, INTANGIBILITY VARCHAR2(5 BYTE) 
, ENHANCED_SIGHT VARCHAR2(5 BYTE) 
, MOLECULAR_MANIPULATION VARCHAR2(5 BYTE) 
, HEAT_GENERATION VARCHAR2(5 BYTE) 
, ADAPTATION VARCHAR2(5 BYTE) 
, GLIDING VARCHAR2(5 BYTE) 
, POWER_SUIT VARCHAR2(5 BYTE) 
, MIND_BLAST VARCHAR2(5 BYTE) 
, PROBABILITY_MANIPULATION VARCHAR2(5 BYTE) 
, GRAVITY_CONTROL VARCHAR2(5 BYTE) 
, REGENERATION VARCHAR2(5 BYTE) 
, LIGHT_CONTROL VARCHAR2(5 BYTE) 
, ECHOLOCATION VARCHAR2(5 BYTE) 
, LEVITATION VARCHAR2(5 BYTE) 
, TOXIN_AND_DISEASE_CONTROL VARCHAR2(5 BYTE) 
, BANISH VARCHAR2(5 BYTE) 
, ENERGY_MANIPULATION VARCHAR2(5 BYTE) 
, HEAT_RESISTANCE VARCHAR2(5 BYTE) 
, NATURAL_WEAPONS VARCHAR2(5 BYTE) 
, TIME_TRAVEL VARCHAR2(5 BYTE) 
, ENHANCED_SMELL VARCHAR2(5 BYTE) 
, ILLUSIONS VARCHAR2(5 BYTE) 
, THIRSTOKINESIS VARCHAR2(5 BYTE) 
, HAIR_MANIPULATION VARCHAR2(5 BYTE) 
, ILLUMINATION VARCHAR2(5 BYTE) 
, OMNIPOTENT VARCHAR2(5 BYTE) 
, CLOAKING VARCHAR2(5 BYTE) 
, CHANGING_ARMOR VARCHAR2(5 BYTE) 
, POWER_COSMIC VARCHAR2(5 BYTE) 
, BIOKINESIS VARCHAR2(5 BYTE) 
, WATER_CONTROL VARCHAR2(5 BYTE) 
, RADIATION_IMMUNITY VARCHAR2(5 BYTE) 
, VISION_TELESCOPIC VARCHAR2(5 BYTE) 
, TOXIN_AND_DISEASE_RESISTANCE VARCHAR2(5 BYTE) 
, SPATIAL_AWARENESS VARCHAR2(5 BYTE) 
, ENERGY_RESISTANCE VARCHAR2(5 BYTE) 
, TELEPATHY_RESISTANCE VARCHAR2(5 BYTE) 
, MOLECULAR_COMBUSTION VARCHAR2(5 BYTE) 
, OMNILINGUALISM VARCHAR2(5 BYTE) 
, PORTAL_CREATION VARCHAR2(5 BYTE) 
, MAGNETISM VARCHAR2(5 BYTE) 
, MIND_CONTROL_RESISTANCE VARCHAR2(5 BYTE) 
, PLANT_CONTROL VARCHAR2(5 BYTE) 
, SONAR VARCHAR2(5 BYTE) 
, SONIC_SCREAM VARCHAR2(5 BYTE) 
, TIME_MANIPULATION VARCHAR2(5 BYTE) 
, ENHANCED_TOUCH VARCHAR2(5 BYTE) 
, MAGIC_RESISTANCE VARCHAR2(5 BYTE) 
, INVISIBILITY VARCHAR2(5 BYTE) 
, SUB_MARINER VARCHAR2(5 BYTE) 
, RADIATION_ABSORPTION VARCHAR2(5 BYTE) 
, INTUITIVE_APTITUDE VARCHAR2(5 BYTE) 
, VISION_MICROSCOPIC VARCHAR2(5 BYTE) 
, MELTING VARCHAR2(5 BYTE) 
, WIND_CONTROL VARCHAR2(5 BYTE) 
, SUPER_BREATH VARCHAR2(5 BYTE) 
, WALLCRAWLING VARCHAR2(5 BYTE) 
, VISION_NIGHT VARCHAR2(5 BYTE) 
, VISION_INFRARED VARCHAR2(5 BYTE) 
, GRIM_REAPING VARCHAR2(5 BYTE) 
, MATTER_ABSORPTION VARCHAR2(5 BYTE) 
, THE_FORCE VARCHAR2(5 BYTE) 
, RESURRECTION VARCHAR2(5 BYTE) 
, TERRAKINESIS VARCHAR2(5 BYTE) 
, VISION_HEAT VARCHAR2(5 BYTE) 
, VITAKINESIS VARCHAR2(5 BYTE) 
, RADAR_SENSE VARCHAR2(5 BYTE) 
, QWARDIAN_POWER_RING VARCHAR2(5 BYTE) 
, WEATHER_CONTROL VARCHAR2(5 BYTE) 
, VISION_X_RAY VARCHAR2(5 BYTE) 
, VISION_THERMAL VARCHAR2(5 BYTE) 
, WEB_CREATION VARCHAR2(5 BYTE) 
, REALITY_WARPING VARCHAR2(5 BYTE) 
, ODIN_FORCE VARCHAR2(5 BYTE) 
, SYMBIOTE_COSTUME VARCHAR2(5 BYTE) 
, SPEED_FORCE VARCHAR2(5 BYTE) 
, PHOENIX_FORCE VARCHAR2(5 BYTE) 
, MOLECULAR_DISSIPATION VARCHAR2(5 BYTE) 
, VISION_CRYO VARCHAR2(5 BYTE) 
, OMNIPRESENT VARCHAR2(5 BYTE) 
, OMNISCIENT VARCHAR2(5 BYTE) 
);

{% endhighlight %}

Após a criação das tabelas, basta importar o arquivo csv utilizando qualquer procedimento de ETL ou ferramenta como por exemplo o SQL Developer.

#### **Acessando um arquivo CSV pelo Python e Pandas**

Próximo passo é testar o acesso aos arquivos pelo python/pandas.

Primeiramente importar a bliblioteca do pandas.

{% highlight python linenos %}
	import pandas as pd
{% endhighlight %}

Logo após, criar uma variável que irá receber o o resultado do método que transforma o csv em um objeto do tipo dataframe

{% highlight python linenos %}
	df_origem = pd.read_csv('C:/files/super_heroes_information.csv', sep=',', encoding='ISO-8859-1')
{% endhighlight %}

Como pode-se ver, utilizei algumas propriedades juntamente com o método. 
*Sep* vai dizer qual o separador de colunas que o arquivo possui.
*Enconding* para conseguir trabalhar com arquivos que possuam caracteres especiais ou acentos.

#### **Primeiras consultas**

#### **SELECT**

**1. Select * from super_heroes_information;** *(Retornar todas as informações da tabela super_heroes_information)*
Para uma simples consulta basta chamar o dataframe
{% highlight python linenos %}
	df_origem
{% endhighlight %}

![](/assets/images/20190220/Imagem1.png)

**2. Select id, name, Gender from super_heroes_information;** *(Retornar apenas 3 colunas da tabela super_heroes_information)*
Para realizar um select de todos os registros porém informando apenas algumas colunas:
{% highlight python linenos %}
	df_origem[['id','name','Gender']]
{% endhighlight %}

![](/assets/images/20190220/Imagem2.png)

**3. Select * from super_heroes_information where rownum <= 10;** *(Retornar os primeiros 10 registros da tabela super_heroes_information)*
Trazer as 10 primeiras linhas:
{% highlight python linenos %}
	df_origem.head(10)
{% endhighlight %}

![](/assets/images/20190220/Imagem3.png)

ou **Select id, name, Gender from super_heroes_information where rownum <= 10;** *(trazer os 10 registros e apresentar somente 3 colunas)*
{% highlight python linenos %}
	df_origem[['id','name','Gender']].head(10)
{% endhighlight %}

![](/assets/images/20190220/Imagem4.png)

#### **WHERE**

**4. Select * from super_heroes_information where name = 'X-Man';** *(Retornar somente o grupo X-man)*
{% highlight python linenos %}
	df_origem[df_origem['name']=='X-Man']
{% endhighlight %}

![](/assets/images/20190220/Imagem5.png)

ou **Select name from super_heroes_information where name = 'X-Man';** (trazendo somente uma coluna)
{% highlight python linenos %}
	df_origem[['name']][df_origem['name']=='X-Man']
{% endhighlight %}

![](/assets/images/20190220/Imagem6.png)

**5. Select * from super_heroes_information where Publisher = 'DC Comics' and Gender = 'Female';** *(Retornar todas as heroínas do universo DC)*
{% highlight python linenos %}
	df_origem[(df_origem['Publisher']=='DC Comics') & (df_origem['Gender']=='Female')]
{% endhighlight %}

![](/assets/images/20190220/Imagem7.png)

ou **Select name from super_heroes_information where Publisher = 'DC Comics' and Gender = 'Female';** *(trazendo somente somente uma coluna)*
{% highlight python linenos %}
	df_origem[['name']][df_origem['name']=='X-Man']
{% endhighlight %}

![](/assets/images/20190220/Imagem8.png)

#### **ORDER BY**

**6. Select * from super_heroes_information order by name;** *(Ordenar os hérois por nome)*
{% highlight python linenos %}
	df_origem.sort_values(['name'])
{% endhighlight %}

![](/assets/images/20190220/Imagem9.png)

ou **Select name, Publisher from super_heroes_information order by Publisher, name;** *(trazendo somente a coluna nome e fonte de publicação, ordenando por fonte de publicação e nome)*
{% highlight python linenos %}
	df_origem[['name','Publisher']].sort_values(['Publisher','name'])
{% endhighlight %}

![](/assets/images/20190220/Imagem10.png)

#### **GROUP BY**

**7. Select gender, eye_color from super_heroes_information group by gender, eye_color ** *(Retornar quantos registros cada fonte de publicação possui)*
{% highlight python linenos %}
	df_origem.groupby(['Publisher']).size()
{% endhighlight %}

![](/assets/images/20190220/Imagem11.png)

#### **JOIN**

**8. select * from super_heroes_information info inner join super_heroes_powers powers on info.name = powers.hero_names ** *(Retornar todas as informações dos heróis e seus poderes)*
Nesse caso será necessário acessar o outro arquivo.
Primeiramente acessar o arquivo contendo as informações
{% highlight python linenos %}
df_informacoes = pd.read_csv('C:/files/super_heroes_information.csv', sep=',', encoding='ISO-8859-1')
{% endhighlight %}
E logo em seguida acessar os dados contendo os poderes
{% highlight python linenos %}
df_poderes = pd.read_csv('C:/files/super_heroes_powers.csv', sep=',', encoding='ISO-8859-1')
{% endhighlight %}
Agora poderá utilizar o merge para ligar as duas fontes de informação. O nome das colunas são diferentes, portanto deverá ser informado nas propriedades left_on e right_on o nome das colunas que fazem a ligação das duas fontes.
{% highlight python linenos %}
pd.merge(df_informacoes, df_poderes, left_on=['name'], right_on=['hero_names'])
{% endhighlight %}

![](/assets/images/20190220/Imagem12.png)

#### **UNION**

Para poder simular um union irei quebrar o dataframe de informação em 2, um com hérois do sexo masculino e outra com o sexo feminino. Poderia ser utilizado o exemplo mostrado na seção WHERE, porém irei utilizar o método isin para mudar um pouco.
{% highlight python linenos %}
df_origem = pd.read_csv('C:/files/super_heroes_information.csv', sep=',', encoding='ISO-8859-1')
df_masculino = df_origem[df_origem['Gender'].isin(['Male'])].head(5)
df_feminino = df_origem[df_origem['Gender'].isin(['Female'])].head(5)
df_union = pd.concat([df_masculino, df_feminino])
df_union
{% endhighlight %}

![](/assets/images/20190220/Imagem13.png)

[endereço]: https://www.kaggle.com/claudiodavi/superhero-set
[super_heroes_information.csv]: /assets/files/super_heroes_information.csv
[super_heroes_powers.csv]: /assets/files/super_heroes_powers.csv
