package main

import (
	"fmt"
	"math"
)

type shape interface {
	area() float64
	perimeter() float64
}

type square struct {
	side float64
}

type circle struct {
	radius float64
}

func (s square) area() float64 {
	return s.side * s.side
}

func (s square) perimeter() float64 {
	return 4 * s.side
}

func (s circle) area() float64 {
	return math.Pi * s.radius * s.radius
}

func (s circle) perimeter() float64 {
	return 4 * s.radius
}

func printShape(s shape) {
	fmt.Println(s)
	fmt.Println(s.area())
	fmt.Println(s.perimeter())
}

func main() {
	s := square{side: 2.0}
	c := circle{radius: 3.0}
	printShape(s)
	printShape(c)
}
