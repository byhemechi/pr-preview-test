package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("Requested Path:", r.URL.Path)
		fmt.Fprintf(w, "Hello, World!")
	})

	http.ListenAndServe(":8080", nil)
}
