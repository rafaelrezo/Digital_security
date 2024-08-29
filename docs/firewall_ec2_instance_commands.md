# API call: RunInstances

```json
{
  "MaxCount": 1,
  "MinCount": 1,
  "ImageId": "ami-029635521dec5e41d",
  "InstanceType": "m5a.large",
  "KeyName": "pfSense",
  "EbsOptimized": true,
  "UserData": "cGFzc3dvcmQ9MjAxNjExNTptZ210bmV0PTE3Mi4zMS4xLjAvMjQ=",
  "BlockDeviceMappings": [
    {
      "DeviceName": "/dev/sda1",
      "Ebs": {
        "Encrypted": false,
        "DeleteOnTermination": true,
        "SnapshotId": "snap-037d0b571a31a38cd",
        "VolumeSize": 8,
        "VolumeType": "gp2"
      }
    }
  ],
  "NetworkInterfaces": [
    {
      "SubnetId": "subnet-04b636f5d719f36f9",
      "Description": "pfSense_interface_1",
      "AssociatePublicIpAddress": false,
      "DeviceIndex": 0,
      "PrivateIpAddresses": [
        {
          "Primary": true,
          "PrivateIpAddress": "172.31.1.5/24"
        }
      ],
      "Groups": [
        "<groupId of the new security group created below>"
      ]
    },
    {
      "SubnetId": "subnet-0cf09791b786738b0",
      "Description": "pfSense_interface_2",
      "DeviceIndex": 1,
      "PrivateIpAddresses": [
        {
          "Primary": true,
          "PrivateIpAddress": "172.31.2.5/24"
        }
      ],
      "Groups": [
        "<groupId of the new security group created below>"
      ]
    },
    {
      "SubnetId": "subnet-0edde42407c03f8df",
      "Description": "pfSense_interface_3",
      "DeviceIndex": 2,
      "PrivateIpAddresses": [
        {
          "Primary": true,
          "PrivateIpAddress": "172.31.3.5/24"
        }
      ],
      "Groups": [
        "<groupId of the new security group created below>"
      ]
    }
  ],
  "TagSpecifications": [
    {
      "ResourceType": "instance",
      "Tags": [
        {
          "Key": "Name",
          "Value": "pfSense"
        }
      ]
    }
  ],
  "PrivateDnsNameOptions": {
    "HostnameType": "ip-name",
    "EnableResourceNameDnsARecord": false,
    "EnableResourceNameDnsAAAARecord": false
  }
}
```

# New security group setup

```json
{
  "GroupName": "Netgate pfSense Plus Firewall/VPN/Router-24.03.0-AutogenByAWSMP--2",
  "Description": "Netgate pfSense Plus Firewall/VPN/Router-24.03.0-AutogenByAWSMP--2 created 2024-08-25T21:29:07.410Z",
  "VpcId": "vpc-035de6a04b60456dc"
}
```

# API call: AuthorizeSecurityGroupIngress

```json
{
  "GroupId": "<groupId of the security group created above>",
  "IpPermissions": [
    {
      "IpProtocol": "tcp",
      "FromPort": 80,
      "ToPort": 80,
      "IpRanges": [
        {
          "CidrIp": "0.0.0.0/0"
        }
      ]
    },
    {
      "IpProtocol": "tcp",
      "FromPort": 443,
      "ToPort": 443,
      "IpRanges": [
        {
          "CidrIp": "0.0.0.0/0"
        }
      ]
    },
    {
      "IpProtocol": "tcp",
      "FromPort": 22,
      "ToPort": 22,
      "IpRanges": [
        {
          "CidrIp": "0.0.0.0/0"
        }
      ]
    },
    {
      "IpProtocol": "udp",
      "FromPort": 1194,
      "ToPort": 1194,
      "IpRanges": [
        {
          "CidrIp": "0.0.0.0/0"
        }
      ]
    },
    {
      "IpProtocol": "udp",
      "FromPort": 500,
      "ToPort": 500,
      "IpRanges": [
        {
          "CidrIp": "0.0.0.0/0"
        }
      ]
    },
    {
      "IpProtocol": "50",
      "FromPort": null,
      "ToPort": null,
      "IpRanges": [
        {
          "CidrIp": "0.0.0.0/0"
        }
      ]
    },
    {
      "IpProtocol": "udp",
      "FromPort": 4500,
      "ToPort": 4500
    }
  ]
}
```

