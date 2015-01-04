package main

import (
	"fmt"
)

func main() {
	sumSq := 0
	n := 100
	for i := 1; i <= n; i++ {
		sumSq += i * i
	}
	ss := (n * (n + 1) / 2)
	ss = ss * ss

	diff := ss - sumSq
	fmt.Println(n, sumSq, ss, diff)
}
