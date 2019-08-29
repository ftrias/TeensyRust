
## For Teensy 3 (without FPU)
TARGET_GCC=-mcpu=cortex-m4 -mthumb
TARGET_RUST=thumbv7em-none-eabi

## For Teensy 3/4 (with FPU)
# TARGET_GCC=cortex-m7 -mthumb
# TARGET_RUST=thumbv7em-none-eabihf

GCC=arm-none-eabi-gcc

#
all: setup main

test.o: test.rs
	rustc --target=$(TARGET_RUST) --crate-type=staticlib --emit obj test.rs -o test.o

main.o: main.c
	$(GCC) -nostdlib $(TARGET_GCC) -c main.c

main: test.o main.o
	$(GCC) -o main main.o test.o --specs=nosys.specs

clean:
	rm test.o main.o main

setup:
	rustup target install $(TARGET_RUST)