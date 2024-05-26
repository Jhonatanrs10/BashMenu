#!/usr/bin/env sh

virtualPulseAudioReset(){
	pulseaudio -k
}

virtualPulseAudioInfo(){
	pactl info
}

virtualPulseAudioVars(){
	Input="alsa_input.pci-0000_00_1b.0.analog-stereo"
    	Output="alsa_output.pci-0000_00_1b.0.analog-stereo"
}

virtualPulseAudioNullSink(){
	pactl load-module module-null-sink sink_name=$1 sink_properties=device.description=$1
}

virtualPulseAudioLoopback(){
	pactl load-module module-loopback source=$1 sink=$2 latency_msec=1
}

virtualPulseAudioRemap(){
	pactl load-module module-remap-source source_name=$1 source_properties=device.description=$1 master=$2
}

virtualPulseAudioNewInput(){
	pactl load-module module-virtual-source source_name=$1 source_properties=device.description=$1 master=$2
}

virtualPulseAudioSetDefault(){
	pactl set-default-sink "$1"
	pacmd set-default-source "$2"
}

testandoPA(){
	
	# Create the null sinks
	# virtual1 gets your audio sources (mplayer ...) that you want to hear and share
	# virtual2 gets all the audio you want to share (virtual1 + micro)
	pactl load-module module-null-sink sink_name=virtual1 sink_properties=device.description="Compartilhar-Audio" | tee -a "${module_file}"
	pactl load-module module-null-sink sink_name=virtual2 sink_properties=device.description="Intermediario" | tee -a "${module_file}"
	
	# Now create the loopback devices, all arguments are optional and can be configured with pavucontrol
	pactl load-module module-loopback source=virtual1.monitor sink="${SPEAKERS}" latency_msec=1 | tee -a "${module_file}"
	pactl load-module module-loopback source=virtual1.monitor sink=virtual2 latency_msec=1 | tee -a "${module_file}"
	pactl load-module module-remap-source source_name=virtual3 source_properties=device.description="Vmic" master=virtual2.monitor | tee -a "${module_file}"
	pactl load-module module-loopback source="${MICROPHONE}" sink=virtual2 latency_msec=1 | tee -a "${module_file}"
	
	# Make the default sink back to speakers
	pactl set-default-sink "${SPEAKERS}"
	pacmd set-default-source "virtual3"

}

virtualPulseAudioExec(){
	virtualPulseAudioReset
	virtualPulseAudioVars
	virtualPulseAudioNullSink "virtual1"
	virtualPulseAudioNullSink "virtual2"
	virtualPulseAudioLoopback "virtual1.monitor" "$Output"
	virtualPulseAudioLoopback "virtual1.monitor" "virtual2"
	virtualPulseAudioRemap "virtual3" "virtual2.monitor"
	#virtualPulseAudioNewInput "virtual3" "virtual2.monitor"
	virtualPulseAudioLoopback "$Input" "virtual2"
}

#virtualPulseAudioExec
