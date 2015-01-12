package main

import (
	"encoding/xml"
	"net/http"
)

type Profile struct {
	Name    string
	Hobbies []string `xml:"Hobbies>Hobby"`
}

// curl -i localhost:3000
func main() {
	http.HandleFunc("/", foo)
	http.ListenAndServe("localhost:3000", nil)
}

func foo(rw http.ResponseWriter, req *http.Request) {
	profile := Profile{"Alex", []string{"Coding", "Mathematics"}}

	xmlv, err := xml.MarshalIndent(profile, "", "  ")
	if err != nil {
		http.Error(rw, err.Error(), http.StatusInternalServerError)
		return
	}

	rw.Header().Set("Content-Type", "application/xml")
	rw.Write(xmlv)
}
