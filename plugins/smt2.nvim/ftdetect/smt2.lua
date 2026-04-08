vim.filetype.add({
  extension = {
    smt2 = "smt2",
    smt = "smt2",
  },
  pattern = {
    [".*%.smt2$"] = "smt2",
  },
})
