rm /q /f docs;
mkdir docs;
mkdir docs/images;

copy asciidocs/docinfo.html docs;
copy asciidocs/*.adoc docs;
copy asciidocs/images/* docs/images;

docker run --rm -v ${PWD}/docs:/documents asciidoctor/docker-asciidoctor /bin/bash -c "asciidoctor -r asciidoctor-diagram -a icons=font -a experimental=true -a source-highlighter=rouge -a rouge-theme=github -a rouge-linenums-mode=inline -a docinfo=shared -a imagesdir=images -a toc=left -a toclevels=2 -a sectanchors=true -a sectnums=true -a favicon=themes/favicon.png -a sourcedir=src/main/java -b html5 '*.adoc' && rm -rf ./.asciidoctor && echo Done"

rm /q /f docs/revealjs;
rm docs/*.adoc;

rm docs/docinfo.html;

echo "ready to push"

cd docs;

git add .;

git commit -m "update Demo Website";

git push origin master;