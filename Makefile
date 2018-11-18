CFLAGS=-c -Wall -O2

all: tofdemo gettof

libtof.a: tof.o
	$(AR) rcs $@ $^

gettof: gettof.o libtof.a
	$(CC) $(CFLAGS) $^ -o $@ -L. -ltof

tofdemo: tofdemo.o libtof.a
	$(CC) $(CFLAGS) $^ -o $@ -L. -ltof

%.o : %.c
	$(CC) -c $(CFLAGS) $< -o $@


clean:
	-rm *.o libtof.a tofdemo gettof
