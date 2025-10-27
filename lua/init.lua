-- uses vim.notify = require('notify')
local M = {}

local config = {
  default_frames = { "🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "🟤", "⚫" },
  default_speed = 150
}

function M.setup(opts)
  config = vim.tbl_extend("force", config, opts or {}) -- dont know how to deal with vim.thing stuff
end

function M.progress_static(msg, level, opts)
  opts = opts or {}
  vim.notify(msg, level or vim.log.levels.INFO, opts)
end

local notif_data = {}

local function get_notify_data(key)
  if not notif_data[key] then
    notif_data[key] = {}
  end
  return notif_data[key]
end

local function update_spinner(key)
  local data = get_notify_data(key)
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

function M.progress_progressive(key, title, opts)
  opts = opts or {}
  local spinner_frames = opts.spinner or config.default_frames
  local speed = opts.speed or config.default_speed
  local data = get_notify_data(key)
  data.title = title
  data.spinner_frames = spinner_frames
  data.speed = speed

  return {
    begin = function()

    end,
    report = function()

    end,
    done = function()

    end
  }
end

return M
