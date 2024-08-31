-- TODO: consider these default nvim-lint linters:
-- clojure = { "clj-kondo" },
-- dockerfile = { "hadolint" },
-- inko = { "inko" },
-- janet = { "janet" },
-- json = { "jsonlint" },
-- rst = { "vale" },
-- ruby = { "ruby" },
-- terraform = { "tflint" },

return {
  -- TODO: can I automatically require every file in config.plugins.lang instead of manually updating this list?
  require 'config.plugins.lang.c',
  require 'config.plugins.lang.lua',
  require 'config.plugins.lang.markdown',
  require 'config.plugins.lang.python',
  require 'config.plugins.lang.shell',
  require 'config.plugins.lang.text',
  require 'config.plugins.lang.vim',
}
