" Vim syntax file
" Language: SMT-LIB2
" Maintainer: auto-generated
" Latest Revision: 2026

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" --- Comments ---------------------------------------------------------------
syn match  smt2Comment      /;.*$/
syn region smt2BlockComment start=/|/ end=/|/ contains=smt2BlockComment

" --- Strings & Numerals ----------------------------------------------------
syn region smt2String       start=/"/ skip=/\\"/ end=/"/
syn match  smt2Numeral      /\<\d\+\>/
syn match  smt2Decimal      /\<\d\+\.\d\+\>/
syn match  smt2Hexadecimal  /#x[0-9a-fA-F]\+/
syn match  smt2Binary       /#b[01]\+/
syn match  smt2BitVecLit    /(_ bv\d\+ \d\+)/

" --- Keywords (reserved words) ---------------------------------------------
syn keyword smt2Keyword     par NUMERAL DECIMAL STRING
syn keyword smt2Keyword     _ ! as let exists forall match
syn keyword smt2Keyword     lambda

" --- Commands (top-level) --------------------------------------------------
syn keyword smt2Command     set-logic set-info set-option
syn keyword smt2Command     declare-sort define-sort
syn keyword smt2Command     declare-const declare-fun define-fun define-fun-rec
syn keyword smt2Command     declare-datatype declare-datatypes
syn keyword smt2Command     declare-codatatypes
syn keyword smt2Command     assert check-sat check-sat-assuming
syn keyword smt2Command     get-assertions get-proof get-unsat-core
syn keyword smt2Command     get-value get-assignment get-model
syn keyword smt2Command     get-option get-info
syn keyword smt2Command     push pop reset reset-assertions
syn keyword smt2Command     echo exit
syn keyword smt2Command     simplify eval apply
syn keyword smt2Command     maximize minimize
syn keyword smt2Command     assert-soft
syn keyword smt2Command     check-synth synth-fun declare-var constraint

" --- Built-in sorts --------------------------------------------------------
syn keyword smt2Sort        Bool Int Real String RegLan
syn keyword smt2Sort        BitVec FloatingPoint Float16 Float32 Float64 Float128
syn keyword smt2Sort        RoundingMode
syn keyword smt2Sort        Array Seq Set
syn match   smt2Sort        /\<\(_\s\+BitVec\s\+\d\+\)\>/

" --- Boolean operators -----------------------------------------------------
syn keyword smt2Builtin     true false
syn keyword smt2Builtin     not and or xor
syn keyword smt2Builtin     => ite distinct

" --- Arithmetic operators --------------------------------------------------
syn keyword smt2Builtin     abs div mod rem
syn match   smt2Operator    /[-+*/<>=]/
syn match   smt2Operator    /[<>]=/
syn keyword smt2Builtin     to_real to_int is_int

" --- Bitvector operators ---------------------------------------------------
syn keyword smt2Builtin     bvnot bvand bvor bvxor bvnand bvnor bvxnor
syn keyword smt2Builtin     bvneg bvadd bvsub bvmul bvudiv bvurem bvshl bvlshr bvashr
syn keyword smt2Builtin     bvsdiv bvsrem bvsmod
syn keyword smt2Builtin     bvult bvslt bvule bvsle bvuge bvsge bvugt bvsgt
syn keyword smt2Builtin     concat extract repeat
syn keyword smt2Builtin     zero_extend sign_extend rotate_left rotate_right

" --- Array operators -------------------------------------------------------
syn keyword smt2Builtin     select store const as-array

" --- String operators ------------------------------------------------------
syn keyword smt2Builtin     str.++ str.len str.at str.substr
syn keyword smt2Builtin     str.contains str.prefixof str.suffixof
syn keyword smt2Builtin     str.indexof str.replace str.replace_all
syn keyword smt2Builtin     str.to_int str.from_int str.to_code str.from_code
syn keyword smt2Builtin     str.is_digit str.to_re str.in_re
syn keyword smt2Builtin     re.++ re.union re.inter re.* re.+ re.opt
syn keyword smt2Builtin     re.range re.comp re.diff re.none re.all re.allchar

" --- Seq operators ---------------------------------------------------------
syn keyword smt2Builtin     seq.++ seq.len seq.extract seq.at seq.contains
syn keyword smt2Builtin     seq.prefixof seq.suffixof seq.indexof
syn keyword smt2Builtin     seq.replace seq.unit seq.empty seq.nth

" --- Quantifiers / patterns ------------------------------------------------
syn keyword smt2Keyword     pattern named weight qid skolemid

" --- Logic names -----------------------------------------------------------
syn keyword smt2Logic       QF_UF QF_LIA QF_LRA QF_LIRA QF_NIA QF_NRA QF_NIRA
syn keyword smt2Logic       QF_RDL QF_IDL QF_BV QF_ABV QF_AUFBV QF_AUFLIA
syn keyword smt2Logic       QF_AX QF_ALIA QF_ALRA QF_ANIA QF_ANRA
syn keyword smt2Logic       QF_FP QF_BVFP QF_ABVFP QF_UFBV QF_UFLIA QF_UFLRA QF_UFNRA
syn keyword smt2Logic       QF_S QF_SLIA
syn keyword smt2Logic       UF LIA LRA NIA NRA
syn keyword smt2Logic       AUFLIA AUFLIRA AUFNIRA
syn keyword smt2Logic       BV ABV FP
syn keyword smt2Logic       ALIA ALRA ANIA ANRA
syn keyword smt2Logic       ALL HORN

" --- Sat results -----------------------------------------------------------
syn keyword smt2Result      sat unsat unknown
syn keyword smt2Result      success unsupported error

" --- Attributes ------------------------------------------------------------
syn match   smt2Attribute   /:[a-zA-Z_][a-zA-Z0-9_+\-.*]*/

" --- Parentheses (for rainbow-parens plugins) ------------------------------
syn match   smt2Paren       /[()]/

" --- Highlight links -------------------------------------------------------
hi def link smt2Comment         Comment
hi def link smt2BlockComment    Comment
hi def link smt2String          String
hi def link smt2Numeral         Number
hi def link smt2Decimal         Float
hi def link smt2Hexadecimal     Number
hi def link smt2Binary          Number
hi def link smt2BitVecLit       Number
hi def link smt2Keyword         Keyword
hi def link smt2Command         Statement
hi def link smt2Sort            Type
hi def link smt2Builtin         Function
hi def link smt2Operator        Operator
hi def link smt2Logic           Constant
hi def link smt2Result          Special
hi def link smt2Attribute       PreProc
hi def link smt2Paren           Delimiter

let b:current_syntax = "smt2"

let &cpo = s:cpo_save
unlet s:cpo_save
