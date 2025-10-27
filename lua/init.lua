-- uses vim.notify = require('notify')
local M = {}

local config = {
  default_frames = { "🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "🟤", "⚫" },
  default_speed = 150
}

function M.setup(opts)
  config = vim.tbl_extend("force", config, opts or {}) -- dont know how to deal with vim.thing stuff
end

function M.notif_static(msg, level, opts)
  opts = opts or {}
  vim.notify(msg, level or vim.log.levels.INFO, opts)
end

local notif_data = {}

local function get_notif_data(key)
  if not notif_data[key] then
    notif_data[key] = {}
  end
  return notif_data[key]
end

local function update_spinner(key)
  local data = get_notif_data(key)
  if data.spinner and data.spinner_frames then
    local new_spinner = (data.spinner % #data.spinner_frames) + 1
    data.spinner = new_spinner
    data.notification = vim.notify(data.last_message or "", data.last_level or vim.log.levels.INFO, {
      icon = data.spinner_frames[new_spinner],
      replace = data.notification,
      hide_from_history = true,
      timeout = false,
      title = data.title,
    })
    vim.defer_fn(function()
      update_spinner(key)
    end, data.speed or config.default_speed)
  end
end


return M
