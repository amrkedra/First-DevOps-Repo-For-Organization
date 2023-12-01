provider "local" {
  # Configuration options
}

resource "local_sensitive_file" "aws-cred"{
    content = <<EOF
    key_name = AKIA2TSBJY223SE3ODZO 
    secret_key = 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
    EOF
    filename = "./aws-cred.txt"
}