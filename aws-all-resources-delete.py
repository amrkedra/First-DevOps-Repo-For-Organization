import boto3
from botocore.exceptions import ClientError

def delete_ec2_instances(region):
    ec2 = boto3.client('ec2', region_name=region)
    response = ec2.describe_instances()
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            print(f"Terminating EC2 instance: {instance_id}")
            try:
                ec2.modify_instance_attribute(InstanceId=instance_id, Attribute='disableApiTermination', Value='false')
                ec2.terminate_instances(InstanceIds=[instance_id])
            except ClientError as e:
                print(f"Error terminating instance {instance_id}: {e}")

def delete_security_groups(region):
    ec2 = boto3.client('ec2', region_name=region)
    response = ec2.describe_security_groups()
    for sg in response['SecurityGroups']:
        sg_id = sg['GroupId']
        if sg['GroupName'] == 'default':
            continue
        print(f"Deleting Security Group: {sg_id}")
        try:
            ec2.delete_security_group(GroupId=sg_id)
        except ClientError as e:
            print(f"Error deleting security group {sg_id}: {e}")

def delete_s3_buckets():
    s3 = boto3.client('s3')
    response = s3.list_buckets()
    for bucket in response['Buckets']:
        bucket_name = bucket['Name']
        print(f"Deleting S3 bucket: {bucket_name}")
        try:
            bucket_objects = s3.list_object_versions(Bucket=bucket_name)
            for obj in bucket_objects.get('Versions', []):
                s3.delete_object(Bucket=bucket_name, Key=obj['Key'], VersionId=obj['VersionId'])
            s3.delete_bucket(Bucket=bucket_name)
        except ClientError as e:
            print(f"Error deleting bucket {bucket_name}: {e}")

def delete_iam_users():
    iam = boto3.client('iam')
    response = iam.list_users()
    for user in response['Users']:
        user_name = user['UserName']
        print(f"Deleting IAM user: {user_name}")
        try:
            iam.delete_user(UserName=user_name)
        except ClientError as e:
            print(f"Error deleting user {user_name}: {e}")

def delete_iam_roles():
    iam = boto3.client('iam')
    response = iam.list_roles()
    for role in response['Roles']:
        role_name = role['RoleName']
        print(f"Deleting IAM role: {role_name}")
        try:
            iam.delete_role(RoleName=role_name)
        except ClientError as e:
            print(f"Error deleting role {role_name}: {e}")

def delete_iam_policies():
    iam = boto3.client('iam')
    response = iam.list_policies(Scope='Local')
    for policy in response['Policies']:
        policy_arn = policy['Arn']
        print(f"Deleting IAM policy: {policy_arn}")
        try:
            iam.delete_policy(PolicyArn=policy_arn)
        except ClientError as e:
            print(f"Error deleting policy {policy_arn}: {e}")

def delete_rds_instances(region):
    rds = boto3.client('rds', region_name=region)
    response = rds.describe_db_instances()
    for db in response['DBInstances']:
        db_id = db['DBInstanceIdentifier']
        print(f"Deleting RDS instance: {db_id}")
        try:
            rds.delete_db_instance(DBInstanceIdentifier=db_id, SkipFinalSnapshot=True)
        except ClientError as e:
            print(f"Error deleting RDS instance {db_id}: {e}")

def delete_dynamodb_tables(region):
    dynamodb = boto3.client('dynamodb', region_name=region)
    response = dynamodb.list_tables()
    for table_name in response['TableNames']:
        print(f"Deleting DynamoDB table: {table_name}")
        try:
            dynamodb.delete_table(TableName=table_name)
        except ClientError as e:
            print(f"Error deleting DynamoDB table {table_name}: {e}")

def delete_lambda_functions(region):
    lambda_client = boto3.client('lambda', region_name=region)
    response = lambda_client.list_functions()
    for function in response['Functions']:
        function_name = function['FunctionName']
        print(f"Deleting Lambda function: {function_name}")
        try:
            lambda_client.delete_function(FunctionName=function_name)
        except ClientError as e:
            print(f"Error deleting Lambda function {function_name}: {e}")

def delete_cloudformation_stacks(region):
    cfn = boto3.client('cloudformation', region_name=region)
    response = cfn.describe_stacks()
    for stack in response['Stacks']:
        stack_name = stack['StackName']
        print(f"Deleting CloudFormation stack: {stack_name}")
        try:
            cfn.delete_stack(StackName=stack_name)
        except ClientError as e:
            print(f"Error deleting CloudFormation stack {stack_name}: {e}")

def get_all_regions():
    ec2 = boto3.client('ec2')
    response = ec2.describe_regions()
    return [region['RegionName'] for region in response['Regions']]

def main():
    regions = get_all_regions()
    for region in regions:
        print(f"Processing region: {region}")
        delete_ec2_instances(region)
        delete_security_groups(region)
        delete_rds_instances(region)
        delete_dynamodb_tables(region)
        delete_lambda_functions(region)
        delete_cloudformation_stacks(region)
    delete_s3_buckets()
    delete_iam_users()
    delete_iam_roles()
    delete_iam_policies()

if __name__ == "__main__":
    main()
