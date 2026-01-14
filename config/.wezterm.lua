local wezterm = require 'wezterm'
local act = wezterm.action

-- 创建配置对象
local config = wezterm.config_builder()

-- ==================== 1. 极致视觉（清纯、高级感） ====================

-- 主题：经典的东京之夜，柔和不刺眼
config.color_scheme = "Tokyo Night"

-- 窗口背景：0.85 透明度 + 30 浓度的毛玻璃（Mac 专属高级感）
config.window_background_opacity = 0.85
config.macos_window_background_blur = 30

-- 窗口装饰：隐藏标题栏，保留红绿灯。这让终端看起来像一块完整的玻璃
config.window_decorations = "RESIZE"

-- 字体配置（已根据你系统查到的 NF 版本修正）
config.font = wezterm.font_with_fallback({
  { 
    family = "Monaspace Radon NF", 
    weight = "Regular",
    -- 开启 Monaspace 标志性的字符间距自动优化
    harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
  },
  { family = "PingFang SC", weight = "Regular" }, -- 中文补全
})
config.font_size = 14.5
config.line_height = 1.2 -- 增加行高，让代码呼吸感更强

-- 标签栏样式：使其更小巧美观
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false -- 标签栏放顶部
config.hide_tab_bar_if_only_one_tab = true -- 只有一个标签时自动隐藏，节省空间

-- ==================== 2. 实用功能配置 ====================

config.default_prog = { '/bin/zsh', '--login' }
config.window_close_confirmation = 'NeverPrompt'
config.scrollback_lines = 5000 -- 增加回滚行数
-- 让左边的 Option 键变成 Meta 键（解决 Alt+C 不生效的问题）
config.send_composed_key_when_left_alt_is_pressed = false

-- 鼠标绑定：CMD+点击 自动打开链接
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CMD',
    action = act.OpenLinkAtMouseCursor,
  },
}

-- ==================== 3. 强悍的快捷键（Mac 深度适配） ====================

config.keys = {
  -- 【搜索与启动】
  -- CMD + P: 模糊搜索所有标签、命令、工作区（超级好用）
  { key = 'p', mods = 'CMD', action = act.ShowLauncherArgs { flags = 'FUZZY|TABS|LAUNCH_MENU_ITEMS|WORKSPACES' } },
  -- CMD + F: 搜索当前屏幕内容
  { key = 'f', mods = 'CMD', action = act.Search { CaseSensitiveString = "" } },

  -- 【分屏管理】
  -- CMD + D: 左右分屏
  { key = 'd', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  -- CMD + Shift + D: 上下分屏
  { key = 'D', mods = 'CMD|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  -- CMD + 方向键: 在分屏间跳转
  { key = 'LeftArrow', mods = 'CMD', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'CMD', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow', mods = 'CMD', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = 'CMD', action = act.ActivatePaneDirection 'Down' },
  -- CMD + Z: 最大化/还原当前分屏
  { key = 'z', mods = 'CMD', action = act.TogglePaneZoomState },

  -- 【标签页管理】
  { key = 't', mods = 'CMD', action = act.SpawnTab 'DefaultDomain' },
  { key = 'w', mods = 'CMD', action = act.CloseCurrentTab { confirm = false } },
  -- CMD + [ 或 ]: 切换左右标签页
  { key = '[', mods = 'CMD', action = act.ActivateTabRelative(-1) },
  { key = ']', mods = 'CMD', action = act.ActivateTabRelative(1) },

  -- 【字体缩放】
  { key = '=', mods = 'CMD', action = act.IncreaseFontSize },
  { key = '-', mods = 'CMD', action = act.DecreaseFontSize },
  { key = '0', mods = 'CMD', action = act.ResetFontSize },

  -- 【剪贴板】
  { key = 'c', mods = 'CMD', action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CMD', action = act.PasteFrom 'Clipboard' },
}

-- ==================== 4. 动态状态栏（右上角：工作目录 + CPU + 内存 + 时间） ====================

wezterm.on('update-right-status', function(window, pane)
  -- 1. 获取当前工作目录（只显示文件夹名，不显示长路径）
  local cwd = ""
  local uri = pane:get_current_working_dir()
  if uri then
    cwd = uri.file_path:sub(8):gsub("([^/]+)$", "%1")
    cwd = wezterm.format {
      { Foreground = { Color = '#7aa2f7' } },
      { Text = wezterm.nerdfonts.oct_file_directory .. " " .. cwd .. "  " },
    }
  end

  -- 2. 获取当前时间
  local date = wezterm.strftime('%H:%M:%S')

  window:set_right_status(wezterm.format {
    cwd,
    { Foreground = { Color = '#bb9af7' } },
    { Text = wezterm.nerdfonts.md_clock .. " " .. date .. " " },
  })
end)

-- ==================== 5. 渲染引擎优化 ====================
config.front_end = "WebGpu" -- 使用 GPU 加速渲染，文字更清晰，输入不延迟

return config