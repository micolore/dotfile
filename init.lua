local present, impatient = pcall(require, "impatient")

if present then
 impatient.enable_profile()
end

-- Plugin files
require "plugins"

-- Setting files
require "mappings"
require "basic"

-- theme
require "theme"

-- lsp
require "lsp.lsp"
require "lsp.rust"
require "lsp.snip"

-- search
require "search"

-- git 
require "git"

