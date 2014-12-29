package main

import (
	"fmt"
)

type rect struct {
	length, width int
}

func (r *rect) area() int {
	return r.length * r.width
}

func (r *rect) perimeter() int {
	return 2 * (r.length + r.width)
}

func main() {
	rect := rect{2, 3}
	fmt.Println(rect.area(), rect.perimeter())
}
