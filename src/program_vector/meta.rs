use crate::ffi::program_vector as ffi;
use core::slice;
pub use ffi::MemorySegment;
use num::FromPrimitive;

/// Checksum value used to verify that the program vector was initialised, as well as indicating
/// features available in the host OS
#[repr(u8)]
#[derive(Debug, Copy, Clone, Hash, PartialEq, Eq, num_derive::FromPrimitive)]
pub enum ProgramVectorChecksum {
    /// Version 11
    V11 = ffi::PROGRAM_VECTOR_CHECKSUM_V11 as u8,
    /// Version 12
    V12 = ffi::PROGRAM_VECTOR_CHECKSUM_V12 as u8,
    /// Version 13
    V13 = ffi::PROGRAM_VECTOR_CHECKSUM_V13 as u8,
}

pub const OWL_PEDAL_LEGACY_HARDWARE: u8 = 0x11;
pub const OWL_MODULAR_LEGACY_HARDWARE: u8 = 0x12;
pub const OWL_RACK_HARDWARE: u8 = 0x13;
pub const PRISM_HARDWARE: u8 = 0x14;
pub const PLAYER_HARDWARE: u8 = 0x15;
pub const TESSERACT_HARDWARE: u8 = 0x16;
pub const ALCHEMIST_HARDWARE: u8 = 0x17;
pub const WIZARD_HARDWARE: u8 = 0x18;
pub const MAGUS_HARDWARE: u8 = 0x19;
pub const EFFECTSBOX_HARDWARE: u8 = 0x1a;
pub const WAVETABLE_HARDWARE: u8 = 0x1b;
pub const NOCTUA_HARDWARE: u8 = 0x1c;
pub const BIOSIGNALS_HARDWARE: u8 = 0x1d;
pub const LICH_HARDWARE: u8 = 0x1e;
pub const WITCH_HARDWARE: u8 = 0x1f;
pub const GENIUS_HARDWARE: u8 = 0x20;
pub const OWL_PEDAL_HARDWARE: u8 = 0x21;
pub const OWL_MODULAR_HARDWARE: u8 = 0x22;
pub const XIBECA_HARDWARE: u8 = 0x23;
pub const OTHER_HARDWARE: u8 = 0xf0;

#[repr(u8)]
#[derive(Copy, Clone, Default, num_derive::FromPrimitive)]
pub enum HardwareId {
    OwlPedalLegacyHardware = OWL_PEDAL_LEGACY_HARDWARE,
    OwlModularLegacyHardware = OWL_MODULAR_LEGACY_HARDWARE,
    OwlRackHardware = OWL_RACK_HARDWARE,
    PrismHardware = PRISM_HARDWARE,
    PlayerHardware = PLAYER_HARDWARE,
    TesseractHardware = TESSERACT_HARDWARE,
    AlchemistHardware = ALCHEMIST_HARDWARE,
    WizardHardware = WIZARD_HARDWARE,
    MagusHardware = MAGUS_HARDWARE,
    EffectsboxHardware = EFFECTSBOX_HARDWARE,
    WavetableHardware = WAVETABLE_HARDWARE,
    NoctuaHardware = NOCTUA_HARDWARE,
    BiosignalsHardware = BIOSIGNALS_HARDWARE,
    LichHardware = LICH_HARDWARE,
    WitchHardware = WITCH_HARDWARE,
    GeniusHardware = GENIUS_HARDWARE,
    OwlPedalHardware = OWL_PEDAL_HARDWARE,
    OwlModularHardware = OWL_MODULAR_HARDWARE,
    XibecaHardware = XIBECA_HARDWARE,
    #[default]
    OtherHardware = OTHER_HARDWARE,
}

pub enum ScreenType {
    None,
    Monochrome,
    Colour,
}

impl HardwareId {
    pub fn has_screen(&self) -> ScreenType {
        match self {
            HardwareId::EffectsboxHardware
            | HardwareId::GeniusHardware
            | HardwareId::MagusHardware
            | HardwareId::PlayerHardware
            | HardwareId::XibecaHardware => ScreenType::Monochrome,

            HardwareId::PrismHardware => ScreenType::Colour,
            _ => ScreenType::None,
        }
    }
}

/// Program Metadata
pub struct Meta {
    cycles_per_block: &'static u32,
    heap_bytes_used: &'static mut u32,
    checksum: ProgramVectorChecksum,
    hardware_version: HardwareId,
    heap_locations: *mut MemorySegment,
}

impl Meta {
    pub(crate) fn new(
        cycles_per_block: &'static u32,
        heap_bytes_used: &'static mut u32,
        checksum: ProgramVectorChecksum,
        hardware_version: u8,
        heap_locations: *mut MemorySegment,
    ) -> Self {
        Self {
            cycles_per_block,
            heap_bytes_used,
            checksum,
            hardware_version: HardwareId::from_u8(hardware_version).unwrap_or_default(),
            heap_locations,
        }
    }

    /// Report to the OS how much heap memory this patch is using
    pub fn set_heap_bytes_used(&mut self, value: usize) {
        *self.heap_bytes_used = value as u32;
    }

    /// How many cycles we are taking to process each block of samples
    pub fn cycles_per_block(&self) -> u32 {
        *self.cycles_per_block
    }

    /// The checksum set by the OS before program start
    pub fn checksum(&self) -> ProgramVectorChecksum {
        self.checksum
    }

    /// Get Hardware version. *might* match one of the *_HARDWARE constants.
    pub fn hardware_version(&self) -> HardwareId {
        self.hardware_version
    }

    /// Get a slice of memory segments available for use in heap allocations
    pub fn memory_segments(&self) -> &[MemorySegment] {
        const MAX: usize = 5;

        let count = (0..MAX)
            .take_while(|i| {
                // Safety: heapLocations should be provided by the OS, we're checking for null pointers
                // and null values, that's probably the best we can do
                if let Some(segment) = unsafe { self.heap_locations.add(*i).as_ref() } {
                    !segment.location.is_null()
                } else {
                    false
                }
            })
            .last()
            .unwrap_or_else(|| {
                panic!("pv.heapLocations.is_null");
            });

        // Safety: We've checked and the data at least seems to be valid. It is not expected to change
        // during the program's runtime, so effectively the lifetime is 'static
        unsafe { slice::from_raw_parts(self.heap_locations, count + 1) }
    }
}
