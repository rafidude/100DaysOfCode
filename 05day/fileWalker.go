package main

import (
	"fmt"
	"os"
	"path/filepath"
)

func main() {
	filepath.Walk("../", walkfn)
}

func walkfn(fn string, fi os.FileInfo, err error) error {
	if err != nil {
		fmt.Println("Walker Error: ", err)
		return err
	}

	if fi.IsDir() {
		fmt.Println("Directory: ", fn)
	} else {
		fmt.Println("File: ", fn)
	}
	return nil
}
