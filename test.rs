//https://blog.japaric.io/quickstart/

#![no_std]
use core::panic::PanicInfo;
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub extern "C" fn run_main() -> isize {
    42 as isize
}