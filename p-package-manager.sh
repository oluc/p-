#
#                 The 'p-' package manager
#                 ========================
#
#     /a simple package manager for Debian based systems/
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
# Installation and Usage:
#    - save the file in ~/.bash.d/p-package-manager.sh
#      if you save it somewhere else, edit the alias p-help (the first grep)
#    - bash 'source' it
#    - run p-help
#
#===============================================================================
#
#
# (This is a self documented code: p-help will call grep on this file,
#                                                         this will be grep-ed:
#                                                                      #@p-help@
#      The 'p-' package manager                                        #@p-help@
#      ------------------------                                        #@p-help@
#      version 0.6                                                     #@p-help@
#                                                                      #@p-xxx-help@
#   p- is a wrapper to Debian package management.                      #@p-xxx-help@
#   p- unifies calls to dpkg, aptitude, apt-get, etc.                  #@p-xxx-help@
#   p- includes the commands that I use the most.                      #@p-xxx-help@
#   p- commands are all 'p-' prefixed.                                 #@p-xxx-help@
#   p- commands are just Shell aliases,                                #@p-xxx-help@
#      --> use all the original panameters.                            #@p-xxx-help@
# 

alias p-help='\grep "#@p-help@" ~/.bash.d/p-package-manager.sh   |   \grep --invert-match "alias p-help="   |   \sed -e "s/#@p-help@//; s/^alias /   /; s/^#---- //; s/^#//; s/ *$//; s/=\"/##/; s/\"//;"   |   \column -s "##" -t -e   |   \less --no-init --quit-if-one-screen   '    ##############
#---- What the pipeline does:
# grep all #+@+p-help+@ tagged lines in this file
#      except this 'p-help' line
#  sed removes #+@p-help@ tags
#      replaces all 'alias ' by small indentation
#      removes all '#---- ' to left align headings
#      removes all starting '#'
#      removes all trailing white spaces
#      removes all '="'
#      removes all remaining '"'

_dpkg_version       () { dpkg --status $1 | \grep "Version:"; }
_aptit_search_descr () { aptitude search "?description($1)"; }
#                                                                      #@p-help@
#   <p-command>   =" <deb command>                  ## <min args>      #@p-help@
#   ------------- =" ---------------                ## ------------    #@p-help@
#                                                                      #@p-help@
#---- Query installed packages:                                        #@p-help@
alias p-status="dpkg --status"                      ## + package name  #@p-help@
alias p-list-files="dpkg --listfiles"               ## + package name  #@p-help@
alias p-version="_dpkg_version"                     ## + package name  #@p-help@
alias p-owning-file="dpkg -S"                       ## + filename      #@p-help@
#                                                                      #@p-help@
#---- Search for remote packages:                                      #@p-help@
alias p-search="apt-cache search"                   ## + keywords      #@p-help@
alias p-search-name="aptitude search"               ## + keywords      #@p-help@
alias p-search-description="_aptit_search_descr"    ## + keywords      #@p-help@
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
alias p-locale-purge="sudo localepurge"             ## (no arg)        #@p-help@
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
#
# Bash completion
#
complete -F _pkg_names p-status
complete -F _pkg_names p-list-files
complete -F _pkg_names p-version

complete -F _pkg_names p-install
complete -F _pkg_names p-remove

complete -F _pkg_names p-src-get-source
complete -F _pkg_names p-src-get-build-dep



echo "p- done."