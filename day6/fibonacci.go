package main

import "fmt"

// Euler #2: By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
func main() {
	i, j := 1, 2
	sum := j
	for {
		i, j = j, i+j
		if j < 4000000 && j%2 == 0 {
			sum += j
		}
		if j >= 4000000 {
			break
		}
	}
	fmt.Println(sum)
}
