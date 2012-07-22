compile:
	@find src -name '*.coffee' | xargs ./node_modules/.bin/coffee -c -o bin
