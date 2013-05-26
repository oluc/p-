default:
	@echo 'Nothing to be done by default.'
	@echo 'You can run `sudo make install DESTDIR=` for example.'

#
# NOTE: Debian packaging tools will set DESTDIR.

DEST=etc/profile.d
install:
	install --mode=a+r,a-wx,u+w p-package-manager.sh $(DESTDIR)/$(DEST)
	sed -i -e "s@grep \"#\@p-help\@\" ~/.bash.d@grep \"#\@p-help\@\" $(DESTDIR)/$(DEST)@" $(DESTDIR)/$(DEST)/p-package-manager.sh
	@#          @                              @                                      @
	@#           grep \"#\@p-help\@\"           grep \"#\@p-help\@\"                  .
	@#                                ~/.bash.d                      $(DESTDIR)/$(DEST).
