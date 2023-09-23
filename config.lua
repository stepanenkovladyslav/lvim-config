-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.opt.relativenumber = true;
vim.opt.autoindent = true;
lvim.transparent_window = true;
require'lspconfig'.pyright.setup{}

-- Custom keymaps
lvim.keys.insert_mode['jk'] = "<ESC>" -- exit to normal mode

-- split window
lvim.keys.normal_mode['sv'] = "<C-w>v" -- split vertically
lvim.keys.normal_mode['sh'] = "<C-w>s" -- split horizontally
lvim.keys.normal_mode['se'] = "<C-w>=" -- make all splits equal size
lvim.keys.normal_mode['sx'] = ":close<CR>" -- close current split

-- Tabs
lvim.keys.normal_mode['to'] = ":tabnew<CR>" -- open new tab


lvim.plugins = {
  {"bluz71/vim-nightfly-colors"},
}

lvim.colorscheme = 'nightfly'

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "astro,css,eruby,html,htmldjango,javascriptreact,less,pug,sass,scss,svelte,typescriptreact,vue",
  callback = function()
    vim.lsp.start({
      cmd = { "emmet-language-server", "--stdio" },
      root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
      init_options = {
        --- @type table<string, any> https://docs.emmet.io/customization/preferences/
        preferences = {},
        --- @type "always" | "never" defaults to `"always"`
        showexpandedabbreviation = "always",
        --- @type boolean defaults to `true`
        showabbreviationsuggestions = true,
        --- @type boolean defaults to `false`
        showsuggestionsassnippets = false,
        --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
        syntaxprofiles = {},
        --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
        variables = {},
        --- @type string[]
        excludelanguages = {},
      },
    })
  end,
})

