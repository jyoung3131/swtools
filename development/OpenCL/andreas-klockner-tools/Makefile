EXECUTABLES = cl-demo print-devices

all: $(EXECUTABLES)

ifdef OCL_INCL
  CL_CFLAGS = -I$(OCL_INCL)
endif

ifdef OCL_LIB
  CL_LDFLAGS = -L$(OCL_LIB)
endif

print-devices: print-devices.c cl-helper.c
	gcc -g $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -o$@ $^ -lrt ${CL_LDFLAGS} -lOpenCL

cl-demo: cl-demo.c cl-helper.c
	gcc -g $(CL_CFLAGS) $(CL_LDFLAGS) -std=gnu99 -o$@ $^ -lrt ${CL_LDFLAGS} -lOpenCL

clean:
	rm -f $(EXECUTABLES) *.o
