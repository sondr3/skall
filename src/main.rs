mod module;
mod modules;

use crate::module::Module;
use crate::modules::current_dir::current_dir;
use crate::modules::user::user_module;

#[derive(Debug)]
pub struct Skall {
    pub modules: Vec<Module>,
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let mut shell = Skall {
        modules: Vec::new(),
    };

    current_dir(&mut shell)?;
    //    user_module(&mut shell);

    for module in shell.modules {
        print!("{}", module);
    }

    Ok(())
}
