local M = {}

local config = {
  default_frames = { "🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "🟤", "⚫" },
  default_speed = 150
}

function M.setup(opts)
  config = vim.tbl_extend("force", config, opts or {}) -- dont know how to deal with vim. stuff
end

local notif_data = {}

local function get_notif_data(key)
  if not notif_data[key] then
    notif_data[key] = {}
  end
  return notif_data[key]
end
