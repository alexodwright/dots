return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = function ()
        local previewers = require("telescope.previewers")

        local bat_previewer = previewers.new_termopen_previewer({
            get_command = function(entry)
                return {
                    "bat",
                    "--style=numbers,changes",
                    "--color=always",
                    "--pager=never",
                    entry.path or entry.filename,
                }
            end,
        })

        return {
            defaults = {
            file_previewer = bat_previewer
        }
    }
    end
}
