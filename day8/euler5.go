package main

import (
	"fmt"
)

func main() {
	fmt.Println(smallestDiv(9999999999, 20))
}

func smallestDiv(num int64, upto int64) int64 {
	for i := upto; i < num; i = i + upto {
		for j := int64(2); j < upto; j++ {
			if i%j != 0 {
				break
			}
			if j == upto-1 {
				return i
			}
		}
	}
	return 0
}
