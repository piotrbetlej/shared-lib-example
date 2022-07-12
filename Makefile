MAJ="1"
MIN="0"
VER="0"

LIBNAME="libsharedexample"


override CFLAGS += -fPIC -I./
override LDFLAGS += -shared -Wl,-soname,$(LIBNAME).so.$(MAJ)

all : shared-lib-example

shared-lib-example: shared-lib-example.o
	${CC} ${LDFLAGS} -o ${LIBNAME}.so.${MAJ}.${MIN}.${VER} shared-lib-example.o
ifdef SDKTARGETSYSROOT
	ln -s ${LIBNAME}.so.${MAJ}.${MIN}.${VER} ${LIBNAME}.so.${MAJ}.${MIN}
	ln -s ${LIBNAME}.so.${MAJ}.${MIN} ${LIBNAME}.so.${MAJ}
	ln -s ${LIBNAME}.so.${MAJ} ${LIBNAME}.so
endif
# This is ugly. But there is no OR operator in GNU make.
ifeq ($(CC), cc)
	ln -s ${LIBNAME}.so.${MAJ}.${MIN}.${VER} ${LIBNAME}.so.${MAJ}.${MIN}
	ln -s ${LIBNAME}.so.${MAJ}.${MIN} ${LIBNAME}.so.${MAJ}
	ln -s ${LIBNAME}.so.${MAJ} ${LIBNAME}.so
endif

shared-lib-example.o :  shared-lib-example.c
	${CC} ${CFLAGS} -c shared-lib-example.c

clean :
	rm -rf *.so* *.o
