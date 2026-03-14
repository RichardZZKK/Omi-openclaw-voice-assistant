# Omi -- OpenClaw Voice Companion 小龙虾语音伙伴模块

## 为什么这个项目值得用

- **本地语音识别，不为日常监听额外消耗 token**
- **支持 ElevenLabs，可实现更自然、生动、角色化的声音体验，也支持基于声音片段素材来自定义和克隆音色**
- **同时提供中文和英文脚本版本，适合不同语言场景**
- **后续可以自行修改伙伴名字、提示词和唤醒词，做成真正属于自己的版本**

这个项目让 **运行在 macOS 上的 OpenClaw** 不再只是一个文字助手，而是真正拥有属于自己的声音。  
你不仅可以和它说话，还可以决定它怎么说话：选择你喜欢的音色、克隆你想要的角色声线，甚至把它塑造成你心目中的声音形象，让它成为一个真正属于你的会说话的伙伴。  
后续你也可以继续自行修改伙伴的名字、提示词和唤醒词，让它逐步变成你最想要的那个语音伙伴。  

注意：
- 如果你使用的是 **Mac mini**，由于设备本身没有内置麦克风，还需要额外连接一个麦克风才能正常使用语音输入功能。

English version: [README_EN.md](./README_EN.md)

## 功能
- 常驻监听唤醒词
- 基于 macOS Speech.framework 的本地语音识别
- 语音活动检测（VAD）自动结束录音
- ElevenLabs TTS 缓存播放，未配置时自动回退到 macOS `say`

## 环境要求
- macOS
- Python 3.11+
- 已安装并可正常使用的 OpenClaw
- Terminal 已获得麦克风权限
- 系统可用 `swiftc`

## 安装
下面这套步骤按顺序做，小白也可以直接照着执行。

### 1. 打开终端
在 macOS 里打开 `Terminal`。

最常用的方法：
- 按 `Command + Space`
- 输入 `Terminal`
- 回车

### 2. 进入项目目录
如果你已经把项目下载到本地，先进入项目目录：

```bash
cd /你的项目路径/omi-voice-assistant
```

如果你已经在这个项目目录里，可以用下面命令确认：
```bash
pwd
ls
```

你应该能看到这些文件：
- `voice_assistant.py`
- `voice_assistant_en.py`
- `requirements.txt`

### 3. 确认 Python 3 可用
运行：

```bash
python3 --version
```

如果看到类似：

```bash
Python 3.11.x
```

说明 Python 3 已经可用。

如果这里报错，先安装 Python 3，再继续下面步骤。

### 4. 确认 pip3 可用
运行：

```bash
pip3 --version
```

如果能看到版本号，说明 `pip3` 可用。

### 5. 安装依赖
在项目目录里运行：

```bash
pip3 install -r requirements.txt
```

安装成功后，通常会看到类似：
- `Successfully installed ...`

### 6. 如果安装时报权限错误
如果你看到类似 `Permission denied` 或 `externally-managed-environment`，优先用下面这个方式：

```bash
python3 -m pip install --user -r requirements.txt
```

这样会把依赖安装到你自己的用户目录里，通常更稳。

### 7. 如果安装时报某个包失败
你可以先升级 pip 再重试：

```bash
python3 -m pip install --upgrade pip
python3 -m pip install --user -r requirements.txt
```

### 8. 验证安装是否完成
安装完后，你可以先测试列出麦克风设备：

```bash
python3 voice_assistant.py --list-devices
```

如果能看到设备列表，说明核心依赖基本已经装好了。

### 9. 首次运行时的系统权限
第一次运行语音助手时，macOS 可能会弹出权限请求。

你需要允许：
- `麦克风`
- `语音识别`（如果系统弹出）

如果没有弹窗，也可以手动去这里检查：
- `系统设置 -> 隐私与安全性 -> 麦克风`
- `系统设置 -> 隐私与安全性 -> 语音识别`

确保 `Terminal` 已被允许。

## 可选配置
如果你想使用 ElevenLabs 音色：
```bash
export ELEVENLABS_API_KEY="your_key"
export ELEVENLABS_VOICE_ID="your_voice_id"
```

如果没有配置上述变量，项目会自动回退到 macOS `say`，但就无法使用更生动、更自然、可自定义或可克隆的音色。

你可以在 ElevenLabs 这里选择或创建你想要的音色：
- [https://elevenlabs.io](https://elevenlabs.io)

## 脚本版本
### 中文版
文件：`voice_assistant.py`

默认特性：
- 唤醒词：`hi omi` / `omi` / `欧米`
- 中文优先转写
- 更适合中文对话场景

启动：
```bash
python3 voice_assistant.py --device 1
```

### 英文版
文件：`voice_assistant_en.py`

默认特性：
- Wake phrases: `hi omi` / `hey omi` / `omi`
- English-first transcription
- Better suited for English conversations

启动：
```bash
python3 voice_assistant_en.py --device 1
```

## 查看麦克风设备
中文版：
```bash
python3 voice_assistant.py --list-devices
```

英文版：
```bash
python3 voice_assistant_en.py --list-devices
```

## 作者
- Ric4
