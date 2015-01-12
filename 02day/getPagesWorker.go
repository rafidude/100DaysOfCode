package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

func getPage(url string) (int, error) {
	resp, err := http.Get(url)
	if err != nil {
		return 0, err
	}
	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return 0, err
	}

	return len(body), nil
}

func worker(urlCh chan string, infoCh chan string) {
	url := <-urlCh
	length, err := getPage(url)
	if err == nil {
		infoCh <- fmt.Sprintf("%s has length %d", url, length)
	}
}

func main() {
	urlCh := make(chan string)
	sizeCh := make(chan string)

	for i := 0; i < 10; i++ {
		go worker(urlCh, sizeCh)
	}

	urls := []string{"http://www.google.com",
		"http://www.bing.com", "http://www.yahoo.com"}

	for _, url := range urls {
		urlCh <- url
	}

	for i := 0; i < len(urls); i++ {
		fmt.Println(<-sizeCh)
	}
}
