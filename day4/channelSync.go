package main

import (
	"fmt"
	"time"
)

func worker(done chan bool) {
	fmt.Println("Started")
	time.Sleep(time.Second)
	fmt.Println("Done")
	done <- true
}

func main() {
	done := make(chan bool)
	go worker(done)
	<-done
}
