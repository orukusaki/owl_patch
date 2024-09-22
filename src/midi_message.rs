use crate::ffi::midi_message as ffi;

const MIDI_CHANNEL_MASK: u8 = ffi::MIDI_CHANNEL_MASK as u8;
const MIDI_STATUS_MASK: u8 = ffi::MIDI_STATUS_MASK as u8;
const USB_COMMAND_SINGLE_BYTE: u8 = ffi::USB_COMMAND_SINGLE_BYTE as u8;
const USB_COMMAND_SYSEX_EOX1: u8 = ffi::USB_COMMAND_SYSEX_EOX1 as u8;
const USB_COMMAND_PROGRAM_CHANGE: u8 = ffi::USB_COMMAND_PROGRAM_CHANGE as u8;
const USB_COMMAND_CHANNEL_PRESSURE: u8 = ffi::USB_COMMAND_CHANNEL_PRESSURE as u8;
const USB_COMMAND_2BYTE_SYSTEM_COMMON: u8 = ffi::USB_COMMAND_2BYTE_SYSTEM_COMMON as u8;
const USB_COMMAND_SYSEX_EOX2: u8 = ffi::USB_COMMAND_SYSEX_EOX2 as u8;
const USB_COMMAND_NOTE_OFF: u8 = ffi::USB_COMMAND_NOTE_OFF as u8;
const USB_COMMAND_NOTE_ON: u8 = ffi::USB_COMMAND_NOTE_ON as u8;
const USB_COMMAND_POLY_KEY_PRESSURE: u8 = ffi::USB_COMMAND_POLY_KEY_PRESSURE as u8;
const USB_COMMAND_CONTROL_CHANGE: u8 = ffi::USB_COMMAND_CONTROL_CHANGE as u8;
const USB_COMMAND_PITCH_BEND_CHANGE: u8 = ffi::USB_COMMAND_PITCH_BEND_CHANGE as u8;
const USB_COMMAND_SYSEX: u8 = ffi::USB_COMMAND_SYSEX as u8;
const USB_COMMAND_SYSEX_EOX3: u8 = ffi::USB_COMMAND_SYSEX_EOX3 as u8;
const USB_COMMAND_3BYTE_SYSTEM_COMMON: u8 = ffi::USB_COMMAND_3BYTE_SYSTEM_COMMON as u8;
const NOTE_ON: u8 = ffi::NOTE_ON as u8;
const NOTE_OFF: u8 = ffi::NOTE_OFF as u8;
const CONTROL_CHANGE: u8 = ffi::CONTROL_CHANGE as u8;
const PROGRAM_CHANGE: u8 = ffi::PROGRAM_CHANGE as u8;
const CHANNEL_PRESSURE: u8 = ffi::CHANNEL_PRESSURE as u8;
const POLY_KEY_PRESSURE: u8 = ffi::POLY_KEY_PRESSURE as u8;
const PITCH_BEND_CHANGE: u8 = ffi::PITCH_BEND_CHANGE as u8;

/// Simple midi message implementation, ported directly from <https://github.com/RebelTechnology/OwlProgram/blob/develop/LibSource/MidiMessage.h>
pub struct MidiMessage {
    port: u8,
    d0: u8,
    d1: u8,
    d2: u8,
}

impl MidiMessage {
    pub fn new(port: u8, d0: u8, d1: u8, d2: u8) -> Self {
        Self { port, d0, d1, d2 }
    }

    /// Create a new Control Change message
    pub fn cc(ch: u8, cc: u8, value: u8) -> Self {
        Self::new(
            USB_COMMAND_CONTROL_CHANGE,
            CONTROL_CHANGE | (ch & 0xf),
            cc & 0x7f,
            value & 0x7f,
        )
    }

    /// Create a new Program Change message
    pub fn pc(ch: u8, pc: u8) -> Self {
        Self::new(
            USB_COMMAND_PROGRAM_CHANGE,
            PROGRAM_CHANGE | (ch & 0xf),
            pc & 0x7f,
            0,
        )
    }

    /// Create a new Pitch Bend message
    pub fn pb(ch: u8, mut bend: u16) -> Self {
        bend += 8192;
        Self::new(
            USB_COMMAND_PITCH_BEND_CHANGE,
            PITCH_BEND_CHANGE | (ch & 0xf),
            (bend & 0x7f) as u8,
            ((bend >> 7) & 0x7f) as u8,
        )
    }

