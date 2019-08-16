
PREFIX = $(MIX_COMPILE_PATH)/../priv

all: $(PREFIX)
	$(MAKE) -C src all
	#cp src/jitterentropy-rngd $(PREFIX)/jitterentropy-rngd

$(PREFIX):
	mkdir -p $@

