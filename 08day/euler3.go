package main

import (
	"fmt"
)

func main() {
	primes := GeneratePrimes(100000)
	num := 600851475143
	for _, val := range primes {
		if num%val == 0 {
			fmt.Println(val)
		}
	}
}

func GeneratePrimes(n int) []int {
	var isPrime bool
	primes := make([]int, 1)
	primes[0] = 2
	var count int
	for i := 3; i < n; i++ {
		isPrime = true
		for _, j := range primes {
			if i%j == 0 {
				isPrime = false
			}
		}
		if isPrime {
			primes = append(primes, i)
		}
		count++
	}
	return primes
}
