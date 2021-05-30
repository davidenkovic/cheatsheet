BUILD_DIR="docs"

rm -rf -v $BUILD_DIR;

mkdir -p docs;
mkdir -p docs/images;

cp -r -p -v asciidocs/docinfo.html $BUILD_DIR;

cp -r -p -v asciidocs/*.adoc $BUILD_DIR;

cp -r -p -v asciidocs/images/* $BUILD_DIR/images;