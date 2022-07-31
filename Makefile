.PHONY: serve
serve:
	mix dialyzer
	iex -S mix run

.PHONY: test
test:
	mix dialyzer
	mix test
