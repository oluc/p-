p-
==

*a simple package manager*

p- is a simple package manager for Debian based system, like Debain and Ubuntu.
Technically it is just a wrapper to debian packaging commands.
It unifies the calls to the various debian packaging commands for the most common tasks.
Visit the project **home page** at **http://oluc.github.io/p-**

#### What does it do? Convince me in 5 commands!

OK

##### The Debian way
    $ apt-cache search         foo                      # apt-cache, apt-get, dpkg, etc.
    $ sudo apt-get install     foobar                   # sudo or not sudo (that is the question)
    $ sudo apt-get remove      foobar                   # get or remove? Does not make sense
    $ sudo dpkg  --install     foobar.deb               # install vs --install, I never remember
    $ sudo add-apt-repository  ppa:foobar-plusplus      # one more app to remember

##### The "p-" way
    $ p-search       foo
    $ p-install      foobar
    $ p-remove       foobar
    $ p-install-deb  foobar.deb
    $ p-add-ppa      ppa:foobar-plusplus

Plain simple.





## For busy people: 3 step run

  1. save the file in ~/.bash.d/p-package-manager.sh
  2. bash 'source' it
  3. run p-help

That's it.


NOTE 1: if you save it somewhere else, edit the alias 'p-help' (the first grep)

NOTE 2: you can add the following code in your ~/.bashrc:

    # p- package manager
    if [ -f ~/.bash.d/p-package-manager.sh ]; then
            ~/.bash.d/p-package-manager.sh
    fi

