package main

import (
	"./poetry"
	"fmt"
)

func main() {
	p := poetry.Poem{{"line 1", " line 2"}, {"line 3"}}
	v, c := p.Stats()
	fmt.Println(v, c)
	s, l := p.NumStanzas(), p.NumLines()
	fmt.Println(s, l)

	p, err := poetry.LoadPoemFile("poem1")
	if err != nil {
		fmt.Println(err)
	} else {
		fmt.Println(p)
	}
}
