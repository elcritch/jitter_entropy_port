
all:
	$(MAKE) -C src all
	cp src/jitterentropy-rngd priv/jitterentropy-rngd
