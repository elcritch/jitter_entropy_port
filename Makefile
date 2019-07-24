
PREFIX = $(MIX_COMPILE_PATH)/../priv

$(PREFIX):
	mkdir -p $@

all: $(PREFIX)
	$(MAKE) -C src all
	mkdir priv/
	cp src/jitterentropy-rngd $(PREFIX)/jitterentropy-rngd
