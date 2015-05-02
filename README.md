# rt_debug

Makefile to recompile the JDK runtime (rt.jar) with all debugging information.

The project is composed of two files:

1. `Makefile` that contains the commands to compile the Runtime library 
2. `conf.mk` that contains the configuration options for Java

## Configuring Java
To successfully compile the JDK runtime, it is mandatory to configure the Java environment.
In `conf.mk` it is sufficient to copy-paste your Java root directory to JAVA_ROOT (line 21).

For example, on Mac OS X, it is possible to retrieve the Java root with this command (it requires XCode):

```
rt_debug$ /usr/libexec/java_home
/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home
```

**NOTE**: by properly combining the configuration options in `conf.mk` you can also recompile the JDK runtime with other compilers or static analysis tools.

## Run!

```
rt_debug$ make
** Copying src.zip
** Extracting JDK source files
** Copying RT jar file
** Extracting RT class files
** Copying RT class files to rt-debug
** Creating src/files-to-compile
** Compiling source code
** Creating rt-debug.jar
```
If the make process succeed, you should find a `rt-dedug.jar` in the current directory.

### Additional commands
* `clean` - deletes working directories
* `veryclean` - deletes also rt and src directories
* `veryveryclean` - deletes **all**, rt-debug.jar included!