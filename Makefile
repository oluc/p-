default:
	@echo 'Nothing to be done by default.'
	@echo 'You can run `make install`.'

DESTDIR=/etc/profile.d/

install:
	install p-package-manager.sh $(DESTDIR)

