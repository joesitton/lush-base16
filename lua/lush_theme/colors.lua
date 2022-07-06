local ok, lush = pcall(require, "lush")

if not ok then
    error("Could not load lush: " .. lush)
end

local hsl = lush.hsl

local colors = {
    black = hsl("#181818"),
    white = hsl("#f8f8f8"),
    red = hsl("#ab4642"),
    orange = hsl("#dc9656"),
    yellow = hsl("#f7ca88"),
    green = hsl("#a1b56c"),
    blue = hsl("#7cafc2"),
    cyan = hsl("#87c1b9"),
    purple = hsl("#ba8baf"),
}

for k, v in pairs(colors) do
    if string.sub(k, 1, 5) ~= "dark_" then
        colors["dark_" .. k] = v.darken(70)
    end
end

colors.fg = colors.white
colors.bg = colors.black.lighten(4)
colors.oceanblue = colors.blue
colors.skyblue = colors.blue
colors.magenta = colors.purple
colors.violet = colors.purple

return colors
