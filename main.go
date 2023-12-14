package main

import (
	"context"

	"github.com/aws/aws-lambda-go/lambda"
)

func HandleRequest(ctx context.Context, name string) (string, error) {
	return "Hello " + name, nil
}

func main() {
	lambda.Start(HandleRequest)
}
