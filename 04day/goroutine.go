package main

import (
	"fmt"
)

func f(msg string) {
	for i := 0; i < 3; i++ {
		fmt.Println(msg, i)
	}
}
func main() {
	f("direct")
	go f("goroutine")
	go func(m string) {
		fmt.Println(m)
	}("anonymous")
	var input string
	fmt.Scanln(&input)
	fmt.Println("done")
}
