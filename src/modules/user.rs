use crate::module::Module;
use crate::Skall;

use std::env;

pub fn user_module(shell: &mut Skall) {
    let username = env::var("USER").expect("No $USER found.");
    let user_module = Module { content: username };

    shell.modules.push(user_module);
}
