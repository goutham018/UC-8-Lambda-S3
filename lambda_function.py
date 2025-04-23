import json
import boto3
from PIL import Image
import io

s3 = boto3.client('s3')

def lambda_handler(event, context):
    source_bucket = 'source-images-bucket-273550'
    destination_bucket = 'processed-images-bucket-273550'
    key = event['Records'][0]['s3']['object']['key']

    # Get the image from S3
    response = s3.get_object(Bucket=source_bucket, Key=key)
    image_content = response['Body'].read()

    # Process the image (e.g., resize)
    image = Image.open(io.BytesIO(image_content))
    image = image.resize((100, 100))  # Example: resize to 100x100

    # Save the processed image to a buffer
    buffer = io.BytesIO()
    image.save(buffer, 'JPEG')
    buffer.seek(0)

    # Upload the processed image to the destination bucket
    s3.put_object(Bucket=destination_bucket, Key=key, Body=buffer, ContentType='image/jpeg')

    return {
        'statusCode': 200,
        'body': json.dumps('Image processed and uploaded successfully!')
    }
