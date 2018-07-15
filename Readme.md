# EZ Lambda

## Introduction

This is the easiest way to create AWS Lambdas using Terraform. I really love [Serverless](https://www.serverless.com) for their ease of use--but a lot of enterprises are already integrated with Terraform. So, this Terraform module is designed to be as simple to use as Serverless by using a similar naming and structure conventions as a `serverless.yml` file.

## Contents

- [Examples](#examples)
- [TODO](#todo)

## Examples

See the examples folder for a Golang function

## Limitations

Due to the strictness of Terraform (not complaining), the most straightforward, though verbose, approach to creating this module is to generate the Terraform code itself (using Jinja2). However, there are some limitations (which can be increased by running scripts in `scripts`)

- Up to 10 events per module

## TODO

- [ ] Easy module permissions for Lambda
- [ ] Docs
- [ ] Lambda: Python
- [ ] Lambda: Javascript
- [ ] Event: API Gateway
- [ ] Event: Schedule
- [ ] Event: (All others depending on community need)

