resource "aws_iam_role" "role" {
  name               = "ROL_${var.policy_name}"
  assume_role_policy = var.assume_role
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = var.policy_name
  role = aws_iam_role.role.id

  policy = var.policy
}
