// estrutura
cd /home/gabriel/Downloads/mongodb-linux-x86_64-rhel70-3.6.4/bin
./mongod --dbpath /home/gabriel/Documentos/cursomongodb/db


// criando coleções
db.createCollection("alunos")

// inserindo registros (*javascript)
db.alunos.insert(
{
	"nome" : "Felipe",
	"data_nascimento" : new Date(1994,02,25),
	"curso" : {
	"nome" : "Sistemas de informação"
	},
	"notas" : [10.0, 9.0, 4.5],
	"habilidades" : [
	{
	"nome" : "inglês",
	"nível" : "avançado"
	},
	{
	"nome" : "Karatê",
	"nível" : "básico"
	}
	]
	}
)

// procura pelos dados
db.alunos.find()

// remover registro
db.alunos.remove({
	"_id" : ObjectId("5ad646e0484570f1bd81c4b8")
})

// adicionar novos registros
// array utilizar [chaves]
db.alunos.insert(
{
	"nome" : "Julio",
	"data_nascimento" : new Date(1978, 09, 30),
	"curso" : {
		"nome" : "Medicina"
	},
	"habilidades" : [
	{
		"nome" : "inglês",
		"nível" : "avançado"
	}
	]
}
)

// Javascript aceita sem "aspas duplas"
db.alunos.insert(
{
	nome : "Gabriel",
	data_nascimento : new Date(1980, 10, 12),
	curso : {
		nome : "Administração"
	},
	habilidades : [
	{
		nome : "inglês",
		nível : "intermediário"
	}
	]
}
)


db.alunos.insert(
{
	nome : "José",
	data_nascimento : new Date(1984, 11, 12),
	curso : {
		nome : "Ciências"
	},
	habilidades : [
	{
		nome : "inglês",
		nível : "Avançado"
	}
	]
}
)

db.alunos.insert(
{
	nome : "Paulo",
	data_nascimento : new Date(1979, 12, 31),
	Notas : [10, 9, 7],
	curso : {
		nome : "Ciências da Computação"
		},
	habilidades : [
	{
		nome : "Inglês",
		nível : "Avançado",
	},
	{
		nome : "Francês",
		nível : "Avançado"
		
	}
	]
}
)

db.alunos.insert(
{
	nome : "Daniela",
	data_nascimento : new Date(1995, 07, 17),
	Notas : [10, 9, 7],
	curso : {
		nome : "Moda"
		},
	habilidades : [
	{
		nome : "Alemão",
		nível : "Básico",
	}
	]
}
)