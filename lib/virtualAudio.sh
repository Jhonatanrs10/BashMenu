#!/usr/bin/env sh
virtualPulseAudio(){
    #reset config
    pulseaudio -k
    #info
    pactl info
    #var
    Source="VirtualInput01"
    Sink="VirtualOutput01"
    Input="alsa_input.pci-0000_00_1b.0.analog-stereo"
    Output="alsa_output.pci-0000_00_1b.0.analog-stereo"

    #exec
    #pactl load-module module-null-sink sink_name=VirtualOutput01 sink_properties=device.description=VirtualOutput01

    pactl load-module module-null-sink sink_name=$Sink sink_properties=device.description=$Sink
    pactl load-module module-virtual-source source_name=$Source source_properties=device.description=$Source master=$Sink.monitor
    pactl load-module module-loopback source=$Source sink=$Sink
}
