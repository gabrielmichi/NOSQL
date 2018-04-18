// Doc
https://docs.mongodb.com/manual/reference/operator/query/

// Melhora visualização
db.alunos.find().pretty()

// Consulta filtrando o nome
db.alunos.find(
	{
		nome : "Felipe"
	}
).pretty()


// Consulta filtrando o nome
db.alunos.find(
	{
		"nome" : "Felipe",
		"habilidades.nome" : "inglês"
	}
).pretty()

// Utilizando (or)
db.alunos.find({
	$or : [
		{"curso.nome" : "Sistemas de informação"},
		{"curso.nome" : "Moda"}
	]
})

//Utiliza or/and ((sist ou moda) e Julio)
db.alunos.find({
	$or : [
		{"curso.nome" : "Sistemas de informação"},
		{"curso.nome" : "Moda"}
	],
	"nome" : "Julio"
})

// Utilizar IN
db.alunos.find({
	"curso.nome" : { $in : ["Sistemas de informação", "Engenharia Química"]}
})

//Utilizar AND
db.alunos.find({"nome": "Felipe", "data_nascimento": new Date(1994, 02, 26)})

// Procura apenas as habilidades em ingles
db.alunos.find(
{
	"habilidades.nome" : "inglês"
}
)

//Buscar todos os registros que a nota é maior que 5
// Greater than - maior que
db.alunos.find({
	notas : { $gt : 5}
}
)

//less than - menor que
db.alunos.find({
	notas : { $lt : 5}
}
)

// Apenas um registro (o primeiro)
db.alunos.findOne({
	notas : { $gt : 5}
}
)

//Orderna pelo nome A-Z / Crescente
db.alunos.find().sort({"nome" : 1})

//Ordena pelo nome Z-A
db.alunos.find().sort({"nome" : -1})

//Limita a resposta
db.alunos.find().sort({"nome" : 1}).limit(3)

// um aluno do curso de Sistemas de informação
db.alunos.find({ "curso.nome" : "Sistemas de informação"}).limit(1)