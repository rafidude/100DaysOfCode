package main

import (
	"fmt"
	"strconv"
)

func main() {
	var prod, i, j, max int64
	for i = 0; i <= 999; i++ {
		for j = 0; j <= 999; j++ {
			prod = i * j
			if isPalindrome(prod) {
				if prod > max {
					max = prod
					fmt.Println(i, j, prod)
				}
			}
		}
	}
}

func isPalindrome(prod int64) bool {
	p := strconv.FormatInt(prod, 10)
	l := len(p)
	if l < 2 {
		return false
	}
	for k := 0; k < (l+1)/2; k++ {
		if p[k] != p[l-k-1] {
			return false
		}
	}
	return true
}
