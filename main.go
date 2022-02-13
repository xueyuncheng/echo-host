package main

import (
	"os"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/", host)
	r.Run(":8080")
}

func host(c *gin.Context) {
	hostname, err := os.Hostname()
	if err != nil {
		c.String(500, "Error: %s", err.Error())
	}

	c.String(200, "Hostname: %s", hostname)
}
