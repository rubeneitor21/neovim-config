-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local util = require 'lspconfig.util'

local log = require("vim.lsp.log")

vim.lsp.set_log_level("debug")


-- EXAMPLE
local servers = { "cssls", "astro", "jdtls", "ts_ls", "pylsp", "intelephense", "rust_analyzer", "emmet_ls", "clangd",
  "html", "cssls", "lemminx", "cmake", "csharp_ls" } -- html
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig["tailwindcss"].setup {
  
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  on_dir = function (bufnr, _)
    local root_files = {
      -- Generic
      'tailwind.config.js',
      'tailwind.config.cjs',
      'tailwind.config.mjs',
      'tailwind.config.ts',
      'postcss.config.js',
      'postcss.config.cjs',
      'postcss.config.mjs',
      'postcss.config.ts',
      -- Django
      'theme/static_src/tailwind.config.js',
      'theme/static_src/tailwind.config.cjs',
      'theme/static_src/tailwind.config.mjs',
      'theme/static_src/tailwind.config.ts',
      'theme/static_src/postcss.config.js',
    }


    return vim.fs.dirname(vim.fs.find(root_files, { path = bufnr, upward = true })[1])
  end,
  capabilities = nvlsp.capabilities,

  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "htmlangular", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "templ" },

  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidScreen = 'error',
        invalidVariant = 'error',
        invalidConfigPath = 'error',
        invalidTailwindDirective = 'error',
        recommendedVariantOrder = 'warning',
      },
      classAttributes = {
        'class',
        'className',
        'class:list',
        'classList',
        'ngClass',
      },
      includeLanguages = {
        eelixir = 'html-eex',
        elixir = 'phoenix-heex',
        eruby = 'erb',
        heex = 'phoenix-heex',
        htmlangular = 'html',
        templ = 'html',
      },
    },
  },

  -- lspconfig rootdir paste
  --
  root_dir = function(bufnr)
    local root_files = {
      -- Generic
      'tailwind.config.js',
      'tailwind.config.cjs',
      'tailwind.config.mjs',
      'tailwind.config.ts',
      'postcss.config.js',
      'postcss.config.cjs',
      'postcss.config.mjs',
      'postcss.config.ts',
      -- Django
      'theme/static_src/tailwind.config.js',
      'theme/static_src/tailwind.config.cjs',
      'theme/static_src/tailwind.config.mjs',
      'theme/static_src/tailwind.config.ts',
      'theme/static_src/postcss.config.js',
    }
    log.info("hola buenas tardes " .. bufnr)
    local fname = bufnr
    root_files = util.insert_package_json(root_files, 'tailwindcss', fname)
    -- root_files = util.root_markers --util.root_markers_with_field(root_files, { 'mix.lock', 'Gemfile.lock' }, 'tailwind', bufnr)
    -- on_dir(vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1]))
    return util.root_pattern(root_files)(bufnr)
  end,
  root_markers = {"tailwindcss.config.mjs", "postcss.config.mjs"}
}

-- log.info("Patata voladora " .. lspconfig["tailwindcss"].setup.root_dir)

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
