data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
    ]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = var.policy_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"

  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  source_arn = "arn:aws:execute-api:us-west-1:${data.aws_caller_identity.current.account_id}:${var.rest_api}/*/*"
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = aws_iam_role.iam_for_lambda.name
  role = aws_iam_role.iam_for_lambda.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "${var.policy_actions}"
        
        Effect   = "Allow"
        Resource = "${var.lambda_resource}"
      },
    ]
  })
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${var.lambda_folder}/lambda_function.py"
  output_path = "${var.lambda_folder}/lambda_function_payload.zip"
}

resource "aws_lambda_function" "lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  description   = var.lambda_description
  filename      = "${var.lambda_folder}/lambda_function_payload.zip"
  function_name = var.function_name
  role          = aws_iam_role.iam_for_lambda.arn
  timeout       = 900
  handler       = "lambda_function.lambda_handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.12"
}