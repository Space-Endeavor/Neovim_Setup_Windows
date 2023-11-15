local status, autopairs = pcall(require, "nvim-autopairs")
if not status then 
    return 
end

autopaires.setup({
    disable_filetype = { "TelescopePromt", "vim" },
})