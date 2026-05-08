export RELEASE="0.0.0"
export BUCKET_NAME="rpg.hoopers.live"

rm -rf ./build/web

flutter build web --release --base-href /$RELEASE/

mkdir -p build/web_output/$RELEASE
mv build/web/* build/web_output/$RELEASE/
mv build/web_output/$RELEASE/index.html build/web_output/index.html
cp build/web_output/$RELEASE/version.json build/web_output/version.json


aws s3 cp build/web_output/$RELEASE/ s3://$BUCKET_NAME/$RELEASE/ \
    --recursive \
    --cache-control "max-age=31536000, immutable"

#Upload index.html
aws s3 cp build/web_output/index.html s3://$BUCKET_NAME/index.html \
    --cache-control "max-age=0, no-cache, no-store, must-revalidate"

#Upload version.json
aws s3 cp build/web_output/version.json s3://$BUCKET_NAME/version.json \
    --cache-control "max-age=0, no-cache, no-store, must-revalidate"    