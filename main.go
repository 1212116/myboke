package main

import (
	"myboke/model"
	"myboke/routes"
)

func main() {
	model.InitDb()
	routes.InitRouter()

}
