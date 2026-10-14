# NullShell
<img width="3520" height="920" alt="110540" src="https://github.com/user-attachments/assets/180b0dcd-ac26-48f7-bab5-c9eacd6c37a3" />

**Build any Java Android app into a signed, installable APK — right inside Termux.**
No Android Studio. No Gradle. No PC. Just one command.

![Platform](https://img.shields.io/badge/Platform-Termux-black?style=for-the-badge)
![Language](https://img.shields.io/badge/Java-Build-red?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-1.4-green?style=for-the-badge)
## Contributors

- [@krishn-145](https://github.com/krishn-145)
- [@kalidroid](https://github.com/kalidroid)
---

## 👤 Owner

<div align="center">

**Hari Jadhav Ji**

| Platform | Handle | Link |
|---|---|---|
| 💬 Telegram | `nullkrishn` | https://t.me/nullkrishn |
| 🐙 GitHub | `nullkrishn3` | https://github.com/nullkrishn3 |
| 📸 Instagram | `ur_.krishn_02` | https://instagram.com/ur_.krishn._02 |

</div>

> **NullShell** is created and owned by **Hari Jadhav Ji**. The owner identity block is
> tamper-protected — see [Protection](#-tamper-protection).

---

## ✨ Features

- 🚀 **One command build** — put all your code in one folder, run `NullShell`, get an APK.
- 📱 **Installs on ANY device (Android 5 → 16+)** — forces a modern, install-friendly
  `minSdk`/`targetSdk` at build time, so old manifests don't cause "App not installed".
- 🧰 **Auto setup** — installs Java, `aapt2`, `apksigner`, `d8`/`dx`, `zip` on first run.
- 📦 **Bundled `android.jar`** — ships inside the package, so **no internet download** needed.
- 🔎 **Smart manifest discovery** — finds `AndroidManifest.xml` even in nested subfolders.
- 🪄 **Auto starter app** — if a folder has no project, it scaffolds a working demo and builds it.
- 🌈 **Colorful banner + colored steps** — bright, clean terminal output.
- 🌐 **Global command** — `NullShell` works from any folder, even after you close Termux.
- 🔐 **Auto signing** — debug keystore, signed with v1 + v2 + v3 schemes.
- ♻️ **AIDE Pro friendly** — understands `src/`, `java/`, `gen/` and `app/src/main/` layouts.
- 🛡️ **Tamper protected** — owner block cannot be changed without blocking the tool.

---

## 📥 Installation

```bash
pkg update && pkg upgrade -y
termux-setup-storage
git clone https://GitHub.com/nullkrishn90/NullShell.git
cd NullShell
chmod +x install.sh
bash install.sh
```
# Start 
```
chmod +x nullshell
./nullshell /folder/name/download
```
chmod +x 
`install.sh` runs `bash nullshell --install`, which copies the tool (and the bundled
`android.jar`) so you can call `NullShell` from anywhere.

> ⚠️ **`Is a directory` error?** If you extracted the ZIP you get a **folder** named
> `NullShell`. Run the script **inside** it: `bash ~/NullShell/nullshell`, or just run
> `bash ~/NullShell/install.sh` once — after that type `NullShell` anywhere.

---

## 🚀 Usage

```bash
mkdir -p ~/myapp && cd ~/myapp
# put AndroidManifest.xml, src/, res/ here (all your code)
NullShell
```

The signed APK appears at `~/myapp/NullShell/<AppName>.apk` and is also copied to
`/sdcard/Download/`.
```
### Commands

| Command | What it does |
|---|---|
| `NullShell` | Build the current folder |
| `NullShell <dir>` | Build the given folder (finds nested manifests too) |
| `NullShell --setup` | Install tools + android.jar + keystore only |
| `NullShell --install` | Install as a global command (`NullShell` / `nullshell`) |
| `NullShell --owner` | Show owner details |
| `NullShell --help` | Show help |

---

## 📱 Installs on any Android device

Old projects often declare a very old `targetSdkVersion`. Newer Android **blocks**
installing such APKs:

| Android version | Minimum `targetSdkVersion` to install |
|---|---|
| Android 14 (API 34) | 23 |
| Android 15 (API 35) | 24 |
| Android 16 / 17 (API 36/37) | 24 |

NullShell **forces `minSdkVersion=21` and `targetSdkVersion=30`** while building (on a
temporary copy — your manifest is never modified). Result: the APK installs cleanly from
**Android 5.0 all the way to Android 16/17/18**. You can override if you want:

```bash
NULLSHELL_MIN_SDK=24 NULLSHELL_TARGET_SDK=34 NullShell
```

> **Still "App not installed"?** Usually one of these:
> 1. An older version with a **different signature** is installed → uninstall it first.
> 2. The APK copied incompletely → rebuild / recopy.
> 3. Play Protect warning → tap **Install anyway**.

---

## 📁 Project structure it understands

```
MyApp/
├── AndroidManifest.xml        # required
├── src/                       # .java sources  (or java/  or  app/src/main/java/)
│   └── com/example/app/MainActivity.java
├── res/                       # layouts, values, drawables  (or app/src/main/res/)
├── assets/                    # optional
└── libs/*.jar                 # optional libraries
```

---

## 🔧 How it works

```
Java sources + res/ + AndroidManifest.xml
        │
        ├─ 1. aapt2 compile      → resources compiled
        ├─ 2. aapt2 link         → base.apk + R.java  (min/target SDK forced)
        ├─ 3. javac              → .class files
        ├─ 4. d8 / dx            → classes.dex
        ├─ 5. zip + zipalign     → packaged + aligned
        └─ 6. apksigner          → signed (v1+v2+v3), installable APK
```

## 🛡️ Tamper Protection

NullShell carries a **SHA-256 seal** over its owner identity block. At every startup it
recomputes the seal and compares. Any change to the owner block → **TAMPER DETECTED**,
the tool is blocked.

> **Note (honest):** a strong deterrent, not unbreakable magic — no pure shell script can
> be fully tamper-proof. Casual editing of the owner name is detected and blocked, and
> the original credits always remain in the header and this README.

---

## 📜 License

Released under the **MIT License**. Created and owned by **Hari Jadhav Ji** — keep the credits intact.

---

<div align="center">

**Made with ❤️ by Hari Jadhav Ji**
Telegram [@nullkrishn](https://t.me/nullkrishn) · GitHub [@nullkrishn3](https://github.com/nullkrishn3) · Instagram [@ur_.krishn_02](https://instagram.com/ur_.krishn._02)

</div>
