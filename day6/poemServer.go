package main

import (
	_ "fmt"
	"net/http"
	_ "poetry"
)

func main() {
	http.HandleFunc("/poem", poemHandler)
	http.ListenAndServe("localhost:8080", poemHandler)
}

func poemHandler(rw http.ResponseWriter, req *http.Request) {

}
