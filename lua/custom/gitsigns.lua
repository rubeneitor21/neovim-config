require("gitsigns").setup({
  current_line_blame = false,
  current_line_blame_opts = {
    delay = 50,
    virt_text_pos = "eol" -- right_align, eol, overlay, inline
  },
})
