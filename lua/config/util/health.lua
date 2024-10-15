local check_external_reqs = function()
  -- Basic utils: `git`, `make`, `unzip`
  for _, exe in ipairs { 'git', 'make', 'unzip', 'rg' } do
    local is_executable = vim.fn.executable(exe) == 1
    if is_executable then
      vim.health.ok(string.format("Found executable: '%s'", exe))
    else
      vim.health.warn(string.format("Could not find executable: '%s'", exe))
    end
  end

  return true
end

return {
  check = function()
    vim.health.start 'config.nvim'

    vim.health.info [[
      NOTE: Not every warning is a 'must-fix' in `:checkhealth`. Fix only warnings for plugins and languages you intend to use.

      For example, Mason will warn you about uninstalled languages; you do not need to install those languages unless you intend to use them.
    ]]

    check_external_reqs()
  end,
}
