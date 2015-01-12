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

// url := 'http://query.yahooapis.com/v1/public/yql';
// startDate := '2012-01-01';
// endDate := '2012-01-08';
// data := url.QueryEscape('select * from yahoo.finance.historicaldata where symbol in ("YHOO","AAPL","GOOG","MSFT") and startDate = "' + startDate + '" and endDate = "' + endDate + '"');
// $.getJSON(url, 'q=' + data + "&env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json", callback);
