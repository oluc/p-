default:
	@echo 'Nothing to be done by default.'
	@echo 'You can run `sudo make install DESTDIR=` for example.'
# TODO:                                   DESTDIR=/
# OR
# DESTDIR ?='/'


VERSION   = `head -1 debian/changelog | cut  -d'(' -f2 | cut  -d')' -f1`
DISTFILES = `git ls-files | grep --invert-match debian`
DEBFILES  = `git ls-files | grep debian`

dist:
	@echo Making distribution tree for p- $(VERSION)
	@rm -rf .dist
	@install -d .dist/p-_$(VERSION)
	@install -d .dist/p-_$(VERSION)/debian
	@install --mode="a+r,u+w" $(DISTFILES) .dist/p-_$(VERSION)/
	@install --mode="a+r,u+w" $(DEBFILES)  .dist/p-_$(VERSION)/debian
	@tree -p .dist/p-_$(VERSION)
	@echo && echo done.

deb-package:
	###@echo $(PWD) |grep ".dist" || echo "Run 'make dist' first. Then cd .dist/p-_??/"; false
	dpkg-buildpackage



#
# NOTE: Debian packaging tools will set DESTDIR.

DEST=etc/bash_completion.d
install:
	@install -d $(DESTDIR)/$(DEST)
	@install --mode=a+r,a-wx,u+w p-package-manager.sh $(DESTDIR)/$(DEST)
	@sed -i -e "s@grep \"#\@p-help\@\" ~/.bash.d@grep \"#\@p-help\@\" /$(DEST)@" $(DESTDIR)/$(DEST)/p-package-manager.sh
	@#           @                              @                             @
	@#            grep \"#\@p-help\@\"           grep \"#\@p-help\@\"         .
	@#                                 ~/.bash.d                      /$(DEST).


uninstall:
	@echo TODO


