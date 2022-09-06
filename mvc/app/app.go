package app

import (
	"github.com/rafodelmal/go_api/mvc/controllers"
	"net/http"
)

func StartApp() {
	http.HandleFunc("/users", controllers.GetUser)
	http.HandleFunc("/users_two", controllers.GetUserTwo)

	if err := http.ListenAndServe(":80", nil); err != nil {
		panic(err)
	}
}
