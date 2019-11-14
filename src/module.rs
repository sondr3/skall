use std::fmt;

#[derive(Debug)]
pub struct Module {
    pub content: String,
}

impl fmt::Display for Module {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}", self.content)
    }
}

impl Module {
    pub fn new(content: impl Into<String>) -> Self {
        Module {
            content: content.into(),
        }
    }
}
