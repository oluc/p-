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



## OK, I want it!

  1. grab the latest release
     - go to https://github.com/oluc/p-/tree/debian-packages-archive
     - download the '_all.deb' file with highest version number
  2. install it, run: 'sudo dpkg --install p-_*_all.deb'
  3. that's it. (you can run 'p-help' to start with)


## I am technical, I want to install it by myself

     $ git clone https://github.com/oluc/p-.git
     $ cd p-
     $ mkdir ~/.bash.d
     $ cp p-package-manager.sh ~/.bash.d/p-package-manager.sh
     $ source ~/.bash.d/p-package-manager.sh
     $ p-help

NOTE 1: if you save it somewhere else, edit the alias 'p-help' (the first grep)

NOTE 2: you can add the following code in your ~/.bashrc:

    # p- package manager
    if [ -f ~/.bash.d/p-package-manager.sh ]; then
            ~/.bash.d/p-package-manager.sh
    fi


### Debian packages archive

Current and previous released packages are at:
https://github.com/oluc/p-/tree/debian-packages-archive


## I want to know more

Visit the project **home page** at **http://oluc.github.io/p-**
