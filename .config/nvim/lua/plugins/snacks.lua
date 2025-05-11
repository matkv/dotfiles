return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    dashboard = {
      width = 60,
      sections = function()
        local header = [[
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
]]
        local function greeting()
          local hour = tonumber(vim.fn.strftime("%H"))
          -- [02:00, 10:00) - morning, [10:00, 18:00) - day, [18:00, 02:00) - evening
          local part_id = math.floor((hour + 6) / 8) + 1
          local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
          local username = os.getenv("USER") or os.getenv("USERNAME") or "user"
          return ("Good %s, %s :)"):format(day_part, username)
        end

          -- stylua: ignore
          return {
            { padding = 0, align = "center", text = { header, hl = "header" } },
            { padding = 2, align = "center", text = { greeting(), hl = "header" } },
            { title = "Actions", indent = 0, padding = 1,
              { icon = " ", key = "f", desc = "Find File",       action = ":lua Snacks.dashboard.pick('files')" },
              { icon = " ", key = "n", desc = "New File",        action = ":ene | startinsert" },
              { icon = " ", key = "s", desc = "Restore Session", section = "session" },
              { icon = "", key = "o", desc = "Open Obsidian vault", action = ":e /mnt/c/Users/matko/Documents/Obsidian Vault/notepad.md"},
              { icon = " ", key = "q", desc = "Quit",            action = ":qa" } },
            { title = "Projects", section = "projects", indent = 0, padding = 1 },
            { title = "Neovim", indent = 0, padding = 2,
              { icon = " ", key = "c", desc = "Config",      action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})", },
              { icon = "󰒲 ", key = "l", desc = "Lazy",        action = ":Lazy" },
              { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
              { icon = "󱁤 ", key = "m", desc = "Mason",       action = ":Mason" },                          },
            { section = "startup" },
          }
      end,
    },
    git = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = true },
    statuscolumn = { enabled = true },
    terminal = { enabled = true },
    toggle = { enabled = true },
    words = { enabled = true },
    indent = { animate = { enabled = false } },
  },
}
