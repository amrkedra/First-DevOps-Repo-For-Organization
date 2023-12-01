import boto3


s3 = boto3.resource('s3')

for bucket in s3.buckets.all():
    print(bucket.name)



ec2_client = boto3.client('ec2')
response = ec2_client.describe_instances()

for reservation in response['Reservations']:
    # Iterate over the instances within the reservation
    for instance in reservation['Instances']:
        # Print instance details
        print("Instance ID:", instance['InstanceId'])
        print("Instance State:", instance['State']['Name'])
        print("Instance Type:", instance['InstanceType'])
        print("Public IP:", instance.get('PublicIpAddress', 'N/A'))
        print("Private IP:", instance['PrivateIpAddress'])
        print("---")