package main

import (
	"fmt"
)

func main() {
	largeNum := int64(9999999)
	index := 10001
	fmt.Println(index, GetNthPrime(largeNum, index))
}

func GetNthPrime(n int64, index int) int64 {
	var isPrime bool
	primes := make([]int64, 1)
	primes[0] = 2
	var count int
	for i := int64(3); i < n; i++ {
		isPrime = true
		for _, j := range primes {
			if i%j == 0 {
				isPrime = false
			}
		}
		if isPrime {
			count++
			primes = append(primes, i)
		}
		if count == index-1 {
			return primes[count]
		}
	}
	return primes[count]
}
