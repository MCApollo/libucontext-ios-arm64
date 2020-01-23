CC := aarch64-apple-darwin17-clang
AR := aarch64-apple-darwin17-ar
CFLAGS = -ggdb3 -O2 -Wall -I. -I./include

LIBUCONTEXT_C_SRC = $(wildcard ./*.c)
LIBUCONTEXT_S_SRC = $(wildcard ./*.S)

LIBUCONTEXT_OBJ = ${LIBUCONTEXT_C_SRC:.c=.o} ${LIBUCONTEXT_S_SRC:.S=.o}
LIBUCONTEXT_STATIC_NAME = libucontext.a
PREFIX := /usr/local/lib

all: ${LIBUCONTEXT_STATIC_NAME}

${LIBUCONTEXT_STATIC_NAME}: ${LIBUCONTEXT_OBJ}
	$(AR) rcs ${LIBUCONTEXT_STATIC_NAME} ${LIBUCONTEXT_OBJ}

.c.o:
	$(CC) -std=c99 -D_BSD_SOURCE -fPIC -DPIC ${CFLAGS} ${CPPFLAGS} -c -o $@ $<

.S.o:
	$(CC) -fPIC -DPIC ${CFLAGS} ${CPPFLAGS} -c -o $@ $<

clean:
	rm -f ${LIBUCONTEXT_NAME} ${LIBUCONTEXT_SONAME} ${LIBUCONTEXT_STATIC_NAME} \
		${LIBUCONTEXT_OBJ} test_libucontext

install: all
	install -D -m664 ${LIBUCONTEXT_STATIC_NAME} ${DESTDIR}/${PREFIX}/lib
	install -D -m664 ucontext.h ${DESTDIR}/${PREFIX}/include

test_libucontext: test_libucontext.c ${LIBUCONTEXT_NAME}
	$(CC) -std=c99 -D_BSD_SOURCE ${CFLAGS} ${CPPFLAGS} $@.c -o $@ -L. -lucontext
