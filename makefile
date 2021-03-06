CC = g++-7
FLAG = -std=c++17 -g -Wall

LIB = -lpthread

INCLUDE = -I include/

OBJS = state.o timeout-queue.o socket-internal.o tcp-header.o\
network-service.o socket-manager.o

main : $(OBJS)
	$(CC) $(FLAG) $(OBJS) main.cc $(INCLUDE) $(LIB)

test : clean $(OBJS)
	$(CC) $(FLAG) $(OBJS) test/test.cc $(INCLUDE) -o test.out $(LIB)
	./test.out
	-@rm -rf *.o

%.o : src/%.cc include/%.h
	$(CC) $(FLAG) -c $< $(INCLUDE)

clean :
	-@rm -rf *.o
