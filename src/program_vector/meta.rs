pub struct Meta<'a> {
    cycles_per_block: &'a u32,
    heap_bytes_used: &'a mut u32,
    checksum: &'a u8,
    hardware_version: &'a u8,
}

impl<'a> Meta<'a> {
    pub fn new(
        cycles_per_block: &'a u32,
        heap_bytes_used: &'a mut u32,
        checksum: &'a u8,
        hardware_version: &'a u8,
    ) -> Self {
        Self {
            cycles_per_block,
            heap_bytes_used,
            checksum,
            hardware_version,
        }
    }

    pub fn set_heap_bytes_used(&mut self, value: usize) {
        *self.heap_bytes_used = value as u32;
    }

    pub fn cycles_per_block(&self) -> &u32 {
        self.cycles_per_block
    }

    pub fn heap_bytes_used(&self) -> &&'a mut u32 {
        &self.heap_bytes_used
    }

    pub fn checksum(&self) -> &u8 {
        self.checksum
    }

    pub fn hardware_version(&self) -> &u8 {
        self.hardware_version
    }
}
