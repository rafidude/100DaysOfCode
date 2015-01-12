package main

import (
	"flag"
	"fmt"
	"os"
)

var str string
var num int
var help bool

func main() {
	num_args := len(os.Args)
	if num_args < 2 {
		fmt.Println(">> No args passed in")
	}

	flag.StringVar(&str, "str", "default value", "text description")
	flag.IntVar(&num, "num", 5, "number of connections")
	flag.BoolVar(&help, "help", false, "Display help")
	flag.Parse()

	if help {
		fmt.Println(">> Display help screen")
		os.Exit(1)
	}

	fmt.Println(">> String:", str)
	fmt.Println(">> Last Item:", num)
	fmt.Println(">> Help:", help)
	fmt.Println(">> Last Item:", os.Args[num_args-1])
}

// $ go run command-line-args.go --str=Foo --num=8 filename
// $ go run command-line-args.go --help
