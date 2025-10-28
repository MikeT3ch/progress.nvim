# progress.nvim
Utility built around nvim-notify, send notifications more simple and easy

- NO TESTING
- NO BENCHMARKING
- NO DOCS

JUST LUA CODE AND PRAYERS

put gif here:
gif

## HOW TO USE:
The utility have 2 types of notifications, static and progressive. Progressive have 3 principal "functions":
- .begin
- .report
- .done

For statics notifications you can:
```lua
local progress = require("progress")
local level = vim.log.levels.WARN
local custom_options = {speed = 100}
progress.static("First the message", level, custom_options)
```
![First notification](common/gifs/Process.gif) 

END OF THE README. BYE

