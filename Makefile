PROJECT=genuser

all: build 

build:
	@mkdir -p bin
	@crystal build src/main.cr -o bin/genuser

install:
	@shards install
