-- TODO: consider these default nvim-lint linters:
-- clojure = { "clj-kondo" },
-- dockerfile = { "hadolint" },
-- inko = { "inko" },
-- janet = { "janet" },
-- json = { "jsonlint" },
-- markdown = { "vale" },
-- rst = { "vale" },
-- ruby = { "ruby" },
-- terraform = { "tflint" },
-- text = { "vale" }

return {
  require 'config.plugins.lang.lua',
  require 'config.plugins.lang.python',
}
