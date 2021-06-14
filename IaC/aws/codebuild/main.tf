// 
resource "aws_codebuild_project" "github" {
  name          = var.github.project_name
  build_timeout = "5"
  service_role  = aws_iam_role.github.arn

  source_version = "master"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  cache {
    type  = "LOCAL"
    modes = ["LOCAL_SOURCE_CACHE"]
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:2.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = false
  }

  source {
    type            = "GITHUB"
    location        = var.github.location
    git_clone_depth = 1
  }
}

resource "aws_iam_role" "github" {
  name = "github"

  assume_role_policy = data.aws_iam_policy_document.aws_assume_role_policy.json
}

data "aws_iam_policy_document" "aws_assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
    actions = [
      "sts:AssumeRole"
    ]
  }
}

# vim: set tabstop=2 sw=2 expandtab:
# vim: set ft=terraform:
