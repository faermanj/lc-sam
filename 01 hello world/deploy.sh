CODE_BUCKET="sam.julio.cloud"
STACK_NAME="helloworld"

aws cloudformation package \
  --template-file ./template.yaml \
  --s3-bucket $CODE_BUCKET \
  --output-template-file ./target/template.yaml.out

aws cloudformation deploy \
  --template-file ./target/template.yaml.out \
  --stack-name $STACK_NAME \
  --capabilities CAPABILITY_IAM
