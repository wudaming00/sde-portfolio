#!/bin/bash

BUCKET_NAME="damingwu-portfolio-2026"
REGION="us-east-1"

echo "🚀 Starting deployment to $BUCKET_NAME..."

# 上传文件到S3
echo "📦 Uploading files to S3..."
aws s3 sync . s3://$BUCKET_NAME \
  --exclude ".git/*" \
  --exclude ".gitignore" \
  --exclude "deploy.sh" \
  --exclude "README.md" \
  --exclude "bucket-policy.json" \
  --exclude ".DS_Store" \
  --delete \
  --cache-control "max-age=3600"

echo "✅ Deployment complete!"
echo ""
echo "🌐 Your website is live at:"
echo "   http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
echo ""
