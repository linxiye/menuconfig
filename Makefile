KCONFIG	:= .config

ifeq ($(wildcard $(KCONFIG)),)
autoconf_is_old := $(shell touch .config)
endif

include $(KCONFIG)
export  $(KCONFIG)

obj-y :=
obj-$(CONFIG_MAIN) += main.o

main:$(obj-y)
	gcc $(obj-y) -o main

menuconfig:
	make -f scripts/kconfig/Makefile  menuconfig

.PHONY: clean

clean:
	rm *.o

distclean:
	rm *.o .config*