package main

import (
	"fmt"
	"github.com/ghodss/yaml"
)

type Config struct {
	Teams map[string][]string `yaml:"teams"`
}

func main() {
	var config Config
	yaml2 := `teams:
  team/t1:
    - src
    - dst
  team/t2:
    - src
    - dst
`

	err := yaml.Unmarshal([]byte(yaml2), &config)
	if err != nil {
		panic(err)g
	}

	fmt.Printf("Value: %#v\n", config)
}
