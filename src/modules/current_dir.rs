use crate::module::Module;
use crate::Skall;
use std::env;

pub fn current_dir(shell: &mut Skall) -> Result<(), Box<dyn std::error::Error>> {
    let home = env::var("HOME").expect("No $HOME defined");
    let dir = env::current_dir()?;

    let path = if dir.starts_with(&home) {
        let stripped = dir.strip_prefix(home)?.to_str().expect("Nope");
        let mut out = String::new();
        out.push_str("~/");
        out.push_str(stripped);
        out
    } else {
        dir.to_str().expect("No current dir?").to_owned()
    };

    let dir_module = Module { content: path };

    shell.modules.push(dir_module);

    Ok(())
}
