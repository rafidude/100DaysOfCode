package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

type Entry struct {
	Title     string
	Author    string
	URL       string
	permalink string
}

type Feed struct {
	Data struct {
		Children []struct {
			Data Entry
		}
	}
}

func main() {
	url := "http://www.reddit.com/r/golang/new.json"
	resp, err := http.Get(url)
	if err != nil {
		fmt.Println("Error fetching:", err)
	}
	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	var entries Feed
	if err := json.Unmarshal(body, &entries); err != nil {
		fmt.Println("Error decoing JSON", err)
	}

	for _, en := range entries.Data.Children {
		entry := en.Data
		fmt.Println(entry.Title)
	}
}
