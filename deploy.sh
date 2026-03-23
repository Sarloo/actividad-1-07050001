#!/bin/bash

BUCKET="actividad-1-al07050001-carlos"
REGION="us-east-1"

echo "Obteniendo la ultima version del repositorio..."
git pull origin main

echo "Desplegando archivos a S3..."
aws s3 sync . s3://$BUCKET --delete \
  --exclude ".git/*" \
  --exclude ".DS_Store" \
  --exclude "bucket-policy.json" \
  --exclude "deploy.sh"

echo "Sitio desplegado en:"
echo "http://$BUCKET.s3-website-$REGION.amazonaws.com"