#libxecluster Makefile
# use 'make' to compile the shared library
# use 'make exe' to compile the executable tool

CC		= g++
CFLAGS		= -Wall -g -DLINUX -fPIC
LDFLAGS         = -shared -lsnappy -lprotobuf
SOURCES         = $(shell echo ./src/*cc)
OBJECTS         = $(SOURCES: .cc=.o)
SO              = libpbf.so

all: $(SO)

$(SO) : $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) $(CFLAGS) -o $(SO)

install:	
	install $(SO) /usr/local/lib/$(SO)
	install $(shell echo ./src/*h) /usr/local/include/pbf/
clean:
	rm $(SO)


