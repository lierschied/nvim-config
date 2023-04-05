return {
    "folke/tokyonight.nvim",
    config = function()
        require("tokyonight").setup({
            transparent = true,
            styles = {
                sidebars = "transparent",
                --floats = "transparent",
            },
            day_brightness = 0.3,
        })
        vim.cmd.colorscheme("tokyonight")
    end
}
