#!/bin/bash

$@

# Detect the operating system
OS="$(uname -s)"

case "$OS" in
    Darwin) # macOS
        say "done"
        ;;
    Linux)
        # Most Linux distributions
        if command -v spd-say > /dev/null; then
            spd-say "done"
        elif command -v espeak > /dev/null; then
            espeak "done"
        else
            echo "Speech utility not found"
        fi
        ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)
        # Windows subsystems in Unix-like environment, use PowerShell
        powershell.exe -Command "Add-Type –AssemblyName System.Speech; (New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak('done');"
        ;;
    *)
        echo "OS not supported for speech output"
        ;;
esac
