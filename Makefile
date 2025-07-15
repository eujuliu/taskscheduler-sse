.PHONY: build run test clean fmt lint

BINARY_NAME=sse
OUTPUT_DIR=bin
MAIN_FILE=./cmd/app/main.go

build:
	go build -o $(OUTPUT_DIR)/$(BINARY_NAME) $(MAIN_FILE)

run:
	go run $(MAIN_FILE)

test:
	go test ./...

fmt:
	go fmt ./...

lint:
	golangci-lint run ./...

clean:
	rm -rf $(OUTPUT_DIR)
