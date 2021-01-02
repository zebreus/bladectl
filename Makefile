ARGBASH := argbash
RM := rm
INSTALL := install

BINDIR := /usr/bin

SOURCE := bladectl.argbash
TARGET := bladectl

all: $(TARGET)

clean:

distclean: clean
	$(RM) $(TARGET)

install : $(TARGET)
	$(INSTALL) $(TARGET) $(BINDIR)/$(TARGET)

uninstall :
	$(RM) $(BINDIR)/$(TARGET)

$(TARGET) : $(SOURCE)
	$(ARGBASH) -o $@ $<
