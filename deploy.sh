cat > deploy.sh << 'EOF'
#!/bin/bash

# AWS S3 Deployment Script
# Replace YOUR_BUCKET_NAME with your actual S3 bucket name

BUCKET_NAME="your-bucket-name"

echo "Starting deployment..."

# Sync files to S3
aws s3 sync . s3://$BUCKET_NAME \
  --exclude ".git/*" \
  --exclude ".gitignore" \
  --exclude "deploy.sh" \
  --exclude "README.md" \
  --delete

# Invalidate CloudFront cache (optional)
# DISTRIBUTION_ID="your-distribution-id"
# aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "/*"

echo "Deployment complete!"
EOF

# 给脚本执行权限
chmod +x deploy.sh