# progress.nvim
Utility built around [nvim-notify](https://github.com/rcarriga/nvim-notify) and [this example](https://github.com/rcarriga/nvim-notify/wiki/Usage-Recipes) in their wiki, send notifications more simple and easy

- NO TESTING
- NO BENCHMARKING
- NO DOCS (kinda)

JUST LUA CODE AND PRAYERS, I STRONGLY RECOMMEND YOU TO READ AND USE [THIS EXAMPLE](https://github.com/rcarriga/nvim-notify/wiki/Usage-Recipes) IF YOU WANT TO USE ONLY THE NVIM-NOTIFY PLUGIN, THIS IS ONLY AN AUXILIAR TOOL 

## HOW TO INSTALL:
Lazy: Add to your plugins table
```lua
{
  'MikeT3ch/progress.nvim', 
  dependencies = { 'rcarriga/nvim-notify' }
}
```

Locally with Lazy too:
```lua
{ 
  'MikeT3ch/progress.nvim', 
  dependencies = { 'rcarriga/nvim-notify' },
  dir = "/path/to/progress.nvim" 
}
```

## HOW TO USE:
The utility have 2 types of notifications, static and progressive. 
These examples assume that you have set nvim-notify as your vim.notify handler:
```lua
vim.notify = require("notify")
```

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

```lua
vim.notify = require("notify")
local prog = require("progress")

-- CUSTOM SPINNERS TOO!!!!!
local custom_spinner = prog.spinners.material
local notif2 = prog.progress_progressive("Test_window", "Test Title",
  { speed = 100, spinner = custom_spinner })

notif2.begin('Hiiiiiiiiiii...')

vim.defer_fn(function()
  vim.defer_fn(function()
    notif2.report('Warning! ...', vim.log.levels.WARN)
  end, 1000)

  vim.defer_fn(function()
    notif2.done('All done!...')
  end, 3000)
end, 1000)
```
![Progressive Notification with custom spinner](./common/gifs/Progressive2.gif) 

You can see the built in spinners [here](./lua/progress/spinners.lua) 


END OF THE README. BYE

