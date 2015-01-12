package main

import (
	"fmt"
	"time"
)

func main() {
	c1 := make(chan string)
	go func() {
		time.Sleep(time.Second * 1)
		c1 <- "done 1"
	}()
	select {
	case ret1 := <-c1:
		fmt.Println(ret1)
	case <-time.After(time.Second * 2):
		fmt.Println("Time out 1")
	}
	// c1 := make(chan string, 1)
	// go func() {
	// 	time.Sleep(time.Second * 1)
	// 	c1 <- "result 1"
	// }()

	// select {
	// case res := <-c1:
	// 	fmt.Println(res)
	// case <-time.After(time.Second * 2):
	// 	fmt.Println("timeout 1")
	// }
}
