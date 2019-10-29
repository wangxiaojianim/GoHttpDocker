package main

import (
    "github.com/labstack/echo"
    "log"
    "net/http"
    "syscall"
)

func main() {
    v, ok := syscall.Getenv("TASKID")
    log.Println("Getenv", v, ok)
    e := echo.New()
    e.GET("/", handlerindex)
    log.Println("starting echo")
    err := e.Start(":8080")
    if err != nil {
        log.Fatal("echo", err)
    }
}

func handlerindex(c echo.Context) error {
    log.Println("hello world handlerindex")
    return c.JSON(http.StatusOK, `{"hello":"world"}`)
}
