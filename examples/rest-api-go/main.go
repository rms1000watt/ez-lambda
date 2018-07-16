package main

import (
	"fmt"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

// Handler handles the lambda proxy request
func Handler(request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	outStr := "hello world from lambda 2"

	fmt.Println(outStr)
	return events.APIGatewayProxyResponse{Body: outStr, StatusCode: 200}, nil
}

func main() {
	lambda.Start(Handler)
}
