#!/bin/bash

export BUCKET="blog.vtion.ai"
export DEPLOY_DIR=".deploy"
# Copy the site directory to a temporary location so that modifications we make don't get overwritten by the Jekyll server
# that is potentially running
mkdir -p $DEPLOY_DIR $DEPLOY_DIR/content

cp -a ../jasper2-pages/. $DEPLOY_DIR

# Remove the .html extension from all blog posts for sexy URLs
for filename in $DEPLOY_DIR/*.html; do
    if [ $filename != "$DEPLOY_DIR/index.html" ];
    then
        original="$filename"

        # Get the filename without the path/extension
        filename=$(basename "$filename")
        extension="${filename##*.}"
        filename="${filename%.*}"

        # Move it
        mv $original $DEPLOY_DIR/content/$filename
    fi
done

# Now upload to s3, deleting any items that no longer exist
aws s3 sync --delete $DEPLOY_DIR s3://$BUCKET --exclude "$DEPLOY_DIR/content/*"
# Finally, upload the blog directory specifically to force the content-type
aws s3 cp "$DEPLOY_DIR/content" s3://$BUCKET --recursive --content-type "text/html"
# Cleanup
rm -r $DEPLOY_DIR
