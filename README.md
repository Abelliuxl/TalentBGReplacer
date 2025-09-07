# TalentBGReplacer

[![WoW Version](https://img.shields.io/badge/WoW-Retail%2011.15%2B-blue.svg)](https://worldofwarcraft.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Author](https://img.shields.io/badge/Author-Abelliu12345-red.svg)](mailto:562503971@qq.com)

A lightweight World of Warcraft addon that allows you to customize the background texture of your talent panel for each class specialization.

---

## 📌 Table of Contents
1. [Description](#-addon-description)
2. [Features](#-features)
3. [Installation](#-installation)
4. [Usage](#-how-to-use)
5. [Texture Requirements](#-texture-requirements)
6. [FAQ](#-faq)
7. [Technical Details](#-technical-notes)
8. [Commands](#-commands)
9. [File Structure](#-file-structure)
10. [Contributing](#-contributing)
11. [Contact](#-contact)
12. [License](#-license)

---

## 📖 Addon Description

**TalentBGReplacer** is a UI customization addon for World of Warcraft. It provides a simple way to replace the default talent panel background with custom textures, unique to each of your class specializations. This allows for a more personalized and immersive gameplay experience.

---

## ✨ Features

- **Per-Specialization Textures**: Set a unique background for each of your class specs.
- **Easy Configuration**: Simple in-game UI to assign and manage textures.
- **Lightweight**: Minimal impact on game performance.
- **Persistent Settings**: Your texture choices are saved automatically.
- **Multi-language Support**: Available in English, Chinese (Simplified), and Russian.

---

## 📦 Installation

1. **Download**: Obtain the latest version of TalentBGReplacer.
2. **Extract**: Unzip the downloaded file into your World of Warcraft `_retail_/Interface/AddOns` directory.
    * The path should look like: `d:/Game/World of Warcraft/_retail_/Interface/AddOns/TalentBGReplacer/`
3. **Create Texture Directory**: Inside the `AddOns` folder, create a new folder named `TBRT`.
    * The path should be: `d:/Game/World of Warcraft/_retail_/Interface/AddOns/TBRT/`
4. **Add Textures**: Place your custom texture files (e.g., `frost_dk.tga`) inside the `TBRT` folder.
5. **Restart WoW**: Launch or restart World of Warcraft.
6. **Enable Addon**: Ensure TalentBGReplacer is enabled in your addon list (Character Screen -> AddOns).

---

## 🎨 Texture Requirements

- **Supported Formats**: `.tga`, `.png` (other formats are not officially supported).
- **Recommended Resolution**: `2048x1024` (though other sizes will also work and be scaled to fit).
- **Location**: All texture files **must** be placed in the `Interface\AddOns\TBRT\` directory.

✅ **Example File Path:**
```
Interface\AddOns\TBRT\frost_dk.tga
```

In the addon's configuration panel, you only need to enter the filename itself (e.g., `frost_dk.tga`), not the full path.

---

## ⚙️ How to Use

1. **Open Config Panel**: Type `/tbr` in the chat window and press Enter.
2. **Select Specialization**: Use the dropdown menu to choose the class specialization you want to customize.
3. **Enter Filename**: In the input box, type the filename of your desired texture (e.g., `beast_mastery_hunter.png`).
4. **Save Texture**: Click the **Save** button to apply the texture to the selected specialization.
    * A confirmation message will appear in your chat window.
5. **View Changes**: Open your talent panel (`N` key by default) to see the new background.
    * If the texture doesn't appear immediately, try `/reload` or check the [FAQ](#-faq).

**To clear a texture and revert to the default:**
1. Select the specialization.
2. Clear the text from the input box.
3. Click **Save** (or use the **Reset** button if available in your version).

---

## 💡 FAQ

**Q: My texture isn't showing up. What should I do?**
A: Please check the following:
- Is the texture file located in the correct folder (`Interface\AddOns\TBRT\`)?
- Is the filename in the config panel spelled correctly (including the file extension and case sensitivity)?
- Is the image file corrupted or an unsupported format? Try opening it with an image viewer.
- Try reloading your UI with the `/reload` command.

**Q: Can I use subfolders within the `TBRT` directory?**
A: No, the addon currently only supports placing files directly in the `TBRT` folder.

**Q: Does this addon work for all classes and specializations?**
A: Yes, it is designed to work with any class and any of its specializations.

**Q: Will my settings be saved if I update the addon?**
A: Yes, your texture settings are stored in WoW's SavedVariables and will persist through addon updates.

---

## 🧠 Technical Notes

- The addon functions by creating a new texture layer (`ARTWORK`) over the default Blizzard talent panel background (`PlayerSpellsFrame.TalentsFrame`).
- It automatically detects your current active specialization using the `GetSpecializationInfo()` API.
- Each specialization's texture setting is saved in the `TBR_DB` SavedVariables table.
- To prevent potential UI conflicts, there is a small, built-in delay (`C_Timer.After(0.05, ...)`) before applying the texture.
- The configuration panel is a movable frame that can be closed with the `ESC` key.

---

## 🧪 Commands

| Command   | Description                                 |
|----------|---------------------------------------------|
| `/tbr`   | Opens or closes the TalentBGReplacer config panel. |
| `/reload`| Reloads the user interface. Useful for testing new textures. |

---

## 📦 File Structure

```
World of Warcraft/_retail_/Interface/AddOns/
├── TalentBGReplacer/
│   ├── TalentBGReplacer.lua      # Main addon logic
│   ├── localization.lua          # Localization strings (enUS, zhCN, ruRU)
│   ├── TalentBGReplacer.toc      # Addon table of contents
│   └── README.md                 # This file
└── TBRT/                         <-- (You need to create this folder)
    ├── frost_dk.tga              <-- (Your custom textures go here)
    ├── fire_mage.png
    └── ... 
```

---

## 🤝 Contributing

Contributions are welcome! If you have a suggestion, bug report, or would like to contribute code or textures, please feel free to reach out.

**How to contribute:**
1. **Fork the repository** (if applicable).
2. **Create a new branch** for your feature or bugfix.
3. **Make your changes**.
4. **Test your changes** thoroughly in-game.
5. **Submit a pull request** or contact the author directly.

---

## 📫 Contact

For feedback, suggestions, bug reports, or to share your custom textures, you can contact the author:

- **Email**: [562503971@qq.com](mailto:562503971@qq.com)

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<br>

<div align="center">
    <strong>TalentBGReplacer 天赋背景替换器</strong>
    <br>A lightweight UI customization addon for World of Warcraft.
</div>
