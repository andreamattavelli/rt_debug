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

include conf.mk
 
 .PHONY: all init compile clean veryclean
.SILENT:

all: init compile rt-debug.jar

## init targets ---------------------------------------------------------------
init: src rt rt-debug

src: src.zip
	@echo "** Extracting JDK source files"
	unzip src.zip -d $@/ > /dev/null

src.zip:
	@echo "** Copying src.zip"
	cp $(JAVA_ROOT)/$@ .

rt: rt.jar
	@echo "** Extracting RT class files"
	unzip rt.jar -d $@/ > /dev/null

rt.jar:
	@echo "** Copying RT jar file"
	cp $(JAVA_ROOT)/jre/lib/$@ .

rt-debug: rt
	@echo "** Copying RT class files to $@"
	cp -R rt/ $@

## compile targets ------------------------------------------------------------
compile: src rt.jar out-rt-debug src/files-to-compile
	@echo "** Compiling source code"
	cd src; \
	$(JAVAC) $(JAVAC_FLAGS) -d ../out-rt-debug -cp ../rt.jar @files-to-compile > $@.log 2>&1

out-rt-debug:
	rm -rf out-rt-debug
	mkdir out-rt-debug

src/files-to-compile: src
	@echo "** Creating $@"
	cd src; \
	find . -name '*.java' > files-to-compile

## inflate targets ------------------------------------------------------------
rt-debug.jar: compile out-rt-debug rt-debug
	@echo "** Creating $@"
	rm -rf $@
	cd out-rt-debug; \
	find .|cpio -pdmu ../rt-debug
	cd rt-debug; \
	$(JAR) cf ../$@ *


## clean targets --------------------------------------------------------------
clean:
	rm -rf rt-debug out-rt-debug

veryclean: clean
	rm -rf rt src
