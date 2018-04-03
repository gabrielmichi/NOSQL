./redis-server
./redis-cli

--qualquer momento posso trocar valor no set
--chave / valor
set "total_de_cursos" 105 --armazena
get "total_de_cursos" --recebe
echo "estou no redis" --mensagem na tela
del "total_de_cursos" --apaga valor

--armazenando valores do sorteio
SET "ultimo_sorteio" "2, 14, 18, 30, 35, 42"
SET "penultimo_sorteio" "14, 17, 18, 25, 32, 42"
SET "antepenultimo_sorteio" "2, 17, 18, 26, 35, 43"

--pesquisa todas as chaves
KEYS * 

--criar um padrão com : (dois pontos)
SET resultado:17-05-2015:megasena "2, 15, 25, 28, 32"
SET resultado:10-05-2015:megasena "4, 16, 19, 34, 29"

--declarar multiplos resultados
MSET resultado:03-05-2015:megasena "1, 3, 17, 19, 24, 26" resultado:22-04-2015:megasena "15, 18, 20, 32, 37, 41" resultado:15-04-2015:megasena "10, 15, 18, 22, 35, 43"
MSET resultado:03-05-2015:megasena "1, 3, 17, 19, 24, 26" resultado:22-04-2015:megasena "15, 18, 20, 32, 37, 41" resultado:15-04-2015:megasena "10, 15, 18, 22, 35, 43"
MSET resultado:05-05-2015:gigasena "1, 25, 34, 67, 89, 90" resultado:15-05-2015:gigasena "2, 14, 28, 56, 78, 88" resultado:25-05-2015:gigasena "4, 17, 38, 45, 57, 68" resultado:29-05-2015:lotomania "02, 04, 05, 10, 13"

--similar comando like
--? um caracter - * um ou mais
--[] podendo colocar opções [37]
--padrão (tipo:identificador:campo:)
KEYS "resultado*"
KEYS "resultado:*-05-2015:megasena"
KEYS "resultado:1*-05-2015:megasena"
KEYS "resultado:0?-05-2015:megasena"

KEYS "resultado:?3-??-????:megasena"
KEYS "resultado:?[37]-??-????:megasena"
KEYS "resultado:1[57]-??-????:*sena"

--Hash
--Dicionário de informações

--inserir
HSET resultado:24-05-2015:megasena "numeros" "13, 17, 19, 25, 28, 32"
HSET resultado:24-05-2015:megasena "ganhadores" 23

--receber
HGET resultado:24-05-2015:megasena "numeros"
HGET resultado:24-05-2015:megasena "ganhadores"

--deletar
HDEL resultado:24-05-2015:megasena "numeros"

--armazenar multiplos valores de uma vez (HASH)
HMSET "resultado:05-06-2015:megasena" "numeros" "5, 19, 23, 28, 46, 49" "ganhadores" "16"

--recupera todos valores
HGETALL "resultado:05-06-2015:megasena"

--Expira seção
EXPIRE "sessao:usuario:11675" 1800

--Verificar o tempo que falta pra expirar
TTL "sessao:usuario:1675"

--Incrementa valor
INCR pagina:/contato:25-05-2015
INCRBY pagina:/contato:25-05-2015:valor 15 --incrementa 15
INCRBYFLOAT compras:25-05-2015:valor 22.50 --incrementa valor com mais casas decimais
INCRBYFLOAT compras:25-05-2015:valor -0.50 

--Decrementa valor
DECR pagina:/contato:25-05-2015
DECRBY compras:25-05-2015:valor 10

--armazena bit usuário (booleano 0-1)
SETBIT acesso:25-05-2015 15 1
SETBIT acesso:25-05-2015 32 1

--mostra bit
GETBIT acesso:25-05-2015 15
GETBIT acesso:25-05-2015 32

--conta a quantidade de usuários q acessaram
BITCOUNT acesso:25-05-2015

--OPERADOR "E"
BITOP AND acesso:25-e-26-06-2015 acesso:25-06-2015 acesso:26-06-2015 --GERA UMA SEQ
GETBIT acesso:25-e-26-06-2015 1
BITCOUNT acesso:25-e-26-06-2015

--OPERADOR "ou"
BITOP OR acesso:25-ou-26-06-2015 acesso:25-06-2015 acesso:26-06-2015
GETBIT acesso:25-ou-26-06-2015 1 --verificar usuário 1
GETBIT acesso:25-ou-26-06-2015 2 --verificar usuário 2
GETBIT acesso:25-ou-26-06-2015 3 --verificar usuário 3
BITCOUNT acesso:25-ou-26-06-2015
