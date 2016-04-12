run:
	@ echo "Running $(ARGS) example"

	# make folder for models generated by the benchmark version of RMG-Py and RMG-database:
	mkdir -p testing/benchmark/$(ARGS)
	rm -rf testing/benchmark/$(ARGS)/*
	cp examples/rmg/$(ARGS)/input.py testing/benchmark/$(ARGS)/input.py
	@ echo "version of RMG: $(BENCHMARK_RMG)"
	python $(BENCHMARK_RMG)/rmg.py testing/benchmark/$(ARGS)/input.py > /dev/null

	# make folder for models generated by the test version of RMG-Py and RMG-database:
	mkdir -p testing/testmodel/$(ARGS)
	rm -rf testing/testmodel/$(ARGS)/*
	cp examples/rmg/$(ARGS)/input.py testing/testmodel/$(ARGS)/input.py
	@ echo "version of RMG: $(RMG)"
	python $(RMG)/rmg.py testing/testmodel/$(ARGS)/input.py > /dev/null

	# compare both generated models
	bash check.sh $(ARGS) testing/benchmark/$(ARGS) testing/testmodel/$(ARGS)
