CC?=gcc

SRC=$(CURDIR)/src
BIN=$(CURDIR)/bin
OBJS=$(SRC)/*.o

INSTALLBIN=/usr/bin

INC=$(CURDIR)/librwelf/include
LIB=$(CURDIR)/librwelf/lib


rwelf:
	$(MAKE) -C librwelf

	mkdir -p $(BIN)
	$(CC) -o $(BIN)/rwelf $(SRC)/main.c -I $(INC) -L $(LIB) -l rwelf

clean:
	$(MAKE) -C librwelf clean

	rm -rf $(BIN) $(OBJS)

install:
	$(MAKE) -C librwelf install

	cp $(BIN)/* $(INSTALLBIN)
