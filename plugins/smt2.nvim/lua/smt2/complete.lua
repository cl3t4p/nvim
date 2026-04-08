local M = {}

-- kind values match vim.lsp.protocol.CompletionItemKind
local K = {
  command  = 14, -- Keyword
  sort     = 25, -- TypeParameter
  keyword  = 14,
  builtin  = 3,  -- Function
  logic    = 21, -- Constant
  literal  = 12, -- Value
  attr     = 5,  -- Field
}

---@class Smt2CompletionItem
---@field label string
---@field kind number
---@field detail string|nil
---@field doc string|nil

---@type Smt2CompletionItem[]
M.items = {}

local function add(labels, kind, detail)
  for _, l in ipairs(labels) do
    table.insert(M.items, { label = l, kind = kind, detail = detail })
  end
end

-- Commands
add({
  "set-logic", "set-info", "set-option",
  "declare-sort", "define-sort",
  "declare-const", "declare-fun", "define-fun", "define-fun-rec",
  "declare-datatype", "declare-datatypes", "declare-codatatypes",
  "assert", "check-sat", "check-sat-assuming",
  "get-assertions", "get-proof", "get-unsat-core",
  "get-value", "get-assignment", "get-model",
  "get-option", "get-info",
  "push", "pop", "reset", "reset-assertions",
  "echo", "exit",
  "simplify", "eval", "apply",
  "maximize", "minimize", "assert-soft",
  "check-synth", "synth-fun", "declare-var", "constraint",
}, K.command, "command")

-- Sorts
add({
  "Bool", "Int", "Real", "String", "RegLan",
  "BitVec", "FloatingPoint",
  "Float16", "Float32", "Float64", "Float128",
  "RoundingMode", "Array", "Seq", "Set",
}, K.sort, "sort")

-- Keywords
add({
  "par", "let", "exists", "forall", "match", "lambda",
  "as", "!", "_",
}, K.keyword, "keyword")

-- Boolean
add({
  "true", "false",
  "not", "and", "or", "xor", "=>", "ite", "distinct",
}, K.builtin, "Bool")

-- Arithmetic
add({
  "+", "-", "*", "/", "div", "mod", "rem", "abs",
  "<", ">", "<=", ">=", "=",
  "to_real", "to_int", "is_int",
}, K.builtin, "Arithmetic")

-- Bitvector
add({
  "bvnot", "bvand", "bvor", "bvxor", "bvnand", "bvnor", "bvxnor",
  "bvneg", "bvadd", "bvsub", "bvmul",
  "bvudiv", "bvurem", "bvsdiv", "bvsrem", "bvsmod",
  "bvshl", "bvlshr", "bvashr",
  "bvult", "bvslt", "bvule", "bvsle", "bvuge", "bvsge", "bvugt", "bvsgt",
  "concat", "extract", "repeat",
  "zero_extend", "sign_extend", "rotate_left", "rotate_right",
}, K.builtin, "BitVec")

-- Array
add({
  "select", "store", "const", "as-array",
}, K.builtin, "Array")

-- String
add({
  "str.++", "str.len", "str.at", "str.substr",
  "str.contains", "str.prefixof", "str.suffixof",
  "str.indexof", "str.replace", "str.replace_all",
  "str.to_int", "str.from_int", "str.to_code", "str.from_code",
  "str.is_digit", "str.to_re", "str.in_re",
}, K.builtin, "String")

-- Regex
add({
  "re.++", "re.union", "re.inter", "re.*", "re.+", "re.opt",
  "re.range", "re.comp", "re.diff", "re.none", "re.all", "re.allchar",
}, K.builtin, "RegLan")

-- Seq
add({
  "seq.++", "seq.len", "seq.extract", "seq.at", "seq.contains",
  "seq.prefixof", "seq.suffixof", "seq.indexof",
  "seq.replace", "seq.unit", "seq.empty", "seq.nth",
}, K.builtin, "Seq")

-- Logics
add({
  "QF_UF", "QF_LIA", "QF_LRA", "QF_LIRA", "QF_NIA", "QF_NRA", "QF_NIRA",
  "QF_RDL", "QF_IDL", "QF_BV", "QF_ABV", "QF_AUFBV", "QF_AUFLIA",
  "QF_AX", "QF_ALIA", "QF_ALRA", "QF_ANIA", "QF_ANRA",
  "QF_FP", "QF_BVFP", "QF_ABVFP", "QF_UFBV", "QF_UFLIA", "QF_UFLRA", "QF_UFNRA",
  "QF_S", "QF_SLIA",
  "UF", "LIA", "LRA", "NIA", "NRA",
  "AUFLIA", "AUFLIRA", "AUFNIRA",
  "BV", "ABV", "FP",
  "ALIA", "ALRA", "ANIA", "ANRA",
  "ALL", "HORN",
}, K.logic, "logic")

-- Common attributes
add({
  ":named", ":pattern", ":weight", ":qid", ":skolemid",
  ":print-success", ":produce-proofs", ":produce-models",
  ":produce-unsat-cores", ":random-seed", ":verbosity",
  ":timeout", ":logic", ":source", ":category", ":status",
}, K.attr, "attribute")

-- Results
add({
  "sat", "unsat", "unknown",
}, K.literal, "result")

return M
