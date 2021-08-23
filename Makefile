NAME = zhenyan
TARGET = ./zhenyan

.PHONY: build test

all: build test

build:
	v src/main.v -o zhenyan

test:
	$(TARGET)

install:
	install -Dm755 "$(TARGET)" "$(DESTDIR)/usr/bin/$(NAME)"
	install -Dm644 "LICENSE" "$(DESTDIR)/usr/share/licenses/$(NAME)/LICENSE"

uninstall:
	rm -rfv "$(DESTDIR)/usr/bin/$(NAME)" "$(DESTDIR)/usr/share/licenses/$(NAME)"
