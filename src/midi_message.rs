//! Simple midi message implementation, ported directly from <https://github.com/RebelTechnology/OwlProgram/blob/develop/LibSource/MidiMessage.h>
pub use crate::ffi::midi_message::{MidiStatus, UsbMidi};
use num::FromPrimitive;

/// Simple midi message implementation, ported directly from <https://github.com/RebelTechnology/OwlProgram/blob/develop/LibSource/MidiMessage.h>
pub struct MidiMessage {
    port: u8,
    d0: u8,
    d1: u8,
    d2: u8,
}

impl MidiMessage {
    /// Create a new message from raw bytes
    pub fn new(port: u8, d0: u8, d1: u8, d2: u8) -> Self {
        Self { port, d0, d1, d2 }
    }

    /// Create a new Control Change message
    pub fn cc(ch: u8, cc: u8, value: u8) -> Self {
        Self::new(
            UsbMidi::USB_COMMAND_CONTROL_CHANGE as u8,
            MidiStatus::CONTROL_CHANGE as u8 | (ch & 0xf),
            cc & 0x7f,
            value & 0x7f,
        )
    }

    /// Create a new Program Change message
    pub fn pc(ch: u8, pc: u8) -> Self {
        Self::new(
            UsbMidi::USB_COMMAND_PROGRAM_CHANGE as u8,
            MidiStatus::PROGRAM_CHANGE as u8 | (ch & 0xf),
            pc & 0x7f,
            0,
        )
    }

    /// Create a new Pitch Bend message
    pub fn pb(ch: u8, mut bend: u16) -> Self {
        bend += 8192;
        Self::new(
            UsbMidi::USB_COMMAND_PITCH_BEND_CHANGE as u8,
            MidiStatus::PITCH_BEND_CHANGE as u8 | (ch & 0xf),
            (bend & 0x7f) as u8,
            ((bend >> 7) & 0x7f) as u8,
        )
    }

    /// Create a new Channel Pressure message
    pub fn cp(ch: u8, value: u8) -> Self {
        Self::new(
            UsbMidi::USB_COMMAND_CHANNEL_PRESSURE as u8,
            MidiStatus::CHANNEL_PRESSURE as u8 | (ch & 0xf),
            value & 0x7f,
            0,
        )
    }

    /// Create a new Note On message
    pub fn note_on(ch: u8, note: impl Into<u8>, velocity: u8) -> Self {
        Self::new(
            UsbMidi::USB_COMMAND_NOTE_ON as u8,
            MidiStatus::NOTE_ON as u8 | (ch & 0xf),
            note.into() & 0x7f,
            velocity & 0x7f,
        )
    }

    /// Create a new Note Off message
    pub fn note_off(ch: u8, note: impl Into<u8>) -> Self {
        Self::new(
            UsbMidi::USB_COMMAND_NOTE_OFF as u8,
            MidiStatus::NOTE_OFF as u8 | (ch & 0xf),
            note.into() & 0x7f,
            0,
        )
    }

    /// Midi port number
    pub fn port(&self) -> u8 {
        self.port >> 4
    }

    /// Midi channel number
    pub fn channel(&self) -> u8 {
        self.d0 & MidiStatus::MIDI_CHANNEL_MASK as u8
    }

    /// Status part of the first message byte
    pub fn status(&self) -> MidiStatus {
        MidiStatus::from_u8(self.d0 & MidiStatus::MIDI_STATUS_MASK as u8).unwrap()
    }

    /// Byte count of the message
    pub fn size(&self) -> u8 {
        UsbMidi::from_u8(self.port & 0x0f).map_or(0, |command| command.size())
    }

    /// Midi note value (valid when is_note() == true)
    pub fn note(&self) -> u8 {
        self.d1
    }

    /// Midi note velocity (valid when is_note() == true)
    pub fn velocity(&self) -> u8 {
        self.d2
    }

    /// Midi controller number (valid when is_control_change() == true)
    pub fn controller_number(&self) -> u8 {
        self.d1
    }

