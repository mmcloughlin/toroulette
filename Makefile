OPENSSL_DIR=/usr/local/opt/openssl


packages/%.tar.gz:
	mkdir -p packages
	wget -O $@ https://archive.torproject.org/tor-package-archive/$*.tar.gz

versions/%/src/or/tor: packages/%.tar.gz
	mkdir -p versions
	tar -C versions -xvzf $<
	cd versions/$* && ./configure --disable-asciidoc --with-openssl-dir=${OPENSSL_DIR}
	make -C versions/$* src/or/tor

bin/%: versions/%/src/or/tor
	mkdir -p bin
	cp $< $@

data/descriptors.txt:
	wget -O $@ http://86.59.21.38/tor/server/all

data/version-distribution.txt: data/descriptors.txt
	awk '/^platform Tor/ { print $$3 }' $^ | sort | uniq -c | sort -nr > $@

mostlyclean:
	$(RM) -r packages
	$(RM) -r versions
