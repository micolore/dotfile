local present, impatient = pcall(require, "impatient")

if present then
 impatient.enable_profile()
end

-- Plugin files
require "plugins"

-- Setting files
require "mappings"
require "search"
require "basic"
require "lsp"
require "theme"

