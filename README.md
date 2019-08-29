Sample files for compiling Rust file to run on the Teensy platform.

References

https://github.com/arduino/Arduino/wiki/Arduino-IDE-1.5-3rd-party-Hardware-specification
https://rust-embedded.github.io/cortex-m-quickstart/cortex_m_quickstart/

If you want to experiment with the Arduino IDE, you can modify the platform.txt file and add the following:

recipe.c.combine.pattern="{compiler.path}{build.toolchain}{build.command.linker}" {build.flags.optimize} {build.flags.ld} {build.flags.ldspecs} {build.flags.cpu} -o "{build.path}/{build.project_name}.elf" {object_files} "{build.path}/{archive_file}" "-L{build.path}" {build.flags.libs} "{build.path}/sketch/rust.o"
recipe.hooks.linking.prelink.1.pattern="/bin/mv" "{build.path}/sketch/test.rs.hpp" "{build.path}/sketch/test.rs"
recipe.hooks.linking.prelink.2.pattern="Users/ftrias/.cargo/bin/rustc" --target=thumbv7em-none-eabihf --crate-type=staticlib --emit obj "{build.path}/sketch/test.rs" -o "{build.path}/sketch/rust.o"
recipe.hooks.linking.prelink.3.pattern="/bin/ls" -R "{build.path}"

Once this is done, in the IDE you can create a file called "test.rs.hpp" and it will be compiled as Rust and linked.