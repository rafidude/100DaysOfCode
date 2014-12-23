package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
)

func main() {
	ReadCSVFile("LifeTable.csv", ",")
}

// The objective of this function is to read a CSV file into memory
// Then parse each line by a separator and output data as an
// array of arrays
func ReadCSVFileMemory(fileName, separator string) [][]float64 {
	dat, err := ioutil.ReadFile(fileName)
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
