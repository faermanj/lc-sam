FN_NAME=$(aws cloudformation describe-stack-resources \
  --stack-name $STACK_NAME \
  --query "StackResources[?starts_with(ResourceType,'AWS::Lambda::Function')].PhysicalResourceId" \
  --output text)

aws lambda invoke \
--invocation-type RequestResponse \
--function-name $FN_NAME \
--log-type Tail \
--payload file://./event.json \
--query "LogResult" \
--output text \
./target/invoke_out.txt | base64 -D

cat ./target/invoke_out.txt
