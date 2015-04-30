.PHONY: all init compile clean veryclean
.SILENT:

JAVA_ROOT=
JAVAC_FLAGS=-g -source 7 -target 7

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
	javac $(JAVAC_FLAGS) -d ../out-rt-debug -cp ../rt.jar @files-to-compile > $@.log 2>&1

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
	jar cf ../$@ *


## clean targets --------------------------------------------------------------
clean:
	rm -rf rt-debug out-rt-debug

veryclean: clean
	rm -rf rt src
