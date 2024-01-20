import json
import boto3


client = boto3.client('dynamodb')

def lambda_handler(event, context):

    return {
        'views' : updateTable()
    }


def getViewerCount():
    response = client.get_item(
        TableName = 'viewer_count',
        Key={
            'Id': {
                'N': '0'
            }
        },
        AttributesToGet=[
            'value'
            ]
    )
    return response['Item']['value']['N']
    

def updateTable():
    old_count = int(getViewerCount())
    viewer_count = old_count + 1
    
    client.update_item(
        TableName = 'viewer_count',
        Key={
            'Id': {
                'N': '0'
            }
        },
       AttributeUpdates = {
           'value': {
               'Value': {
                   'N': str(viewer_count)
               },
               'Action': 'PUT'
           }
       }
    )
    return getViewerCount()