REDIS PARTE II

--colocar elemento no come�o da lista
LPUSH ultimas_noticias "Jogador de futebol flagrado em quadra de basquete"
LPUSH ultimas_noticias "Curso de EAD na Alura"
LPUSH ultimas_noticias "Jogados de Basquete encontrado na quadra de futebol"
LPUSH ultimas_noticias "Gabriel � o m�ximo"

--noticia que entra sempre come�a com 0
quarta - 0,
terceira - 1
segunda - 2,
primeira - 3

--ver noticias
LINDEX ultimas_noticias 0 --ultima
LINDEX ultimas_noticias 1 --penultima

--tamanho da lista (total de noticias)
LLEN ultimas_noticias

--range, tudo que est� entre o 1 e 2
LRANGE ultimas_noticias 1 2

--tira da lista o que n�o quer
LTRIM ultimas_noticias 0 2

------------FILA

--adiciona na fila
RPUSH "fila:confirma-email" "guilherme@alura.com.br"
RPUSH "fila:confirma-email" "daniela@alura.com.br"
RPUSH "fila:confirma-email" "gabriel@alura.com.br"

--arranca elemento da esquerda da lista
--tira o primeiro colocado da fila
LPOP fila:confirma-email

--Para remover e recuperar o �ltimo de uma lista, utilizamos o RPOP:
RPOP "fila:confirma-email"

--------------------Busy wait e pop blocante com o blpop
--BUSY = OCUPADO
--WAIT = ESPERANDO

--Bloqueia - seta a espera
BLPOP fila:confirma-email 30

--espera para sempre (at� chegar o pr�ximo da fila)
BLPOP fila:confirma-email 0

--Existe tamb�m o da direita
BRPOP fila:confirma-email 0

------------------relacionamentos/conjuntos

--adiciona ADD set no conjunto
--n�o aceita elementos repetidos
SADD "relacionamentos:guilherme" "daniela"
SADD "relacionamentos:guilherme" "carlos"
SADD "relacionamentos:guilherme" "ana" "lucia"

--ver quantidade de elementos(cardinalidade)
SCARD "relacionamentos:guilherme"

--Mostra os elementos
SMEMBERS "relacionamentos:guilherme"

--verificar se membro faz parte do conjunto
SISMEMBER "relacionamentos:guilherme" "carlos"

--remove membro
SREM "relacionamentos:guilherme" "lucia"

--intersec��o 2 conjuntos (amigos em comum)
SINTER "relacionamentos:guilherme" "relacionamentos:carlos"

--faz a diferen�a de conjuntos (amigos diferentes) considerando o que tem no primeiro e n�o tem no segundo
SDIFF "relacionamentos:guilherme" "relacionamentos:marcela"

--compara��o inversa
SDIFF "relacionamentos:marcela" "relacionamentos:guilherme" 

--uni�o - traz todo o conjunto sem repeti��o
SUNION "relacionamentos:guilherme" "relacionamentos:marcela"


-----------RANKS

--ver tipo
TYPE "jogador:1"

--ver tudo do jogador (nome, pontos)
HGETALL "jogador:2"

--aumentar valor dentro do hash
HINCRBY "jogador:1" "pontos" 1

--HINCRBYFLOAT
HINCRBYFLOAT "jogador:1" "pontos" 10.5

--SORTEDSETADD - Adicionando conjunto ordenado
ZADD pontuacoes 50076 guilherme
ZADD pontuacoes 65532 carlos

--verificar quantidade elementos
ZCARD pontuacoes

--pontuacoes em ordem crescente
ZRANGE pontuacoes 0 3

--RANK - maior para o menor
ZREVRANGE pontuacoes 0 3

--mostra tamb�m a pontua��o
ZRANGE pontuacoes 0 3 WITHSCORES
ZREVRANGE pontuacoes 0 3 WITHSCORES

--utilizar menos para setar ultimo
ZREVRANGE pontuacoes 0 -1 WITHSCORES --(ultimo)
ZREVRANGE pontuacoes 0 -2 WITHSCORES --(penultimo)

--ver pontua��o do usu�rio
ZSCORE pontuacoes guilherme

--ver rank do usu�rio (come�a com 0) menor para maior
ZRANK pontuacoes guilherme
ZREVRANK pontuacoes guilherme (maior para menor)

--soma pontos para o usu�rio
ZINCRBY pontuacoes 50000 guilherme 

ZADD pontuacoes 50000 55
ZADD pontuacoes 30000 35
ZADD pontuacoes 300000 65
ZRANGE pontuacoes 0 -1