    /// Create a new Channel Pressure message
    pub fn cp(ch: u8, value: u8) -> Self {
        Self::new(
            USB_COMMAND_CHANNEL_PRESSURE,
            CHANNEL_PRESSURE | (ch & 0xf),
            value & 0x7f,
            0,
        )
    }

    /// Create a new Note On message
    pub fn note_on(ch: u8, note: u8, velocity: u8) -> Self {
        Self::new(
            USB_COMMAND_NOTE_ON,
            NOTE_ON | (ch & 0xf),
            note & 0x7f,
            velocity & 0x7f,
        )
    }

    /// Create a new Note Off message
    pub fn note_off(ch: u8, note: u8) -> Self {
        Self::new(USB_COMMAND_NOTE_OFF, NOTE_OFF | (ch & 0xf), note & 0x7f, 0)
    }

    pub fn port(&self) -> u8 {
        self.port >> 4
    }

    pub fn channel(&self) -> u8 {
        self.d0 & MIDI_CHANNEL_MASK
    }

    pub fn status(&self) -> u8 {
        self.d0 & MIDI_STATUS_MASK
    }

    pub fn size(&self) -> u8 {
        match self.port & 0x0f {
            USB_COMMAND_SINGLE_BYTE | USB_COMMAND_SYSEX_EOX1 => 1,
            USB_COMMAND_PROGRAM_CHANGE
            | USB_COMMAND_CHANNEL_PRESSURE
            | USB_COMMAND_2BYTE_SYSTEM_COMMON
            | USB_COMMAND_SYSEX_EOX2 => 2,
            USB_COMMAND_NOTE_OFF
            | USB_COMMAND_NOTE_ON
            | USB_COMMAND_POLY_KEY_PRESSURE
            | USB_COMMAND_CONTROL_CHANGE
            | USB_COMMAND_PITCH_BEND_CHANGE
            | USB_COMMAND_SYSEX
            | USB_COMMAND_SYSEX_EOX3
            | USB_COMMAND_3BYTE_SYSTEM_COMMON => 3,
            _ => 0,
        }
    }

    pub fn note(&self) -> u8 {
        self.d1
    }

    pub fn velocity(&self) -> u8 {
        self.d2
    }

    pub fn controller_number(&self) -> u8 {
        self.d1
    }

    pub fn controller_value(&self) -> u8 {
        self.d2
    }

    pub fn channel_pressure(&self) -> u8 {
        self.d1
    }

    pub fn poly_key_pressure(&self) -> u8 {
        self.d2
    }

    pub fn program_change(&self) -> u8 {
        self.d0
    }

    pub fn pitch_bend(&self) -> u8 {
        let pb: u16 = (self.d1 as u16 | ((self.d2 as u16) << 7)) - 8192;

        pb as u8
    }

    pub fn is_note(&self) -> bool {
        self.is_note_on() | self.is_note_off()
    }

    pub fn is_note_on(&self) -> bool {
        (self.d0 & MIDI_STATUS_MASK == NOTE_ON) && self.velocity() != 0
    }

    pub fn is_note_off(&self) -> bool {
        (self.d0 & MIDI_STATUS_MASK == NOTE_OFF)
            || ((self.d0 & MIDI_STATUS_MASK == NOTE_ON) && self.velocity() == 0)
    }

    pub fn is_sys_ex(&self) -> bool {
        matches!(
            self.port,
            USB_COMMAND_SYSEX
                | USB_COMMAND_SYSEX_EOX1
                | USB_COMMAND_SYSEX_EOX2
                | USB_COMMAND_SYSEX_EOX3
        )
    }

    pub fn is_control_change(&self) -> bool {
        (self.d0 & MIDI_STATUS_MASK) == CONTROL_CHANGE
    }

    pub fn is_program_change(&self) -> bool {
        (self.d0 & MIDI_STATUS_MASK) == PROGRAM_CHANGE
    }

    pub fn is_channel_pressure(&self) -> bool {
        (self.d0 & MIDI_STATUS_MASK) == CHANNEL_PRESSURE
    }

    pub fn is_poly_key_pressure(&self) -> bool {
        (self.d0 & MIDI_STATUS_MASK) == POLY_KEY_PRESSURE
    }

    pub fn is_pitch_bend(&self) -> bool {
        (self.d0 & MIDI_STATUS_MASK) == PITCH_BEND_CHANGE
    }

    pub fn as_bytes(self) -> [u8; 4] {
        [self.port, self.d0, self.d1, self.d2]
    }
}
