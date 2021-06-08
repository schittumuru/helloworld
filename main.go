package main

import (
	"flag"
	"fmt"

	greetings "github.com/schittumuru/gogreetings/greetings"
)

func main() {

	message := greetings.HelloRandom()
	fmt.Println(message)

	var stringVar string
	flag.StringVar(&stringVar, "customName", "DefaultName", "Please enter the name of the user!")
	flag.Parse()

	fmt.Printf("User logged in is :%s", stringVar)
}