    /// Midi controller value (valid when is_control_change() == true)
    pub fn controller_value(&self) -> u8 {
        self.d2
    }

    /// Midi channel pressure (valid when is_channel_pressure() == true)
    pub fn channel_pressure(&self) -> u8 {
        self.d1
    }

    /// Poly Key Pressure
    pub fn poly_key_pressure(&self) -> u8 {
        self.d2
    }

    /// Program Change
    pub fn program_change(&self) -> u8 {
        self.d0
    }

    /// Pitch bend value
    pub fn pitch_bend(&self) -> u16 {
        (self.d1 as u16 | ((self.d2 as u16) << 7)) - 8192
    }

    /// Either a note-on or note-off message
    pub fn is_note(&self) -> bool {
        self.is_note_on() | self.is_note_off()
    }

    /// Checks the first byte for 0x90
    pub fn is_note_on(&self) -> bool {
        (self.status() == MidiStatus::NOTE_ON) && self.velocity() != 0
    }

    /// Checks the first byte for 0x80
    pub fn is_note_off(&self) -> bool {
        (self.status() == MidiStatus::NOTE_OFF)
            || ((self.status() == MidiStatus::NOTE_ON) && self.velocity() == 0)
    }

    /// Is this a sysex message?
    pub fn is_sys_ex(&self) -> bool {
        UsbMidi::from_u8(self.port & 0x0f).map_or(false, |command| command.is_sys_ex())
    }

    /// Is this a control change message?
    pub fn is_control_change(&self) -> bool {
        self.status() == MidiStatus::CONTROL_CHANGE
    }

    /// Is this a program change message?
    pub fn is_program_change(&self) -> bool {
        self.status() == MidiStatus::PROGRAM_CHANGE
    }

    /// Is this a channel pressure message?
    pub fn is_channel_pressure(&self) -> bool {
        self.status() == MidiStatus::CHANNEL_PRESSURE
    }

    /// Is this a poly key pressure message?
    pub fn is_poly_key_pressure(&self) -> bool {
        self.status() == MidiStatus::POLY_KEY_PRESSURE
    }

    /// Is this a pitch bend message?
    pub fn is_pitch_bend(&self) -> bool {
        self.status() == MidiStatus::PITCH_BEND_CHANGE
    }

    /// Raw bytes of message
    pub fn as_bytes(self) -> [u8; 4] {
        [self.port, self.d0, self.d1, self.d2]
    }
}

impl UsbMidi {
    fn size(&self) -> u8 {
        match self {
            UsbMidi::USB_COMMAND_SINGLE_BYTE | UsbMidi::USB_COMMAND_SYSEX_EOX1 => 1,
            UsbMidi::USB_COMMAND_PROGRAM_CHANGE
            | UsbMidi::USB_COMMAND_CHANNEL_PRESSURE
            | UsbMidi::USB_COMMAND_2BYTE_SYSTEM_COMMON
            | UsbMidi::USB_COMMAND_SYSEX_EOX2 => 2,
            UsbMidi::USB_COMMAND_NOTE_OFF
            | UsbMidi::USB_COMMAND_NOTE_ON
            | UsbMidi::USB_COMMAND_POLY_KEY_PRESSURE
            | UsbMidi::USB_COMMAND_CONTROL_CHANGE
            | UsbMidi::USB_COMMAND_PITCH_BEND_CHANGE
            | UsbMidi::USB_COMMAND_SYSEX
            | UsbMidi::USB_COMMAND_SYSEX_EOX3
            | UsbMidi::USB_COMMAND_3BYTE_SYSTEM_COMMON => 3,
            _ => 0,
        }
    }

    fn is_sys_ex(&self) -> bool {
        matches!(
            self,
            UsbMidi::USB_COMMAND_SYSEX
                | UsbMidi::USB_COMMAND_SYSEX_EOX1
                | UsbMidi::USB_COMMAND_SYSEX_EOX2
                | UsbMidi::USB_COMMAND_SYSEX_EOX3
        )
    }
}
