#
# Makefile
#
# Copyright (C) 2012 Marc Weidler (marc.weidler@web.de)
#
# THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
# THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT
# WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
# THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.
# SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY
# SERVICING, REPAIR OR CORRECTION.

# For infos regarding large file support, see the excellent page 
# http://people.redhat.com/berrange/notes/largefile.html

COMMIT_VERSION = $(shell git describe HEAD 2>/dev/null | sed 's/-/./;s/\([^-]*\).*/\1/')
TAG_VERSION = $(shell git describe HEAD 2>/dev/null | sed 's/\([^-]*\).*/\1/')

COPT = -W -Wall -Werror -O2 -DCOMMIT_VERSION='"$(COMMIT_VERSION)"'
LOPT = -s

dropcaches: dropcaches.c
	g++ $(COPT) $(LOPT) dropcaches.c -o dropcaches
	mkdir -p ./dropcaches-install/usr/local/sbin
	cp dropcaches dropcaches-install/usr/local/sbin
	mkdir -p ./dropcaches-install/etc/sudoers.d
	cp dropcaches.sudo dropcaches-install/etc/sudoers.d/dropcaches

clobber: clean

clean:
	rm dropcaches 2>/dev/null


