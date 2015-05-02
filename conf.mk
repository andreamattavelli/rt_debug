##  Authors: Andrea Mattavelli
##  Copyright (C) 2015 Andrea Mattavelli
##  
##  This Makefile is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##  
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##  
##  You should have received a copy of the GNU General Public License
##  along with this Makefile.  If not, see <http://www.gnu.org/licenses/>

UNAME=$(shell uname)
SHELL:=/bin/bash

## set java root directory (e.g. on Mac /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents)
JAVA_ROOT=

# set java paths depending on the operating system
ifeq ($(UNAME),Darwin)
JAVABINDIR=$(JAVAROOT)/Commands
JAVALIBDIR=$(JAVAROOT)/Resources
export JAVA_HOME=$(/usr/libexec/java_home)
else
JAVABINDIR=$(JAVAROOT)/bin
JAVALIBDIR=$(JAVAROOT)/jre/lib
export JAVA_HOME=$(JAVAROOT)
endif

JAVA=$(JAVABINDIR)/java
JAR=$(JAVABINDIR)/jar

JAVAC=$(JAVABINDIR)/javac
JAVAC_FLAGS=-g -source 7 -target 7