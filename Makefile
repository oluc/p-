default:
	@echo 'Nothing to be done by default.'
	@echo 'You can run `make install`.'

DEST=/etc/profile.d/

install:
	install p-package-manager.sh $(DESTDIR)$(DEST)

