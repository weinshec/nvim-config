local M = {}

local _load_module = function(name)
  ok, module = pcall(require, name)
  if not ok then
    msg = "Error while loading " .. "'" .. name .. "'"
    vim.notify(msg, vim.log.levels.ERROR)
    return nil
  end
  return module
end

local _set_auto_tabshift = function(filetypes)
  for filetype, size in pairs(filetypes) do
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetype,
      callback = function()
        vim.opt.shiftwidth = size
        vim.opt.tabstop = size
      end,
    })
  end
end

M.load_module = _load_module
M.set_auto_tabshift = _set_auto_tabshift

return M
