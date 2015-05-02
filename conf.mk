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

## set java root directory (e.g. on Mac /Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home)
JAVAROOT=

# set java paths 
JAVABINDIR=$(JAVAROOT)/bin
JAVALIBDIR=$(JAVAROOT)/lib

JAVA=$(JAVABINDIR)/java
JAR=$(JAVABINDIR)/jar

JAVAC=$(JAVABINDIR)/javac
JAVAC_FLAGS=-g -source 8 -target 8
JAVATOOLS=$(JAVALIBDIR)/tools.jar