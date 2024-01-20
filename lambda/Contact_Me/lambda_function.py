import json
import boto3

client = boto3.client('sns')

def lambda_handler(event, context):
    sendMail(event)
    return {
        'statusCode': 200
    }


def get_topic():
    topic_arns = client.list_topics()['Topics']
    for arn in topic_arns:
        if 'mailme' in arn['TopicArn']:
            return arn['TopicArn']

def sendMail(event):
    body = f'Message from {event["name"]}:\n\n{event["body"]}\n\nName: ' + \
    f'{event["name"]}\nPhone: {event["phone"]}\nEmail: {event["email"]}' 

    client.publish(
        TopicArn = get_topic(),
        Message = body,
        Subject = event["subject"]
        )