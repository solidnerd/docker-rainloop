NAME=rainloop
PREFIX=solidnerd
TAG=${PREFIX}/${NAME}

build:
	docker build -t ${TAG} .

shell: build
	docker run -it --rm  ${TAG} bash

release:
	docker build -t ${TAG} .
	docker push ${TAG}

test: build
	docker run  --rm -it -p "80:80" ${TAG}
