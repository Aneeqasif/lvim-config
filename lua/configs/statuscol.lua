local builtin = require("statuscol.builtin")
cfg={
  setopt = true,
  relculright = true,
  segments = {

    { text = { "%s"}, click = "v:lua.ScSa" },
    { text = { builtin.foldfunc, " " },
      click = "v:lua.ScFa",
      hl = "NONE",
    },

    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa", },
    -- {
    --   sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true },
    --   click = "v:lua.ScSa"
    -- },
  }}




require("statuscol").setup(cfg)

