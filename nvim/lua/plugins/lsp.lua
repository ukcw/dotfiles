return {}
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       -- make sure mason installs the server
--       servers = {
--         ---@type lspconfig.options.tsserver
--         tsserver = {
--           keys = {
--             {
--               "<leader>co",
--               function()
--                 vim.lsp.buf.code_action({
--                   apply = true,
--                   context = {
--                     only = { "source.organizeImports.ts" },
--                     diagnostics = {},
--                   },
--                 })
--               end,
--               desc = "Organize Imports",
--             },
--           },
--           settings = {
--             typescript = {
--               format = {
--                 indentSize = vim.o.shiftwidth,
--                 convertTabsToSpaces = vim.o.expandtab,
--                 tabSize = vim.o.tabstop,
--               },
--             },
--             javascript = {
--               format = {
--                 indentSize = vim.o.shiftwidth,
--                 convertTabsToSpaces = vim.o.expandtab,
--                 tabSize = vim.o.tabstop,
--               },
--             },
--             completions = {
--               completeFunctionCalls = true,
--             },
--           },
--         },
--       },
--     },
--   },
--   {
--     "williamboman/mason.nvim",
--     opts = {
--       ensure_installed = {
--         "eslint-lsp",
--       },
--     },
--   },
-- }
