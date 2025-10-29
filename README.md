# progress.nvim
Utility built around nvim-notify, send notifications more simple and easy

- NO TESTING
- NO BENCHMARKING
- NO DOCS

JUST LUA CODE AND PRAYERS

## HOW TO INSTALL:
Lazy: Add to your plugins table
```lua
{'MikeT3ch/progress.nvim'}
```

Locally with Lazy too:
```lua
{ 'MikeT3ch/progress.nvim', dir = "/path/to/progress.nvim" },
```

## HOW TO USE:
The utility have 2 types of notifications, static and progressive. 

### Statics Notifications

For statics notifications you can:
```lua
local progress = require("progress")
local level = vim.log.levels.WARN
progress.static("First the message", level)
```
![Static Notification](./common/gifs/Static1.gif) 

You can pass custom titles and other options like you would do in nvim-notify:
```lua
local progress = require("progress")
local level = vim.log.levels.WARN
local custom_options = {title= "Custom Title!"}
progress.static("First the message", level, custom_options)
```
![Static Notifification with title](./common/gifs/Static2.gif) 

### Progressive Notifications

Progressive have 3 principal "functions":
- .begin
- .report
- .done
You can use .begin to send the first notification to the screen, then .report to update the state of the same notification, and .done when you want to end the notification.
Here are some examples:
```lua
vim.notify = require("notify")
local prog = require("progress")
local notif = prog.progress_progressive("core_config", "Core Config")
notif.begin('🔧 Loading Configuration...') -- Init the notification

vim.defer_fn(function()
  notif.report('Report before the end of the notification...', vim.log.levels.WARN) -- You can pass the level using vim.log
end, 1000)

vim.defer_fn(function()
  notif.done('All done!...')
end, 5000)
```
![Progressive Notification](./common/gifs/Progressive1.gif) 

END OF THE README. BYE

