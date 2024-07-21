import boto3

def disable_api_termination_for_instances(ec2, instance_ids):
    for instance_id in instance_ids:
        print(f"Disabling API termination for instance {instance_id}")
        ec2.modify_instance_attribute(InstanceId=instance_id, Attribute='disableApiTermination', Value='false')

def terminate_instances_in_region(region):
    ec2 = boto3.client('ec2', region_name=region)
    response = ec2.describe_instances(Filters=[{'Name': 'instance-state-name', 'Values': ['running', 'stopped']}])

    instances = []
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instances.append(instance['InstanceId'])

    if instances:
        disable_api_termination_for_instances(ec2, instances)
        print(f"Terminating instances in region {region}: {instances}")
        ec2.terminate_instances(InstanceIds=instances)
    else:
        print(f"No instances to terminate in region {region}")

def get_all_regions():
    ec2 = boto3.client('ec2')
    response = ec2.describe_regions()
    return [region['RegionName'] for region in response['Regions']]

def main():
    regions = get_all_regions()
    for region in regions:
        terminate_instances_in_region(region)

if __name__ == "__main__":
    main()

