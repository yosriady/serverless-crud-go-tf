provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "hello" {
    function_name = "hello"
    handler = "hello"
    runtime = "go1.x"
    filename = "./build/hello.zip"
    source_code_hash = "${base64sha256(file("./build/hello.zip"))}"
    role = "${aws_iam_role.lambda_exec_role.arn}"
}
  
