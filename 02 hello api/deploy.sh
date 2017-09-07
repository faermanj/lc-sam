CODE_BUCKET="sam.julio.cloud"
STACK_NAME="helloapi"

sam package \
  --template-file ./template.yaml \
  --s3-bucket $CODE_BUCKET \
  --output-template-file ./target/template.yaml.out

sam deploy \
  --template-file ./target/template.yaml.out \
  --stack-name $STACK_NAME \
  --capabilities CAPABILITY_IAM
