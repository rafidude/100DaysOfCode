package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	now := time.Now()
	epoch := now.Unix()

	fmt.Println("now: ", now, "epoch: ", epoch)
	fmt.Println(now.Format("Jan 02 15:04:05 2006"), now.Year())

	est, _ := time.LoadLocation("EST")
	july4 := time.Date(1776, 7, 4, 12, 15, 0, 0, est)
	fmt.Println("July 4, 1776 was a ", july4.Format("Monday"))
	normaldist()
}

func normaldist() {
	for i := 0; i < 100; i++ {
		fmt.Println(rand.NormFloat64())
	}

}
