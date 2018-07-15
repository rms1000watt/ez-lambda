package main

import (
	"fmt"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

// Handler handles the lambda proxy request
func Handler(request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	fmt.Println("Received body: ", request.Body)

	body := "Your POST body: " + request.Body
	return events.APIGatewayProxyResponse{Body: body, StatusCode: 200}, nil
}

func main() {
	lambda.Start(Handler)
}
