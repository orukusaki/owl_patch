extern crate alloc;
use alloc::boxed::Box;

pub enum Resource {
    Owned(Box<[u8]>),
    Mapped(&'static [u8]),
}

impl AsRef<[u8]> for Resource {
    fn as_ref(&self) -> &[u8] {
        match self {
            Resource::Owned(b) => b.as_ref(),
            Resource::Mapped(s) => *s,
        }
    }
}

impl Resource {
    pub fn len(&self) -> usize {
        match self {
            Resource::Owned(b) => b.len(),
            Resource::Mapped(s) => s.len(),
        }
    }
}
