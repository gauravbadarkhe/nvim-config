return {
  "echasnovski/mini.cursorword",
  "echasnovski/mini.indentscope",

  config = function()
    require("mini.cursorword").setup()
    require("mini.indentscope").setup()
  end,
}
