package main

import (
	"fmt"
)

type person struct {
	name string
	age  int
}

func main() {
	fmt.Println(person{"Bob", 12})
	fmt.Println(person{name: "Bob", age: 12})
	fmt.Println(person{name: "Bob"})
	fmt.Println(&person{"Bob", 12})
	s := person{"Bob", 12}
	s1 := &s
	s1.name = "Sean"
	fmt.Println(s)
}
