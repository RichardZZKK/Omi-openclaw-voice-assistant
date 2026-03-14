# Omi -- OpenClaw Voice Companion

A local macOS voice front-end for OpenClaw.

## Why this project is useful

- **Local speech recognition, so always-listening input does not burn extra model tokens**
- **ElevenLabs support for more natural, expressive, and character-like voice output, with custom and cloned voices when you have suitable sample material**
- **Both Chinese and English script variants for different usage scenarios**
- **You can later rename the companion and change prompts or wake phrases to fit your own style**

This project helps **OpenClaw on macOS** become more than a text-based assistant by giving it a real voice.  
You can not only talk to it, but also decide how it sounds: choose a voice you like, clone a character voice you want, or shape it into the speaking companion you imagine.  
You can also keep customizing the companion's name, prompts, and wake phrases over time so it becomes your own version of a voice companion.  

Note:
- If you are using a **Mac mini**, you will need an external microphone because the machine does not include a built-in mic.

中文版: [README.md](./README.md)

## Features
- Always-listening wake phrase detection
- Local speech recognition using macOS Speech.framework
- Voice activity detection for automatic end-of-command capture
- ElevenLabs TTS with caching, with automatic fallback to macOS `say`

## Requirements
- macOS
- Python 3.11+
- OpenClaw installed and working in the shell
- Microphone permission granted to Terminal
- `swiftc` available

## Install
Follow these steps in order. This section is written for first-time users.

### 1. Open Terminal
On macOS, open `Terminal`.

The quickest way:
- Press `Command + Space`
- Type `Terminal`
- Press Enter

### 2. Go to the project folder
If you already downloaded the project, move into the folder first:

```bash
cd /path/to/omi-voice-assistant
```

If you are not sure whether you are in the right folder, run:
```bash
pwd
ls
```

You should see files like:
- `voice_assistant.py`
- `voice_assistant_en.py`
- `requirements.txt`

### 3. Check that Python 3 is available
Run:

```bash
python3 --version
```

If you see something like:

```bash
Python 3.11.x
```

then Python 3 is available.

### 4. Check that pip3 is available
Run:

```bash
pip3 --version
```

If it shows a version number, `pip3` is ready.

### 5. Install dependencies
From the project folder, run:

```bash
pip3 install -r requirements.txt
```

After a successful install, you will usually see:
- `Successfully installed ...`

### 6. If you get a permission error
If you see something like `Permission denied` or `externally-managed-environment`, use:

```bash
python3 -m pip install --user -r requirements.txt
```

This installs packages into your user directory and is usually the safest option.

### 7. If a package install fails
Try upgrading pip first, then retry:

```bash
python3 -m pip install --upgrade pip
python3 -m pip install --user -r requirements.txt
```

### 8. Verify the install
After installation, test the microphone listing:

```bash
python3 voice_assistant.py --list-devices
```

If you can see your microphone devices, the core dependencies are likely installed correctly.

### 9. macOS permissions on first run
The first time you run the assistant, macOS may ask for permissions.

Allow:
- `Microphone`
- `Speech Recognition` (if prompted)

If nothing pops up, check manually:
- `System Settings -> Privacy & Security -> Microphone`
- `System Settings -> Privacy & Security -> Speech Recognition`

Make sure `Terminal` is allowed.

## Optional configuration
For ElevenLabs voice output:
```bash
export ELEVENLABS_API_KEY="your_key"
export ELEVENLABS_VOICE_ID="your_voice_id"
```

If these variables are missing, the assistant falls back to macOS `say`, but you will lose the more expressive, natural, customizable, and cloneable voice options.

You can choose or create the voice you want here:
- [https://elevenlabs.io](https://elevenlabs.io)

## Script variants
### Chinese version
File: `voice_assistant.py`

Defaults:
- Wake phrases: `hi omi` / `omi` / `欧米`
- Chinese-first transcription
- Better suited for Chinese conversations

Run:
```bash
python3 voice_assistant.py --device 1
```

### English version
File: `voice_assistant_en.py`

Defaults:
- Wake phrases: `hi omi` / `hey omi` / `omi`
- English-first transcription
- Better suited for English conversations

Run:
```bash
python3 voice_assistant_en.py --device 1
```

## List microphones
Chinese version:
```bash
python3 voice_assistant.py --list-devices
```

English version:
```bash
python3 voice_assistant_en.py --list-devices
```

## Author
- Ric4
