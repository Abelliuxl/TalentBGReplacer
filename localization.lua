local L = {}

local locale = GetLocale()

if locale == "zhCN" then
    -- 简体中文
    L.TITLE = "天赋背景替换器"
    L.SELECT_SPEC = "选择专精"
    L.INPUT_HINT = "请将贴图放入 Interface\\AddOns\\TBRT\\（需手动新建此文件夹，以避免插件更新时覆盖您的背景图），只填写文件名，例如：frost.tga"
    L.SAVE = "保存贴图"
    L.CLEAR = "恢复默认"
    L.RELOAD = "重载界面"
    L.SET_SUCCESS = "✔ 已设置专精ID %d 的贴图为：%s"
    L.CLEAR_SUCCESS = "🗑 已清除专精ID %d 的贴图设置"
    L.LOAD_FAIL = "❗贴图加载失败：%s"
elseif locale == "ruRU" then
    -- Русский ZamestoTV
    L.TITLE = "Замена фона талантов"
    L.SELECT_SPEC = "Выбрать специализацию"
    L.INPUT_HINT = "Поместите текстуры в Interface\\AddOns\\TBRT\\ (создайте эту папку вручную, чтобы избежать перезаписи фоновых изображений при обновлении плагина). Указывайте только имя файла, например: frost.tga"
    L.SAVE = "Сохранить"
    L.CLEAR = "Сбросить"
    L.RELOAD = "Перезагрузка"
    L.SET_SUCCESS = "✔ Установлена текстура для ID специализации %d: %s"
    L.CLEAR_SUCCESS = "🗑 Очищена текстура для ID специализации %d"
    L.LOAD_FAIL = "❗ Не удалось загрузить текстуру: %s"
else
    -- 默认英文
    L.TITLE = "Talent BG Replacer"
    L.SELECT_SPEC = "Select Specialization"
    L.INPUT_HINT = "Place textures in Interface\\AddOns\\TBRT\\ (create this folder manually to avoid overwriting your background images during plugin updates). Only enter filename, e.g.: frost.tga"
    L.SAVE = "Save"
    L.CLEAR = "Reset"
    L.RELOAD = "Reload UI"
    L.SET_SUCCESS = "✔ Set texture for spec ID %d: %s"
    L.CLEAR_SUCCESS = "🗑 Cleared texture for spec ID %d"
    L.LOAD_FAIL = "❗Failed to load texture: %s"
end

TalentBGReplacer_L = L
