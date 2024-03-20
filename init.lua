local present, impatient = pcall(require, "impatient")

if present then
 impatient.enable_profile()
end

-- Plugin files
require "plugins"

-- Setting files
require "settings.theme"
require "mappings"
require "search"
require "basic"
require "lsp"
require "theme"

