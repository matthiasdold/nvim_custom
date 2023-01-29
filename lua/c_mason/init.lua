require("mason").setup({
    ui = {
        borders = "single",    -- same values as nvim_open_win
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
