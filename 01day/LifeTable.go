package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
)

func main() {
	male, female := LifeTable()
	fmt.Println(0, male[0], female[0])
	fmt.Println(1, male[1], female[1])
}

func LifeTable() ([]float64, []float64) {
	dat, err := ioutil.ReadFile("LifeTable.csv")
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
	larr := make([]string, 120)
	male := make([]float64, 120)
	female := make([]float64, 120)
	darr := strings.Split(string(dat), "\n")
	for i, v := range darr {
		larr = strings.Split(v, ",")
		male[i], _ = strconv.ParseFloat(larr[3], 64)
		female[i], _ = strconv.ParseFloat(larr[6], 64)
	}
	return male, female
}
