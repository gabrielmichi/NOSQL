// Inserir Informação
db.alunos.insert({
	nome : "Fernando",
	data_nascimento : new Date(1994, 03, 26),
	notas : [ 10, 4.5, 7],
	curso : {
		nome : "Sistema de informação"
	}
})

// Update 
// Alterar apenas o primeiro elemento que encontrar
db.alunos.update(
{"curso.nome" : "Sistema de informação"},
	{
		$set : {
			"curso.nome" : "Sistemas de Informação"
		}
	}
)

// Alterar vários registros de uma vez (Padrao Falso)
db.alunos.update(
{"curso.nome" : "Sistemas de Informação"},
	{
		$set : {
			"curso.nome" : "Sistemas de Informação II"
		}
	}, {
		multi : true
	}
)

// Adiciona um valor no Array (PUSH)
db.alunos.update(
	{"_id" : ObjectId("5ad748cf43912396a473d1f4")},
		{
			$push : { notas : 8.5}
		}
)

// Adiciona vários valores no ARRAY
db.alunos.update(
	{"_id" : ObjectId("5ad748cf43912396a473d1f4")},
		{
			$push : 
			{ 
			notas : { $each : [8.5, 3] }
			}
		}
)

// Update em vários registros
db.alunos.update(
	{"_id" : ObjectId("5ad748c343912396a473d1f3")},
		{
			$set : {
				"nome" : "Gabriel",
				"data_nascimento" : new Date(1980, 04, 06),
				"notas"  : [10, 9 , 8.5],
				"curso.nome" : "Engenharia da Computação"
			}
		}
)


