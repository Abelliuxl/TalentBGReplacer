# TalentBGReplacer

Author: Abelliu12345
Version: 1.0
Compatible with: World of Warcraft Retail (11.15+)

---

## 📌 Addon Description

**TalentBGReplacer** is a lightweight UI customization addon that allows you to assign custom background textures for each class specialization, replacing Blizzard’s default talent panel background.

---

## 🎨 Texture Requirements

- Supported formats: `.tga`, `.png` (other formats not tested)
- Recommended resolution: `2048x1024` (any size works)
- Textures **must be placed in** the following folder (create it manually):
  `Interface\AddOns\TBRT\`

✅ Example file path:

`Interface\AddOns\TBRT\frost_dk.tga`

You only need to enter the filename in the addon, such as `frost_dk.tga` — do not include the full path.

---

## ⚙️ How to Use

1. Type `/tbr` in chat to open the config panel
2. Select a specialization from the dropdown
3. Enter the filename of your texture (e.g., `frost_dk.tga`)
4. Click **Save Texture**
5. Open your talent panel to see the applied texture

---

## 💡 FAQ

**Q: My texture isn’t showing up?**

- Is the file in `Interface\AddOns\TBRT\`?
- Is the filename correct (case-sensitive)?
- Is the file corrupted or oversized?
- Try reloading the UI with `/reload`

---

## 🧠 Technical Notes

- The addon overlays a custom texture above Blizzard’s default background
- Specializations are automatically detected using `GetSpecializationInfo()`
- Each spec’s background is saved in `SavedVariables`
- Textures are applied with a short delay (~0.05s) to avoid UI conflicts
- The config panel supports ESC to close

---

## 🧪 Commands

| Command   | Description                 |
|----------|-----------------------------|
| `/tbr`   | Open or close config panel  |
| `/reload`| Reload UI to test textures  |

---

## 📦 File Structure

```
TalentBGReplacer/
├── TalentBGReplacer.lua
├── localization.lua
├── TalentBGReplacer.toc
TBRT/
└── frost_dk.tga  ← your custom texture
```

---

## 📫 Contact

Feedback, suggestions, or custom texture contributions are welcome!
You can reach me via:

- 📧 Email: 562503971@qq.com

---

# TalentBGReplacer 天赋背景替换器

作者：Abelliu12345
版本：1.0
支持版本：魔兽世界正式服 11.15+

---

## 📌 插件简介

**TalentBGReplacer** 是一个轻量级界面美化插件，允许你为每个职业专精设置不同的自定义背景贴图，用于替换暴雪默认的天赋页面背景。

---

## 🎨 贴图说明

- 支持格式：`.tga`、`.png`（其他格式未测试）
- 推荐分辨率：`2048x1024`（任意尺寸也支持）
- 贴图文件必须放入以下文件夹中（需手动创建）：
  `Interface\AddOns\TBRT\`

✅ Example file path:

`Interface\AddOns\TBRT\frost_dk.tga`

在设置中只需填写文件名，例如 `frost_dk.tga`，不需要路径。

---

## ⚙️ 使用方法

1. 输入 `/tbr` 打开插件设置界面
2. 在下拉菜单中选择一个专精（如邪DK）
3. 输入贴图文件名（如 `frost_dk.tga`）
4. 点击“保存贴图”按钮
5. 打开天赋页面即可看到贴图效果

---

## 💡 常见问题

**Q: 为什么贴图没有显示？**

- 文件是否位于 `Interface\AddOns\TBRT\` 中？
- 文件名是否拼写正确（大小写敏感）？
- 图片是否损坏或尺寸异常？
- 可以尝试使用 `/reload` 重载界面进行测试

---

## 🧠 技术细节

- 插件会在暴雪默认背景之上覆盖一张自定义贴图
- 使用 API 自动识别当前职业专精，无需手动配置
- 每个专精的贴图设置将保存于 `SavedVariables` 中
- 加载贴图时有短暂延迟（约 0.05 秒）以避免与系统 UI 冲突
- 设置窗口支持 ESC 键关闭

---

## 🧪 指令说明

| 指令        | 功能说明         |
|-------------|------------------|
| `/tbr`      | 打开或关闭设置界面 |
| `/reload`   | 重载界面，立即测试贴图效果 |

---

## 📦 文件结构

TalentBGReplacer/
├── TalentBGReplacer.lua
├── localization.lua
├── TalentBGReplacer.toc
TBRT/
└── frost_dk.tga  ← 你的自定义贴图

---

## 📫 联系作者

欢迎反馈建议、提交贴图、报告问题！
你可以通过以下方式联系我：

- 📧 邮箱：562503971@qq.com
