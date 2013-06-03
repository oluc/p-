#
#                 The 'p-' package manager
#
#
#    /a simple package manager for Debian based systems/
#
#
#
#  Copyright © 2013 — Luc Pionchon <pionchon.luc@gmail.com>
# 
#  p- is distributed under the GNU GPL2 license
#  
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either version 2
#  of the License, or (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to:
#       Free Software Foundation, Inc.,
#       51 Franklin Street, Fifth Floor,
#       Boston, MA  02110-1301,
#       USA
#
#===============================================================================
#
# Usage:
#    - save the file in ~/.bash.d/p-package-manager.sh
#      if you save it somewhere else, edit the alias p-help (the first grep)
#    - bash 'source' it
#    - run p-help
#
#===============================================================================


#
# (This is a self documented code: p-help will call grep on this file,
#                                                         this will be grep-ed:
#                                                                      #@p-help@
#      The 'p-' package manager                                        #@p-help@
#      ------------------------                                        #@p-help@
#      version 0.5                                                     #@p-help@
#                                                                      #@p-xxx-help@
#   p- is a wrapper to Debian package management.                      #@p-xxx-help@
#   p- unifies calls to dpkg, aptitude, apt-get, etc.                  #@p-xxx-help@
#   p- includes the commands that I use the most.                      #@p-xxx-help@
#   p- commands are all 'p-' prefixed.                                 #@p-xxx-help@
#   p- commands are just Shell aliases,                                #@p-xxx-help@
#      --> use all the original panameters.                            #@p-xxx-help@
#                                                                      #@p-xxx-help@
#  Dependencies:                                                       #@p-xxx-help@
#  - dpkg, apt-get, aptitude,                                          #@p-xxx-help@
#  - dch, dpkg-source, dpkg-buildpackage                               #@p-xxx-help@
#  - locale-purge                                                      #@p-xxx-help@
#  - bash, grep, sed, column, less, sudo                               #@p-xxx-help@
#                                                                      #@p-xxx-help@
# FIXME : why bash completion does not work?                           #@p-xxx-help@
# 

alias p-help='\grep "#@p-help@" ~/.bash.d/p-package-manager.sh   |   \grep --invert-match "alias p-help="   |   \sed -e "s/#@p-help@//; s/^alias /   /; s/^#---- //; s/^#//; s/ *$//; s/=\"/##/; s/\"//;"   |   \column -s "##" -t -e   |   \less --no-init --quit-if-one-screen   '    ##############
#---- What the pipeline does:
# grep all #+@p-help@ tagged lines in this file
# grep except this 'p-help' line
# sed removes #+@p-help@ tags
# sed replaces all 'alias ' by small indentation
# sed removed all '#---- ' to left align headings
# sed removes all starting '#'
# sed removes all trailing white spaces
# sed removes all '="'
# sed removes all remaining '"'

_p_version () { dpkg --status $1 | \grep "Version:"; }
_p_search_description () { aptitude search "?description($1)"; }
#                                                                      #@p-help@
#   <p-command>   =" <deb command>                  ## <min args>      #@p-help@
#   ------------- =" ---------------                ## ------------    #@p-help@
#                                                                      #@p-help@
#---- Query installed packages:                                        #@p-help@
alias p-status="dpkg --status"                      ## + package name  #@p-help@
alias p-list-files="dpkg --listfiles"               ## + package name  #@p-help@
alias p-version="_p_version"                        ## + package name  #@p-help@
alias p-owning-file="dpkg -S"                       ## + filename      #@p-help@
#                                                                      #@p-help@
#---- Search for remote packages:                                      #@p-help@
alias p-search="apt-cache search"                   ## + keywords      #@p-help@
alias p-search-name="aptitude search"               ## + keywords      #@p-help@
alias p-search-description="_p_search_description"  ## + keywords      #@p-help@
#                                                                      #@p-help@
#---- Install packages, remote or local:                               #@p-help@
alias p-install="sudo aptitude install"             ## + package list  #@p-help@
alias p-install-deb="sudo dpkg --install"           ## + .deb package  #@p-help@
alias p-update="sudo aptitude update"               ## (no arg)        #@p-help@
alias p-upgrade="sudo aptitude upgrade"             ## (no arg)        #@p-help@
alias p-add-ppa="sudo apt-add-repository"           ## ppa:<ppa/name>  #@p-help@
#                                                                      #@p-help@
#---- Remove packages, Clean up:                                       #@p-help@
alias p-remove="sudo aptitude purge"                ## + package list  #@p-help@
alias p-locale-purge="sudo locale-purge"            ## (no arg)        #@p-help@
alias p-cache-size="du -sh /var/cache/apt/archives" ## (no arg)        #@p-help@
alias p-cache-clean="sudo aptitude clean"           ## (no arg)        #@p-help@
#                                                                      #@p-help@
#---- Package creation:                                                #@p-help@
alias p-src-get-source="apt-get source"             ## + package name  #@p-help@
alias p-src-get-build-dep="sudo aptitude build-dep" ## + package name  #@p-help@
alias p-src-write-changelog="dch -i"                ## (no arg)        #@p-help@
alias p-src-commit-patch="dpkg-source --commit"     ## (no arg)        #@p-help@
alias p-src-build-package="dpkg-buildpackage"       ## (no arg)        #@p-help@
#                                                                      #@p-help@
#-------------------------------------------------------------------------------
