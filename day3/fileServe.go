package main

import (
	"net/http"
	"path"
)

// curl -I localhost:3000
func main() {
	http.HandleFunc("/", foo)
	http.ListenAndServe("localhost:3000", nil)
}

func foo(rw http.ResponseWriter, req *http.Request) {
	fp := path.Join("images", "msft.png")
	http.ServeFile(rw, req, fp)
}
