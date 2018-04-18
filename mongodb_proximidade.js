// Update com as coordenadas
db.alunos.update(
{ "_id" : ObjectId("5ad7488643912396a473d1ef") },
{
    $set : {
    localizacao : {
        endereco : "Rua Vergueiro, 3185",
        cidade : "São Paulo",
        coordinates : [-23.588213, -46.632356],
        type : "Point"
        }
    }
}
)

// Importar arquivo
mongoimport -c alunos --jsonArray < alunos.json
mongoimport -c alunos --jsonArray < alunos.json

// Buscar as pessoas mais próximas do Marcelo
db.alunos.aggregate
([{
    $geoNear:{
        "near": {
            "coordinates":[-23.588055, -46.632403],
            "type":"Point"
				},
					"distanceField": "distancia.calculada",
					"spherical": true
			}
}])

// Traz apenas os 4 primeiros
db.alunos.aggregate([{
    "$geoNear":{
        "near": {
            "coordinates":[-23.588055, -46.632403],
            "type":"Point"
},
"distanceField": "distancia.calculada",
"spherical": true,
"num":4
}
}])

// Traz os 3 primeiros (ignora registro 0)
db.alunos.aggregate([
	{
		$geoNear : {
			near : {
				coordinates : [-23.588055, -46.632403],
				type : "Point"
			},
			//armazena em
			distanceField : "distancia.calculada",
			spherical : true,
			num : 4
		}
	},
	// ignora o primeiro registro (ele mesmo)
	{ $skip : 1 }
])

// Cria indice de busca para esfera 2d
db.alunos.createIndex({
	localizacao : "2dsphere"
})




