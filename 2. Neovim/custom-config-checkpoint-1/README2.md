The language server for lua does not have "support" Neovim's lua API out the box. 
You won't get code completion for Neovim's built-in functions and you may see some annoying warnings.
To get some basic support for Neovim, create a file called .luarc.json in your Neovim config folder 
(next to your init.lua file). Then add this content.
