all: build

preview: build
	xdg-open http://localhost:1313/index.xml
	http-server ./output -p 1313

build:
	forester build forest.toml

clean:
	rm -rf output

new:
	forester new forest.toml --dest=trees --prefix=$(name)

.PHONY: all build clean preview new
