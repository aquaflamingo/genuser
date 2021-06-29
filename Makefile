PROJECT=genuser

all: build 

build:
	@crystal build src/main.cr -o bin/genuser

install:
	@shards install
