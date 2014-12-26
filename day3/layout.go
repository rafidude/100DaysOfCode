package main

import (
	"html/template"
	"net/http"
	"path"
)

type Profile struct {
	Name    string
	Hobbies []string
}

// curl -i localhost:3000
func main() {
	http.HandleFunc("/", foo)
	http.ListenAndServe("localhost:3000", nil)
}

func foo(rw http.ResponseWriter, req *http.Request) {
	profile := Profile{"Alex", []string{"Coding", "Mathematics"}}

	lo := path.Join("templates", "layout.html")
	fp := path.Join("templates", "index2.html")
	tmpl, err := template.ParseFiles(lo, fp)

	if err != nil {
		http.Error(rw, err.Error(), http.StatusInternalServerError)
		return
	}

	if err := tmpl.Execute(rw, profile); err != nil {
		http.Error(rw, err.Error(), http.StatusInternalServerError)
	}
}
