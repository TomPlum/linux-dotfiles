#!/bin/sh

# Configure Pulse Audio Settings - Discord Screen Share

# Sink = Audio Output (Screen Share)
# Source = Audio Input (Microphone / Webcam)
# Client = Running Program w/Audio
# Source Output = Client Audio Source
# Sink Input = Sink Audio Source

# Sources can be listed with: pactl list short sources
# Sinks can be listed with: pactl list short sinks
# Clients can be listed with: pactl list short clients
# Source Ouputs can be listed with: pactl list short source-outputs
# Sink Inputs can be listed with: pactl list short sink-inputs

# Create 2 Virutal Sinks
pactl load-module module-null-sink sink_name=Virtual1 sink_properties=device.description=Screen Share
pactl load-module module-null-sink sink_name=Virtual2 sink_properties=device.description=Just Screen

# Loopback Microphone to Virutal1
pactl load-module module-loopback latency_msec=1 sink=Virtual1

# Loopback Virtual2s Monitor to Virtual1
pactl load-module module-loopback latency_msec=1 sink=Virtual1 source=Virtual2.monitor

# Loopback Virtual2s Monitor to Audio Input Source (Logitech C920 Webcam)
pactl load-module module-loopback latency_msec=1 sink=2 source=Virtual2.monitor

# Pulse Audio Configuration (Can be done manually in GUI if needs be)
# Input Device - Set Fallback to Virutal1s Monitor
pactl set-default-source Virtual1.monitor

# Output Device - Set Default to Analog Stereo
pactl set-default-sink 1

# Recording - Set Virutal1s Monitor to Discord
pactl move-source-output 99 Virtual1.monitor

# Playback - Set Virutal2 to Screen Share Source (Firefox, Chrome ect..)
pactl move-sink-input 47 Virtual2
