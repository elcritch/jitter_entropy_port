
all:
	export DESTDIR=./priv/ 
	$(MAKE) -C src all
	DESTDIR=./priv/ $(MAKE) -C src install
