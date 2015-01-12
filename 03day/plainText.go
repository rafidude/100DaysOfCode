package main

import (
	"net/http"
)

// curl -i localhost:3000
func main() {
	http.HandleFunc("/", foo)
	http.ListenAndServe("localhost:3000", nil)
}

func foo(rw http.ResponseWriter, req *http.Request) {
	rw.Write([]byte("OK"))
}
