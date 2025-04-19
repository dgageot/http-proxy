package main

import (
	"context"
	"log"
	"os"
	"os/signal"
	"syscall"

	"http-proxy/pkg"
)

func main() {
	ctx, cancel := signal.NotifyContext(context.Background(), syscall.SIGINT, syscall.SIGTERM)
	defer cancel()

	p := pkg.NewProxyServer(os.Getenv("ALLOWED_HOSTS"))
	if err := p.Run(ctx, ":8080"); err != nil {
		log.Fatalf("Failed to run proxy: %v", err)
	}
}
