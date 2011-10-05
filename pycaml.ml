(*
 * (C) arty 2002
 * This software is covered under the GNU lesser general public license

 * Major Modifications (C) T. Fischbacher 2005-2011, K. Aehlig 2011, M. Albert 2011
 *
 * NOTE: have to properly document the CamlType / ocamlpill mechanism!

 Note: Should we incorporate auto-conversion of int to float?
 At present, we do not do this.

 *)

(* DDD *)
external _mldump : 'a -> unit = "_mldump";;
external _pyrun_string_token0 : bool -> int = "_pyrun_string_token0";;
(* END DDD *)


type funcptr
type pyobject
type funcent = (funcptr * int * int * bool)

type pymodule_func = { pyml_name : string ;
		       pyml_func : (pyobject -> pyobject) ;
		       pyml_flags : int ;
		       pyml_doc : string }

type pyobject_type =
    TupleType
  | StringType
  | IntType
  | FloatType
  | ListType
  | BoolType
  | NoneType
  | CallableType
  | ModuleType
  | ClassType
  | TypeType
  | DictType
  | NullType
  | CamlpillType
  | OtherType
  | AnyType

type pyerror_type =
    Pyerr_Exception
    | Pyerr_StandardError
    | Pyerr_ArithmeticError
    | Pyerr_LookupError
    | Pyerr_AssertionError
    | Pyerr_AttributeError
    | Pyerr_EOFError
    | Pyerr_EnvironmentError
    | Pyerr_FloatingPointError
    | Pyerr_IOError
    | Pyerr_ImportError
    | Pyerr_IndexError
    | Pyerr_KeyError
    | Pyerr_KeyboardInterrupt
    | Pyerr_MemoryError
    | Pyerr_NameError
    | Pyerr_NotImplementedError
    | Pyerr_OSError
    | Pyerr_OverflowError
    | Pyerr_ReferenceError
    | Pyerr_RuntimeError
    | Pyerr_SyntaxError
    | Pyerr_SystemExit
    | Pyerr_TypeError
    | Pyerr_ValueError
    | Pyerr_ZeroDivisionError
;;

exception Pycaml_exn of (pyerror_type * string);;


(* Function list *)

external getfuncarray : unit -> funcent array = "pygetfuncarray"
let py_funcs = getfuncarray ();;

external pytype : pyobject -> pyobject_type = "pytype"

external pycaml_seterror : pyerror_type -> string -> unit = "pycaml_seterror"

external pyfuncall1 : (funcptr * int * int * bool) -> unit -> unit = "pygencall"
external pyfuncall2 : (funcptr * int * int * bool) -> int -> unit = "pygencall"
external pyfuncall3 : (funcptr * int * int * bool) -> string -> unit = "pygencall"
external pyfuncall4 : (funcptr * int * int * bool) -> unit -> int = "pygencall"
external pyfuncall5 : (funcptr * int * int * bool) -> string -> int = "pygencall"
external pyfuncall6 : (funcptr * int * int * bool) -> (int * string) -> int = "pygencall"
external pyfuncall7 : (funcptr * int * int * bool) -> (int * string * int) -> int =
  "pygencall"
external pyfuncall8 : (funcptr * int * int * bool) -> unit -> string = "pygencall"
external pyfuncall9 : (funcptr * int * int * bool) -> (string * int * pyobject * pyobject) -> pyobject = "pygencall"
external pyfuncall10 : (funcptr * int * int * bool) ->
  (int * string * int * pyobject * pyobject) -> pyobject = "pygencall"
external pyfuncall11 : (funcptr * int * int * bool) ->
  (int * string * int * pyobject * pyobject * int) -> pyobject = "pygencall"
external pyfuncall12 : (funcptr * int * int * bool) ->
  (string * string * int) -> pyobject = "pygencall"
external pyfuncall13 : (funcptr * int * int * bool) ->
  (pyobject * int * int) -> int = "pygencall"
external pyfuncall14 : (funcptr * int * int * bool) -> pyobject -> pyobject = "pygencall"
external pyfuncall15 : (funcptr * int * int * bool) -> (pyobject * pyobject * int) -> pyobject = "pygencall"
external pyfuncall16 : (funcptr * int * int * bool) -> (pyobject * string) -> pyobject = "pygencall"
external pyfuncall17 : (funcptr * int * int * bool) -> (pyobject * pyobject) -> pyobject = "pygencall"
external pyfuncall18 : (funcptr * int * int * bool) -> pyobject -> int = "pygencall"
external pyfuncall19 : (funcptr * int * int * bool) -> (pyobject * pyobject) -> int = "pygencall"
external pyfuncall20 : (funcptr * int * int * bool) -> (pyobject * pyobject * int) -> int = "pygencall"
external pyfuncall21 : (funcptr * int * int * bool) -> (pyobject * string * pyobject) -> int = "pygencall"
external pyfuncall22 : (funcptr * int * int * bool) -> (pyobject * string) -> int = "pygencall"
external pyfuncall23 : (funcptr * int * int * bool) -> (pyobject * pyobject) -> (pyobject * pyobject) option = "pygencall"
external pyfuncall24 : (funcptr * int * int * bool) -> (pyobject * pyobject * pyobject) -> int = "pygencall"
external pyfuncall25 : (funcptr * int * int * bool) -> pyobject -> int64 = "pygencall"
external pyfuncall26 : (funcptr * int * int * bool) -> pyobject -> string = "pygencall"
external pyfuncall27 : (funcptr * int * int * bool) -> (pyobject * pyobject) -> pyobject = "pygencall"
external pyfuncall28 : (funcptr * int * int * bool) -> string -> pyobject = "pygencall"
external pyfuncall29 : (funcptr * int * int * bool) -> unit -> pyobject = "pygencall"
external pyfuncall30 : (funcptr * int * int * bool) -> pyobject -> unit = "pygencall"
external pyfuncall31 : (funcptr * int * int * bool) -> (pyobject * int) ->
  (pyobject * pyobject * int) option = "pygencall"
external pyfuncall34 : (funcptr * int * int * bool) -> int64 -> pyobject = "pygencall"
external pyfuncall35 : (funcptr * int * int * bool) -> unit -> int64 = "pygencall"
external pyfuncall36 : (funcptr * int * int * bool) -> float -> pyobject = "pygencall"
external pyfuncall37 : (funcptr * int * int * bool) -> pyobject -> float = "pygencall"
external pyfuncall39 : (funcptr * int * int * bool) -> int -> pyobject = "pygencall"
external pyfuncall40 : (funcptr * int * int * bool) -> (pyobject * int) ->
  pyobject = "pygencall"
external pyfuncall41 : (funcptr * int * int * bool) -> (pyobject * int * pyobject) ->
  int = "pygencall"
external pyfuncall42 : (funcptr * int * int * bool) -> (pyobject * pyobject * pyobject) ->
  pyobject = "pygencall"
external pyfuncall43 : (funcptr * int * int * bool) -> (pyobject * int) ->
  (int * int * int) option = "pygencall"
external pyfuncall44 : (funcptr * int * int * bool) -> (int * int * int * int) ->
  pyobject = "pygencall"
external pyfuncall45 : (funcptr * int * int * bool) -> (pyobject * pyobject) -> unit =
  "pygencall"
external pyfuncall46 : (funcptr * int * int * bool) -> (pyobject * string) -> unit =
  "pygencall"
external pyfuncall47 : (funcptr * int * int * bool) -> (pyobject * pyobject * pyobject) ->
  (pyobject * pyobject * pyobject) = "pygencall"
external pyfuncall48 : (funcptr * int * int * bool) -> (pyobject * pyobject * pyobject) ->
  unit = "pygencall"
external pyfuncall49 : (funcptr * int * int * bool) -> (pyobject * string) -> pyobject =
  "pygencall"
external pyfuncall50 : (funcptr * int * int * bool) -> (string * pyobject * string) ->
  pyobject = "pygencall"
external pyfuncall51 : (funcptr * int * int * bool) ->
  (string * pyobject * pyobject * pyobject) -> pyobject = "pygencall"
external pyfuncall52 : (funcptr * int * int * bool) -> pyobject -> string = "pygencall"
external pyfuncall53 : (funcptr * int * int * bool) -> (pyobject * int * int * pyobject) -> int = "pygencall"
external pyfuncall54 : (funcptr * int * int * bool) -> (pyobject * int * int) -> int =
  "pygencall"


let fmt1call func = pyfuncall1 func
let fmt2call func = pyfuncall2 func
let fmt3call func = pyfuncall3 func
let fmt4call func = pyfuncall4 func
let fmt5call func = pyfuncall5 func
let fmt6call func = pyfuncall6 func
let fmt7call func = pyfuncall7 func
let fmt8call func = pyfuncall8 func
let fmt9call func = pyfuncall9 func
let fmt10call func = pyfuncall10 func
let fmt11call func = pyfuncall11 func
let fmt12call func = pyfuncall12 func
let fmt13call func = pyfuncall13 func
let fmt14call func = pyfuncall14 func
let fmt15call func = pyfuncall15 func
let fmt16call func = pyfuncall16 func
let fmt17call func = pyfuncall17 func
let fmt18call func = pyfuncall18 func
let fmt19call func = pyfuncall19 func
let fmt20call func = pyfuncall20 func
let fmt21call func = pyfuncall21 func
let fmt22call func = pyfuncall22 func
let fmt23call func = pyfuncall23 func
let fmt24call func = pyfuncall24 func
let fmt25call func = pyfuncall25 func
let fmt26call func = pyfuncall26 func
let fmt27call func = pyfuncall27 func
let fmt28call func = pyfuncall28 func
let fmt29call func = pyfuncall29 func
let fmt30call func = pyfuncall30 func
let fmt31call func = pyfuncall31 func
      (* 32 *)
      (* 33 *)
let fmt34call func = pyfuncall34 func
let fmt35call func = pyfuncall35 func
let fmt36call func = pyfuncall36 func
let fmt37call func = pyfuncall37 func
      (* 38 *)
let fmt39call func = pyfuncall39 func
let fmt40call func = pyfuncall40 func
let fmt41call func = pyfuncall41 func
let fmt42call func = pyfuncall42 func
let fmt43call func = pyfuncall43 func
let fmt44call func = pyfuncall44 func
let fmt45call func = pyfuncall45 func
let fmt46call func = pyfuncall46 func
let fmt47call func = pyfuncall47 func
let fmt48call func = pyfuncall48 func
let fmt49call func = pyfuncall49 func
let fmt50call func = pyfuncall50 func
let fmt51call func = pyfuncall51 func
let fmt52call func = pyfuncall52 func
let fmt53call func = pyfuncall53 func
let fmt54call func = pyfuncall54 func

let py_cur_func_num = ref 0
let pnf () = let this_func = py_funcs.(!py_cur_func_num) in
py_cur_func_num := !py_cur_func_num + 1 ; this_func

      (* 1 *)
let py_initialize = fmt1call (pnf ())
let py_finalize = fmt1call (pnf ())
let pyerr_print = fmt1call (pnf ())
      (* 2 *)
let py_exit = fmt2call (pnf ())
let pyerr_printex = fmt2call (pnf ())
      (* 3 *)
let py_setprogramname = fmt3call (pnf ())
let py_setpythonhome = fmt3call (pnf ())
      (* 4 *)
let py_isinitialized = fmt4call (pnf ())
      (* 5 *)
let pyrun_simplestring = fmt5call (pnf ())
      (* 6 *)
let pyrun_anyfile = fmt6call (pnf ())
let pyrun_simplefile = fmt6call (pnf ())
let pyrun_interactiveone = fmt6call (pnf ())
let pyrun_interactiveloop = fmt6call (pnf ())
let py_fdisinteractive = fmt6call (pnf ())
      (* 7 *)
let pyrun_anyfileex = fmt7call (pnf ())
let pyrun_simplefileex = fmt7call (pnf ())
      (* 8 *)
let py_getprogramname = fmt8call (pnf ())
let py_getpythonhome = fmt8call (pnf ())
let py_getprogramfullpath = fmt8call (pnf ())
let py_getprefix = fmt8call (pnf ())
let py_getexecprefix = fmt8call (pnf ())
let py_getpath = fmt8call (pnf ())
let py_getversion = fmt8call (pnf ())
let py_getplatform = fmt8call (pnf ())
let py_getcopyright = fmt8call (pnf ())
let py_getcompiler = fmt8call (pnf ())
let py_getbuildinfo = fmt8call (pnf ())
      (* 9 *)
let pyrun_string = fmt9call (pnf ())
      (* 10 *)
let pyrun_file = fmt10call (pnf ())
      (* 11 *)
let pyrun_fileex = fmt11call (pnf ())
      (* 12 *)
let py_compilestring = fmt12call (pnf ())
      (* 13 *)
let pyobject_print = fmt13call (pnf ())
      (* 14 *)
let pyobject_repr = fmt14call (pnf ())
let pyobject_str = fmt14call (pnf ())
let pyobject_unicode = fmt14call (pnf ())
(* 15 *)
let pyobject_richcompare = fmt15call (pnf ())
(* 16 *)
let pyobject_getattrstring = fmt16call (pnf ())
(* 17 *)
let pyobject_getattr = fmt17call (pnf ())
(* 18 *)
let pyobject_istrue = fmt18call (pnf ())
let pyobject_not = fmt18call (pnf ())
let pycallable_check = fmt18call (pnf ())
(* 19 *)
let pyobject_compare = fmt19call (pnf ())
let pyobject_hasattr = fmt19call (pnf ())
(* 20 *)
let pyobject_richcomparebool = fmt20call (pnf ())
(* 21 *)
let pyobject_setattrstring = fmt21call (pnf ())
(* 22 *)
let pyobject_hasattrstring = fmt22call (pnf ())
(* 23 *)
let pynumber_coerce = fmt23call (pnf ())
let pynumber_coerceex = fmt23call (pnf ())
(* 24 *)
let pyobject_setattr = fmt24call (pnf ())
(* 25 *)
let pyobject_hash = fmt25call (pnf ())
(* Strings *)
(* 18 *)
let pystring_size = fmt18call (pnf ())
(* 26 *)
let pystring_asstring = fmt26call (pnf ())
(* 27 - deleted by T.F. - cannot be interfaced in such a way due to refcount behaviour! *)
(* 28 *)
let pystring_fromstring = fmt28call (pnf ())
(* 17 *)
let pystring_format = fmt17call (pnf ())

(* Dictionaries *)
(* 29 *)
let pydict_new = fmt29call (pnf ())
(* 17 *)
let pydict_getitem = fmt17call (pnf ())
(* 24 *)
let pydict_setitem = fmt24call (pnf ())
(* 19 *)
let pydict_delitem = fmt19call (pnf ())
(* 30 *)
let pydict_clear = fmt30call (pnf ())
(* 31 *)
let pydict_next = fmt31call (pnf ())
(* 14 *)
let pydict_keys = fmt14call (pnf ())
let pydict_values = fmt14call (pnf ())
let pydict_items = fmt14call (pnf ())
let pydict_copy = fmt14call (pnf ())
(* 18 *)
let pydict_size = fmt18call (pnf ())
(* 16 *)
let pydict_getitemstring = fmt16call (pnf ())
(* 22 *)
let pydict_delitemstring = fmt22call (pnf ())
(* 21 *)
let pydict_setitemstring = fmt21call (pnf ())

(* Integer *)
(* 34 *)
let pyint_fromlong = fmt34call (pnf ())
(* 25 *)
let pyint_aslong = fmt25call (pnf ())
(* 35 *)
let pyint_getmax = fmt35call (pnf ())

(* Float *)
(* 36 *)
let pyfloat_fromdouble = fmt36call (pnf ())
(* 37 *)
let pyfloat_asdouble = fmt37call (pnf ())

(* Modules *)
(* 28 *)
let pymodule_new = fmt28call (pnf ())
(* 14 *)
let pymodule_getdict = fmt14call (pnf ())
(* 26 *)
let pymodule_getname = fmt26call (pnf ())
let pymodule_getfilename = fmt26call (pnf ())

(* 39 *)
let pytuple_new = fmt39call (pnf ())
(* 18 *)
let pytuple_size = fmt18call (pnf ())
(* 40 *)
let pytuple_getitem = fmt40call (pnf ())
(* 41 *)
let pytuple_setitem = fmt41call (pnf ())
(* 13 *)
let pytuple_getslice = fmt13call (pnf ())

(* 42 *)
let pyslice_new = fmt42call (pnf ())
(* 43 *)
let pyslice_getindices = fmt43call (pnf ())
(* 44 *)
let _broken_pyrange_new = fmt44call (pnf ())
(* The above is needed to increase Arty's counter... *)
let pyrange_new _ =
  failwith "PyRange_New() is not supported, and never was part of the official Python API."
;;

(* Error handling definitions *)

(* 30 *)
let pyerr_setnone = fmt30call (pnf ())
(* 45 *)
let pyerr_setobject = fmt45call (pnf ())
(* 46 *)
let pyerr_setstring = fmt46call (pnf ())
(* 29 *)
let pyerr_occurred = fmt29call (pnf ())
(* 1 *)
let pyerr_clear = fmt1call (pnf ())
(* 47 *)
let pyerr_fetch_broken = fmt47call (pnf ())

external pyerr_fetch : unit -> (pyobject * pyobject * pyobject) = "pyerr_fetch_wrapped"

(* 48 *)
let pyerr_restore = fmt48call (pnf ())

(* Error testing and normalization *)
(* 19 *)
let pyerr_givenexceptionmatches = fmt19call (pnf ())
(* 18 *)
let pyerr_exceptionmatches = fmt18call (pnf ())
(* 47 *)
let pyerr_normalizeexception = fmt47call (pnf ())

(* Classes *)
(* 42 *)
let pyclass_new = fmt42call (pnf ())
(* 42 *)
let pyinstance_new = fmt42call (pnf ())

(* 17 *)
let pyinstance_newraw = fmt17call (pnf ())
(* 42 *)
let pymethod_new = fmt42call (pnf ())
(* 14 *)
let pymethod_function = fmt14call (pnf ())
let pymethod_self = fmt14call (pnf ())
let pymethod_class = fmt14call (pnf ())

(* Module *)
(* 28 *)
let pymodule_new = fmt28call (pnf ())
(* 14 *)
let pymodule_getdict = fmt14call (pnf ())
(* 26 *)
let pymodule_getname = fmt26call (pnf ())
let pymodule_getfilename = fmt26call (pnf ())
(* 35 *)
let pyimport_getmagicnumber = fmt35call (pnf ())
(* 49 *)
let pyimport_execcodemodule = fmt49call (pnf ())
(* 50 *)
let pyimport_execcodemoduleex = fmt50call (pnf ())
(* 29 *)
let pyimport_getmoduledict = fmt29call (pnf ())
(* 28 *)
let pyimport_addmodule = fmt28call (pnf ())
let pyimport_importmodule = fmt28call (pnf ())
(* 51 *)
let pyimport_importmoduleex = fmt51call (pnf ())
(* 28 *)
let pyimport_import = fmt28call (pnf ())
(* 14 *)
let pyimport_reloadmodule = fmt14call (pnf ())
(* 1 *)
let pyimport_cleanup = fmt1call (pnf ())
(* 5 *)
let pyimport_importfrozenmodule = fmt5call (pnf ())

(* Interface to random parts in ceval.c *)
(* 42 *)
let pyeval_callobjectwithkeywords = fmt42call (pnf ())
(* 17 *)
let pyeval_callobject = fmt17call (pnf ())

(* 29 *)
let pyeval_getbuiltins = fmt29call (pnf ())
let pyeval_getglobals = fmt29call (pnf ())
let pyeval_getlocals = fmt29call (pnf ())
let pyeval_getframe = fmt29call (pnf ())
(* 4 *)
let pyeval_getrestricted = fmt4call (pnf ())

(* Abstract layer *)
(* 14 *)
let pyobject_type = fmt14call (pnf ())
(* 18 *)
let pyobject_size = fmt18call (pnf ())
(* 17 *)
let pyobject_getitem = fmt17call (pnf ())
(* 24 *)
let pyobject_setitem = fmt24call (pnf ())
(* 17 *)
let pyobject_delitem = fmt17call (pnf ())
(* 52 *)
let pyobject_ascharbuffer = fmt52call (pnf ())
let pyobject_asreadbuffer = fmt52call (pnf ())
let pyobject_aswritebuffer = fmt52call (pnf ())
(* 18 *)
let pynumber_check = fmt18call (pnf ())
(* 17 *)
let pynumber_add = fmt17call (pnf ())
let pynumber_subtract = fmt17call (pnf ())
let pynumber_multiply = fmt17call (pnf ())
let pynumber_divide = fmt17call (pnf ())
let pynumber_remainder = fmt17call (pnf ())
let pynumber_divmod = fmt17call (pnf ())
(* 42 *)
let pynumber_power = fmt42call (pnf ())
(* 14 *)
let pynumber_negative = fmt14call (pnf ())
let pynumber_positive = fmt14call (pnf ())
let pynumber_absolute = fmt14call (pnf ())
let pynumber_invert = fmt14call (pnf ())
(* 17 *)
let pynumber_lshift = fmt17call (pnf ())
let pynumber_rshift = fmt17call (pnf ())
let pynumber_and = fmt17call (pnf ())
let pynumber_xor = fmt17call (pnf ())
let pynumber_or = fmt17call (pnf ())
(* 14 *)
let pynumber_int = fmt14call (pnf ())
let pynumber_long = fmt14call (pnf ())
let pynumber_float = fmt14call (pnf ())
(* 17 *)
let pynumber_inplaceadd = fmt17call (pnf ())
let pynumber_inplacesubtract = fmt17call (pnf ())
let pynumber_inplacemultiply = fmt17call (pnf ())
let pynumber_inplacedivide = fmt17call (pnf ())
let pynumber_inplaceremainder = fmt17call (pnf ())
let pynumber_inplacelshift = fmt17call (pnf ())
let pynumber_inplacershift = fmt17call (pnf ())
let pynumber_inplaceand = fmt17call (pnf ())
let pynumber_inplacexor = fmt17call (pnf ())
let pynumber_inplaceor = fmt17call (pnf ())
(* 42 *)
let pynumber_inplacepower = fmt42call (pnf ())
(* 18 *)
let pysequence_check = fmt18call (pnf ())
let pysequence_size = fmt18call (pnf ())
let pysequence_length = fmt18call (pnf ())
(* 17 *)
let pysequence_concat = fmt17call (pnf ())
(* 40 *)
let pysequence_repeat = fmt40call (pnf ())
let pysequence_getitem = fmt40call (pnf ())
(* 13 *)
let pysequence_getslice = fmt13call (pnf ())
(* 41 *)
let pysequence_setitem = fmt41call (pnf ())
(* 20 *)
let pysequence_delitem = fmt20call (pnf ())
(* 53 *)
let pysequence_setslice = fmt53call (pnf ())
(* 54 *)
let pysequence_delslice = fmt54call (pnf ())
(* 14 *)
let pysequence_tuple = fmt14call (pnf ())
let pysequence_list = fmt14call (pnf ())
(* 16 *)
let pysequence_fast = fmt16call (pnf ())
(* 19 *)
let pysequence_count = fmt19call (pnf ())
let pysequence_contains = fmt19call (pnf ())
let pysequence_in = fmt19call (pnf ())
let pysequence_index = fmt19call (pnf ())
(* 17 *)
let pysequence_inplaceconcat = fmt17call (pnf ())
(* 22 *)
let pysequence_inplacerepeat = fmt22call (pnf ())
(* 18 *)
let pymapping_check = fmt18call (pnf ())
let pymapping_size = fmt18call (pnf ())
let pymapping_length = fmt18call (pnf ())
(* 16 *)
let pymapping_haskeystring = fmt16call (pnf ())
(* 19 *)
let pymapping_haskey = fmt19call (pnf ())
(* 16 *)
let pymapping_getitemstring = fmt16call (pnf ())
(* 41 *)
let pymapping_setitemstring = fmt41call (pnf ())
(* 28 *)
let ourpy_initemptymodule = fmt28call (pnf ())

external pynull : unit -> pyobject = "pynull"

external pynone : unit -> pyobject = "pynone"

external pytuple_fromarray : pyobject array -> pyobject = "pytuple_fromarray"
let pytuple_fromsingle elt = pytuple_fromarray [| elt |]
let pytuple_empty = pytuple_fromarray [| |]
external pytuple2 : (pyobject * pyobject) -> pyobject =
  "pytuple_fromarray"
external pytuple3 : (pyobject * pyobject * pyobject) -> pyobject =
  "pytuple_fromarray"
external pytuple4 : (pyobject * pyobject * pyobject * pyobject) ->
  pyobject = "pytuple_fromarray"
external pytuple5 : (pyobject * pyobject * pyobject * pyobject * pyobject) ->
  pyobject = "pytuple_fromarray"

let pyint_fromint i = pyint_fromlong (Int64.of_int i)
let pyint_asint obj = Int64.to_int (pyint_aslong obj)

external pytuple_toarray : pyobject -> pyobject array = "pytuple_toarray"

external pybool_asbool : pyobject -> bool = "pybool_asbool"
external pybool_frombool : bool -> pyobject = "pybool_frombool"

external pywrap_closure : (pyobject -> pyobject) -> pyobject = "pywrap_closure"

external pywrap_value : 'a -> pyobject = "pywrapvalue" ;;
external pywrap_value_pill : 'a -> pyobject = "pywrapvalue_pill" ;;

external pyunwrap_value : pyobject -> 'a = "pyunwrapvalue" ;;
(* ^ Note: this will just unwrap and not care about pills! *)

(* -- T.F. extensions -- *)

let py_repr x = pystring_asstring (pyobject_repr x);;

external pywrap_closure_docstring :
  string -> (pyobject -> pyobject) -> pyobject = "pywrap_closure_docstring"


external pylist_fromarray : pyobject array -> pyobject = "pylist_fromarray"
external pylist_toarray : pyobject -> pyobject array = "pylist_toarray"
external pylist_set: pyobject -> int -> pyobject -> unit = "pylist_set"
external pylist_get: pyobject -> int -> pyobject = "pylist_get"

external python_prompt: unit -> unit = "pycaml_prompt"

external pyrefcount: pyobject -> int = "pyrefcount"

let _py_profile_hash = ((Hashtbl.create 100):(string, float array) Hashtbl.t);;
let _py_profiling_active=ref false;;
(* The profiling hash and switch are strictly internal! *)

let py_activate_profiling () =
  let z = !_py_profiling_active in
  let () = _py_profiling_active:=true in
    z
;;

let py_deactivate_profiling () =
  let z = !_py_profiling_active in
  let () = _py_profiling_active:=false in
    z
;;


let py_profile_reset () = Hashtbl.clear _py_profile_hash;;

let pylist_size = pysequence_size;;

(* Needed below. Actually, we also have this in our "snippets" module,
   but pycaml should not depend on anything not in the standard ocaml
   distribution.
*)

let __hashtbl_arbitrary_element ht =
  let have_it = ref None in
  let () =
    try
      Hashtbl.iter
	(fun k v ->
	   begin
	     have_it := Some (k,v);
	     raise Not_found; (* abused as a dummy exception here *)
	   end)
	ht
    with
      | Not_found -> ()
  in !have_it;;

let __map_hashtbl_to_array ?sorter mapper ht =
  let nr_entries = Hashtbl.length ht in
    if nr_entries = 0
    then [||]
    else
      let opt_kv = __hashtbl_arbitrary_element ht in
      let result =
	match opt_kv with
	  | None -> failwith "Impossible!"
	  | Some (k,v) -> Array.make nr_entries (mapper k v)
      in
      let ref_index = ref 0 in
      let () = Hashtbl.iter
	(fun k v ->
	   begin
	     result.(!ref_index) <- mapper k v;
	     ref_index := (1+ !ref_index);
	   end) ht
      in
	match sorter with
	  | Some s ->
	      let () = Array.sort s result in result
	  | _ -> result
;;


let py_profile_report () =
  __map_hashtbl_to_array
    ~sorter:(fun (_,time_a,_) (_,time_b,_) -> compare time_b time_a) (* sort by time consumed *)
    (fun name time_and_calls -> (name,time_and_calls.(0),time_and_calls.(1)))
    _py_profile_hash
;;


(* T.F. Note: THIS DID NOT MATCH pycaml_stubs.c ! arty's fault. Fixed it. *)
let pytype_name pt =
  match pt with
  | TupleType -> "Python-Tuple"
  | StringType -> "Python-String"
  | IntType -> "Python-Int"
  | FloatType -> "Python-Float"
  | ListType -> "Python-List"
  | BoolType -> "Python-Bool"
  | NoneType -> "Python-None"
  | CallableType -> "Python-Callable"
  | ModuleType -> "Python-Module"
  | ClassType -> "Python-Class"
  | NullType -> "Python-Null"
  | TypeType -> "Python-Type"
  | DictType -> "Python-Dict"
  | CamlpillType -> "Python-Camlpill"
  | OtherType -> "Python-Other"
  | AnyType -> "Python-Any"
;;

let set_python_argv argv =
  let py_mod_sys_dict = pymodule_getdict (pyimport_importmodule "sys") in
  let _ = pydict_setitem(py_mod_sys_dict,pystring_fromstring "argv",
			 pylist_fromarray (Array.map pystring_fromstring argv))
  in ()
;;

let ipython () =
  let _ = set_python_argv Sys.argv in
  pyrun_simplestring
"import sys
from IPython.Shell import IPShellEmbed
ipshell = IPShellEmbed()
ipshell()
";;


(* Note: we prepare Python in such a way that we have a module ocaml
   within which the OCaml side will publish its own functions.

   Convention: We will register some examples in ocaml.*
   These will have names that start with "example_".
*)

let _ = py_initialize ();; (* Note that this must happen that early... *)

let _py_sys_modules_dict = pyimport_getmoduledict ();;
let py_mod_main = pyimport_addmodule "__main__";;
let py_mod_main_dict = pymodule_getdict py_mod_main;;
let _py_mod_ocaml = pymodule_new "ocaml";;
let _py_mod_ocaml_dict = pymodule_getdict _py_mod_ocaml;;

(* Get the last value that was computed in the interactive REPL *)
let python_last_value =
   let builtins =
   pydict_getitem(py_mod_main_dict,pystring_fromstring "__builtins__")
   in
   let builtins_dict = pymodule_getdict builtins in
   let pyname_lastvalue=pystring_fromstring "_" in
     (fun () -> pydict_getitem(builtins_dict,pyname_lastvalue))
;;

let python_exec str =
  pyrun_simplestring str
;;

let python_eval
     ?(print=false)
     ?(like_repl=false)
     ?globals
     ?locals
     str =
  let the_globals = match globals with | None -> py_mod_main_dict | Some x -> x
  and the_locals = match locals with | None -> py_mod_main_dict | Some x -> x
  in
  let token0 =_pyrun_string_token0 like_repl in
  let result =
    pyrun_string (str,token0,the_globals,the_locals)
  in
  let () = 
    (if print then Printf.printf "[PY] => %s\n%!" (py_repr result) else ())
  in
  let () = (if pytype (pyerr_occurred()) == NullType then () else pyerr_print()) in
  result
;;

let python_load filename =
  ignore(python_exec (Printf.sprintf "execfile(\"%s\")" filename))
;;

let python () =
  let _ = set_python_argv Sys.argv in
  let () = python_prompt() in 0
;;

external pymain : string array -> int = "pycaml_pymain";;

let (py_true,py_false) =
  let builtins =
    pydict_getitem(py_mod_main_dict,pystring_fromstring "__builtins__")
  in
  let builtins_dict = pymodule_getdict builtins in
  let pyname_true=pystring_fromstring "True"
  and pyname_false=pystring_fromstring "False"
  in (pydict_getitem(builtins_dict,pyname_true),
      pydict_getitem(builtins_dict,pyname_false))
;;

(* Interestingly, pycaml tells us that the py_type of py_true and
   py_false is IntType.  Let us for safety assume that this is just by
   chance, and not build on that undocumented feature!

   XXX FIXME - now that we have pybool_frombool and pybool_asbool,
   I would have expected this to change, but, curiously, Python
   insists that pytype (pybool_frombool true) == IntType!
   So... it seems as if there were no way to make Python recognize
   bool as a separate type here - or is there?
   Now, PyBool_Check() seems to exist independently of PyInt_Check() -
   need to get that sorted out.
*)
let py_bool_type = pytype py_true;;

let py_is_true x = pyobject_istrue x <> 0;;
(* pyobject_istrue has return type int - which is quite insane... *)

let python_object_from_module module_name entity_name =
   let py_mod = pyimport_importmodule module_name in
   let py_dict = pymodule_getdict py_mod in
   let entry = pydict_getitem(py_dict,pystring_fromstring entity_name) in
   entry
;;
(* Example:
let dblquad = python_object_from_module "scipy.integrate" "dblquad";;
*)

let register_for_python stuff =
  Array.iter
    (fun (python_name, value) ->
       ignore(pydict_setitemstring
		(_py_mod_ocaml_dict,
		 python_name, value)))
    stuff;;

let py_homogeneous_list_as_array
   ?error_label
   ?length
   type_name type_checker unwrapper
   py_obj_arr
   =
  let array_first_not_to_satisfy p arr =
    let len = Array.length arr in
    let rec walk n =
      if n = len then (-1)
      else if p (arr.(n)) then walk (n+1)
      else n
    in walk 0
  in
  let the_error_label =
    match error_label with
      | None -> ""
      | Some x -> Printf.sprintf "%s: " x
  in
    if (pytype py_obj_arr) <> ListType
    then
      raise
	(Pycaml_exn
	   (Pyerr_TypeError,
	    Printf.sprintf "%sExpected list, got: %s (%s)" the_error_label
	      (pytype_name (pytype py_obj_arr))
	      (py_repr py_obj_arr)
	   ))
    else
      let obj_arr = pylist_toarray py_obj_arr in
      (* Doing the length check is slightly tricky... *)
      let () =
	(match length with
	| None -> ()
	| Some len ->
	    if Array.length obj_arr <> len
	    then
	      raise
		(Pycaml_exn
		   (Pyerr_TypeError,
		    Printf.sprintf "%sExpected list of length %d, got length: %d"
		      the_error_label
		      len (Array.length obj_arr)))
	    else ())
      in
      let first_bad = array_first_not_to_satisfy type_checker obj_arr in
      if first_bad <> (-1)
      then
	raise
	  (Pycaml_exn
	     (Pyerr_TypeError,
	      Printf.sprintf "%sExpected homogeneous list of %s. Entry %d is of type %s (%s)!"
		the_error_label
		type_name
		(1+first_bad)
		(pytype_name (pytype obj_arr.(first_bad)))
		(py_repr obj_arr.(first_bad))
	     ))
      else
	Array.map unwrapper obj_arr
;;



let py_float_list_as_array ?error_label ?length arr =
  py_homogeneous_list_as_array
    ?error_label ?length
    "float" (fun x -> pytype x = FloatType) pyfloat_asdouble arr
;;

let py_int_list_as_array ?error_label ?length arr =
  py_homogeneous_list_as_array
    ?error_label ?length
    "int" (fun x -> pytype x = IntType) pyint_asint arr
;;

let py_number_list_as_float_array ?error_label ?length arr =
  py_homogeneous_list_as_array
    ?error_label ?length
    "number"
    (fun x -> let ty = pytype x in ty = FloatType || ty = IntType)
    (fun x -> if pytype x = FloatType then pyfloat_asdouble x else float_of_int (pyint_asint x))
    arr
;;


let py_string_list_as_array ?error_label ?length arr =
  py_homogeneous_list_as_array
    ?error_label ?length
    "string" (fun x -> pytype x = StringType) pystring_asstring arr
;;

let py_list_list_as_array ?error_label ?length arr =
  py_homogeneous_list_as_array
    ?error_label ?length
    "<Python List>" (fun x -> pytype x = ListType) (fun x -> x) arr
;;

let py_list_list_as_array2 ?error_label ?length arr =
  py_homogeneous_list_as_array
    ?error_label ?length
    "<Python List>" (fun x -> pytype x = ListType) pylist_toarray arr
;;


let py_float_list_list_as_array ?error_label ?length_outer ?length_inner arr =
  let arr_outer = py_list_list_as_array ?error_label ?length:length_outer arr in
  Array.map (py_float_list_as_array ?error_label ?length:length_inner) arr_outer
;;

let py_number_list_list_as_float_array ?error_label ?length_outer ?length_inner arr =
  let arr_outer = py_list_list_as_array ?error_label ?length:length_outer arr in
  Array.map (py_number_list_as_float_array ?error_label ?length:length_inner) arr_outer
;;


let py_int_list_list_as_array ?error_label ?length_outer ?length_inner arr =
  let arr_outer = py_list_list_as_array ?error_label ?length:length_outer arr in
  Array.map (py_int_list_as_array ?error_label ?length:length_inner) arr_outer
;;

let py_string_list_list_as_array ?error_label ?length_outer ?length_inner arr =
  let arr_outer = py_list_list_as_array ?error_label ?length:length_outer arr in
  Array.map (py_string_list_as_array ?error_label ?length:length_inner) arr_outer
;;

let get_submodule_dict ?genesis_modulename py_mod_dict submod_name =
  if pytype py_mod_dict == NoneType 	(* used to codify toplevel *)
  then
    let m = pyimport_addmodule submod_name in
    let md = pymodule_getdict m in
    md
  else
    let sm = pydict_getitemstring (py_mod_dict,submod_name) in
    if pytype sm == NullType
    then
	(* WARNING - Dark magic below (abusing globally created module) *)
      match genesis_modulename with
	| None -> failwith (Printf.sprintf "Submodule not found: '%s'" submod_name)
	| Some g ->
	  let new_mod = pymodule_new g in
	  let _ = pydict_setitemstring (py_mod_dict,submod_name,new_mod) in
	  let globals = pyeval_getglobals () in
	  let locals = pyeval_getlocals () in 
	  let _ = pydict_delitemstring (globals,g) in
	  let _ = pydict_delitemstring (locals,g) in
	  pymodule_getdict new_mod
    else
      pymodule_getdict sm
;;

let py_register
    ?(create_modules=true) (* XXX TODO: do we really need this? *)
    full_name
    pyobj
    =
  (* Strategy: For each element in pieces, check whether the module is
     already present in _py_sys_modules_dict. If not, create a new
     module and add it there. Then descend and check the next
     level.
  *)
  let pieces = Str.split (Str.regexp "\\.") full_name in
  let module_path = (List.rev (List.tl (List.rev pieces))) in
  let objname = (List.hd (List.rev pieces)) in
  let rec walk module_dict_now modules_so_far submods_todo =
    match submods_todo with
      | [] -> module_dict_now
      | submod_name::rest ->
	let sm =
	  let submodule = pydict_getitemstring (module_dict_now,submod_name) in
	  if pytype submodule == NullType
	  then
	    if create_modules then
	      pymodule_new submod_name
	    else
	      failwith (Printf.sprintf "Module '%s' does not have a submodule named '%s'. Use create_modules=true if submodules should be created automatically." (List.hd (List.rev modules_so_far)) submod_name)
	  else submodule
	in
	let modules_new = modules_so_far @ [submod_name] in
	let module_path_new = String.concat "." modules_new in
	let _ = pydict_setitemstring (_py_sys_modules_dict, module_path_new, sm) in
	let _ = pydict_setitemstring (module_dict_now, submod_name, sm) in
	walk (pymodule_getdict sm) modules_new rest
  in
  let module_dict = walk _py_sys_modules_dict [] module_path
  (* XXX If the object is created in the toplevel and not in a
     submodule, it would be nice to automatically import it so that it
     is readily available to the user. However, pyeval_getglobals()
     returns NULL at this stage, so we can't just insert it
     there. Also, 'pyimport_import objname' crashes for some
     reason. *)
  in
  ignore(pydict_setitemstring (module_dict,objname,pyobj))
;;

let py_resolve modulepath =
    let pieces = Str.split (Str.regexp "\\.") modulepath in
    try
      let rec walk dict_now rest_path =
	match rest_path with
	  | [objname] -> pydict_getitemstring (dict_now,objname)
	  | submodule::subpath ->
	    let dict_next = get_submodule_dict dict_now submodule in
	    walk dict_next subpath
	  | _ -> failwith ""
      in walk (pynone()) pieces
    with
      | _ -> failwith (Printf.sprintf "py_resolve('%s') failed" modulepath)
;;


(* When registering an OCaml function for Python, we should include
   quite some extra run-time type checks. Rationale: Python users expect
   programming errors to produce error messages, not crash the system.

   So, not including these checks would violate the user's expectations.

   The function below helps us wrapping up an OCaml function for
   calling from python with arg conversion, typechecks, and optional
   extra checks for individual parameters. Furthermore, we make sure
   that OCaml exceptions are passed on properly to the Python level.
*)

(* Actually, this turned out to be not quite as useful as I hoped initially... *)
let _caml_debug_exceptions () =
  let ocamlrunparam =
    try Unix.getenv "OCAMLRUNPARAM"
    with | Not_found ->
      try Unix.getenv "CAMLRUNPARAM"
      with | Not_found -> ""
  in
  let pieces = Str.split (Str.regexp ",") ocamlrunparam in
    try
      let _ = List.find (fun p -> p="b") pieces in
	true
    with
      | Not_found -> false
;;

let python_interfaced_function
    ?register_as (* Should have the form '[[module.]submodule.]fun_name'. If provided, adds the function to the specified module. *)
    ?error_name (* defaults to registered name (if provided); will be used in both profiling and error reporting *)
    ?(catch_weird_exceptions=true)
    ?docstring
    ?extra_guards (* An array of functions mapping pyobject -> failure_string option *)
    wanted_types function_body =
  let error_namestring =
    match error_name with
      | None -> (match register_as with
	  | None -> "ANONYMOUS"
	  | Some x -> x)
      | Some x -> x
  in
  let wrapper =
    (match docstring with
       | None -> pywrap_closure
       | Some docstring -> (pywrap_closure_docstring docstring))
  in
  let exn_fun_name = Printf.sprintf " (%s)" error_namestring in
  let work_fun python_args =
    let body () =
            let () = (if pytype python_args = TupleType
		then ()
		else raise (Pycaml_exn(Pyerr_TypeError, Printf.sprintf "Weird situation: Non-Tuple function args encountered.%s" exn_fun_name))
		    (* ^ This should never happen! *)
	       )
      in
      let nr_args_given = pytuple_size python_args
      and nr_args_wanted = Array.length wanted_types in
      let () = (if nr_args_given = nr_args_wanted then ()
		else raise (Pycaml_exn(Pyerr_IndexError,
				       (Printf.sprintf "Args given: %d Wanted: %d.%s" nr_args_given nr_args_wanted exn_fun_name))))
      in
      let arr_args = pytuple_toarray python_args in
      let rec check_types pos =
	if pos = nr_args_given
	then function_body arr_args
	else
	  let type_here = pytype arr_args.(pos)
	  and type_wanted = wanted_types.(pos)
	  in
	  let () = (if type_here = type_wanted || type_wanted = AnyType then ()
		    else
		      raise (Pycaml_exn
			       (Pyerr_TypeError,
				(Printf.sprintf "Argument %d: Type wanted: %s -- Type provided: %s%s."
				   (pos+1) (* Humans like to start counting at 1. *)
				   (pytype_name type_wanted)
				   (pytype_name type_here)
				   exn_fun_name
				))))
	  in
	    (* Okay, typecheck succeeded.
	       Now, if extra guards have been provided, try those.
	    *)
	    match extra_guards with
	      | None -> check_types (pos+1)
	      | Some guards ->
		  let guard = guards.(pos) in
		  let guard_error = guard arr_args.(pos) in
		    match guard_error with
		      | None -> check_types (pos+1)
		      | Some msg ->
			  raise (Pycaml_exn
				   (Pyerr_TypeError,
				    (Printf.sprintf "Check for argument %d failed: %s%s."
				       (pos+1)
				       msg
				       exn_fun_name
				    )))
      in
	check_types 0
    in
      if _caml_debug_exceptions ()
      then body ()
      else
	try
          body ()
	with
	  | Pycaml_exn (errtype, msg) ->
	    (* Do not add exn_fun_name here, as the error will show it already. *)
	      pycaml_seterror errtype (Printf.sprintf "%s" msg); pynull()
	  | Not_found ->
	      pycaml_seterror Pyerr_LookupError (Printf.sprintf "OCaml exception 'Not_found'%s" exn_fun_name);
	      pynull()
	  | Division_by_zero ->
	      pycaml_seterror Pyerr_ZeroDivisionError (Printf.sprintf "OCaml exception 'Division_by_zero'%s" exn_fun_name);
	      pynull()
	  | Failure s ->
	      pycaml_seterror Pyerr_StandardError (Printf.sprintf "OCaml exception 'Failure: %s'%s" s exn_fun_name);
	      pynull ()
	  | Invalid_argument s ->
	      pycaml_seterror Pyerr_StandardError (Printf.sprintf "OCaml exception 'Invalid_argument: %s'%s" s exn_fun_name);
	      pynull()
	  | Out_of_memory ->
	      pycaml_seterror Pyerr_StandardError (Printf.sprintf "OCaml exception 'Out_of_memory'%s" exn_fun_name);
	      pynull()
	  | Stack_overflow ->
	      pycaml_seterror Pyerr_StandardError (Printf.sprintf "OCaml exception 'Stack_overflow'%s" exn_fun_name);
	      pynull()
	  | Sys_error s ->
	      pycaml_seterror Pyerr_StandardError (Printf.sprintf "OCaml exception 'Sys_error %s'%s" s exn_fun_name);
	      pynull()
	  | End_of_file ->
	      pycaml_seterror Pyerr_IOError (Printf.sprintf "OCaml exception 'End_of_file'%s" exn_fun_name);
	      pynull()
	  | Match_failure (filename,line,column) ->
	      pycaml_seterror Pyerr_StandardError (Printf.sprintf "OCaml exception 'Match_failure file=%s line=%d(c. %d)'%s" filename line column exn_fun_name);
	      pynull()
	  | Assert_failure (filename,line,column) ->
	      pycaml_seterror Pyerr_StandardError (Printf.sprintf "OCaml exception 'Assert_failure file=%s line=%d(c. %d)'%s" filename line column exn_fun_name);
	      pynull()
	  | something_else ->
	      if catch_weird_exceptions then
		begin
		  pycaml_seterror
		    Pyerr_StandardError
		    (Printf.sprintf "OCaml weird low-level exception, not resolved any further%s:\nOriginal error message: %s"
		       exn_fun_name
		       (Printexc.to_string something_else));
		  pynull()
		end
	      else raise something_else
  in
  let pyfun =
    (if error_name == None && register_as == None 
     then wrapper work_fun
     else
      let profiling_work_fun args =
	if not(!_py_profiling_active)
	then work_fun args
	else
	  let t0 = Unix.gettimeofday () in
	  let result = work_fun args in
	  let t1 = Unix.gettimeofday () in
	  let old_time_and_calls =
	    try Hashtbl.find _py_profile_hash error_namestring
	    with | Not_found ->
	      let x = [|0.0;0.0|] in
	      let () = Hashtbl.add _py_profile_hash error_namestring x in
	      x
	  in
	  begin
	    old_time_and_calls.(0) <- old_time_and_calls.(0) +.(t1-.t0);
	    old_time_and_calls.(1) <- old_time_and_calls.(1) +.1.0;
	    result
	  end
      in wrapper profiling_work_fun)
  in match register_as with
    | None -> pyfun
    | Some modulepath ->
      let () = py_register modulepath pyfun in
      pyfun
;;


(* pywrap_value will wrap up OCaml values for Python in such a way
   that Python can store this in containers, pass it around, and
   eventually hand it back to OCaml.

   As python is not statically typed in an OCaml-compatible way, this
   means that Python may hand back stuff to OCaml which is not of the
   expected type, without OCaml noticing.

   Again, Python users expect to get errors - not crashes - from
   programs, so we have to guard against this. How? By implementing
   some own primitive dynamic type system for python-wrapped OCaml
   values.

   Note: the conventions here are TF's own. Pycaml users need not use
   them, but they might be well advised to do so nevertheless.

   Design decisions:

   * OCaml will only provide opaque values of a manageable small
   number of types to Python.

   * We want to be able to register new types for Python encapsulation
   at runtime.

   * We abuse OCaml strings as type tag symbols, which have been
   uniq'd through an identity hash map.

   * The only values which are wrapped up for python are of the structure
   (type_tag_string,ref value)

   The ref in the second tuple slot may be a paranoid spurious indirection,
   but will ensure that we will always have a non-immediate in the second
   slot.

   * Note: If we use this in conjunction with some other Python foreign-function
   extension, then it might well happen that a mixup of opaque objects from us
   and that other extension produces a crash. We MIGHT be able to fix this if we
   extend the Python interpreter at low level with a new type for our purposes,
   and do not use PyCObject anymore.

   * It might sound ridiculous, but I consider it a major problem that
   so far, I could not come up with a nice, catchy name for the
   concept of python values that wrap up python-opaque ocaml
   values. Evidently, it is very desirable to have one.

   After a few failed attempts, the least bad name I can come up with is "ocamlpill".

   * ocamlpill type names are unique and considered as global. It is desirable
   to provide a Python function that returns this name, so those names should not be
   considered "for internal use only".

*)

(* Mapping name => Unique name. Type names are e.g. "Mesh.mesh". *)
let _known_ocamlpill_types = ((Hashtbl.create 10):((string, string) Hashtbl.t));;

let _ocamlpill_type_sym ocamlpill_type_name =
  try
    Hashtbl.find _known_ocamlpill_types ocamlpill_type_name
  with
    | Not_found ->
	failwith
	  (Printf.sprintf "Used ocamlpill_type '%s' without register_ocamlpill_type(\"%s\")"
	     ocamlpill_type_name ocamlpill_type_name)
;;

let ocamlpill_type_of pill =
  if pytype pill <> CamlpillType
    (* may happen if we e.g. look at list entries *)
  then raise (Pycaml_exn(Pyerr_TypeError,
			 Printf.sprintf "Expected OCaml pill - got: %s (%s)"
			   (pytype_name (pytype pill))
			   (py_repr pill)
			))
  else
    let (type_name, _) = pyunwrap_value pill
    in type_name (* This is already the uniq'd sym-string! *)
;;


let register_ocamlpill_types type_names =
  Array.iter
    (fun type_name ->
      if Hashtbl.mem _known_ocamlpill_types type_name
      then () (* -- already known *)
      else
	Hashtbl.add _known_ocamlpill_types type_name type_name)
    type_names
;;

let make_ocamlpill_wrapper_unwrapper ocamlpill_type_name prototypical_object =
  let ocamlpill_type_sym = _ocamlpill_type_sym ocamlpill_type_name
  in
  let wrapper x =
    pywrap_value_pill
      (ocamlpill_type_sym,
       (if false then prototypical_object else x)
	 (* typesystem hack *)
      )
  and unwrapper py_value =
    let (ocamlpill_type_sym_provided, xval)=pyunwrap_value py_value in
      if ocamlpill_type_sym_provided != ocamlpill_type_sym
	  (* Note the != not-the-same check; syms are uniq'd strings. *)
      then
	raise (Pycaml_exn (Pyerr_TypeError,
			   (Printf.sprintf "Python-Ocaml Pill Type mismatch: wanted: '%s' - got: '%s'"
			      ocamlpill_type_sym ocamlpill_type_sym_provided)))
      else
	let _ =
	  if false then prototypical_object (* Type-checking hack *)
	  else xval
	in xval
  in (wrapper, unwrapper)
;;

let ocamlpill_hard_unwrap pill =
  let (_, x)=pyunwrap_value pill in
    x
;;

(* There are situations where we want to provide optional python
   arguments. For the low-level interface, we use the convention to use a
   0-element or 1-element list. In most cases, this low-level convention
   will be wrapped up at a higher level python-wise so that the user of
   a module just sees an optional argument.

   This is somewhat tricky: we want to treat optional string/float/int
   args on the same footing as pill args. How do we do this? By a bit
   of combinatorical magic! The proper abstraction is to use a
   continuation function which will receive the unwrapped optional value,
   and an applicator, which may be some ocamlpill_applicator_for_xyz,
   or something like (fun py_x f -> f (pyint_asint py_x)), or just
   evaluate_at.

   Problem here: pyint_asint should also do an extra python typecheck
   in the example above! Hence, we need certain special applicators
   for python types...
*)

let py_optionally unwrapper py_value =
  (* Usually, the optional thingy comes in as an argument,
     and is checked in python_interfaced_function.
     This is not necessarily so, as optional thingies may be
     part of larger data structures, so we better check the type *)
  if pytype py_value != ListType
  then
    raise
      (Pycaml_exn
	 (Pyerr_TypeError,
	  Printf.sprintf "Expected optional argument to be provided as an empty or 1-element list. Got: %s (%s)"
	    (pytype_name (pytype py_value)) (py_repr py_value)))
  else
    let a = pylist_toarray py_value in
    if Array.length a > 1 then
      raise
	(Pycaml_exn
	   (Pyerr_TypeError,
	    Printf.sprintf "Expected optional argument to be provided as an empty or 1-element list. Got: %d-element list (%s)."
	      (Array.length a) (py_repr py_value)))
    else
      if Array.length a = 0 then None else Some (unwrapper a.(0))
;;

(* There are a few functions which we may want to use in conjunction with py_optionally to get
   optional integers, optional floats, etc., and not just optional pills
*)

let guarded_pyint_asint x =
  if pytype x <> IntType
  then raise
    (Pycaml_exn(Pyerr_TypeError,
		Printf.sprintf "Wanted: int, got: %s (%s)" (pytype_name (pytype x)) (py_repr x)))
  else pyint_asint x
;;

let guarded_pyfloat_asfloat x =
  if pytype x <> FloatType
  then raise
    (Pycaml_exn(Pyerr_TypeError,
		Printf.sprintf "Wanted: float, got: %s (%s)" (pytype_name (pytype x)) (py_repr x)))
  else pyfloat_asdouble x
;;

let guarded_pynumber_asfloat x =
  match pytype x with
    | FloatType -> pyfloat_asdouble x
    | IntType -> float_of_int (pyint_asint x)
    | _ ->
	raise
	  (Pycaml_exn(Pyerr_TypeError,
		      Printf.sprintf "Wanted: number, got: %s (%s)" (pytype_name (pytype x)) (py_repr x)))
;;


let guarded_pystring_asstring x =
  if pytype x <> StringType
  then raise
    (Pycaml_exn(Pyerr_TypeError,
		Printf.sprintf "Wanted: string, got: %s (%s)" (pytype_name (pytype x)) (py_repr x)))
  else pystring_asstring x
;;

let guarded_pylist_toarray x =
  if pytype x <> ListType
  then raise
    (Pycaml_exn(Pyerr_TypeError,
		Printf.sprintf "Wanted: list, got: %s (%s)" (pytype_name (pytype x)) (py_repr x)))
  else pylist_toarray x
;;

let guarded_pytuple_toarray x =
  if pytype x <> TupleType
  then raise
    (Pycaml_exn(Pyerr_TypeError,
		Printf.sprintf "Wanted: tuple, got: %s (%s)" (pytype_name (pytype x)) (py_repr x)))
  else pytuple_toarray x
;;


let pycallable_asfun py =
  if pytype py <> CallableType
  then
    raise
      (Pycaml_exn
	 (Pyerr_TypeError,
	  Printf.sprintf "Expected Python Callable - Got: %s (%s)" (pytype_name (pytype py)) (py_repr py)))
  else
    fun (args:(pyobject array)) ->
      pyeval_callobject(py,pytuple_fromarray args)
;;

let py_float_tensor ?(init=(fun _ -> 0.0)) index_ranges =
  let nr_indices = Array.length index_ranges in
  let v_indices = Array.make nr_indices 0 in
    if nr_indices = 0
    then (pyfloat_fromdouble (init v_indices), fun _ -> failwith "Cannot set rank-0 python float tensor!")
    else
      let rec build pos =
	let range = index_ranges.(pos) in
	  if pos = nr_indices-1
	  then
	    pylist_fromarray
	      (Array.init range
		 (fun ix_here ->
		    let () = v_indices.(pos) <- ix_here in
		      pyfloat_fromdouble (init v_indices)))
	  else
	    pylist_fromarray
	      (Array.init range
		 (fun ix_here ->
		    let () = v_indices.(pos) <- ix_here in
		      build (1+pos)))
      in
      let structure = build 0
      in
      let setter indices value =
	let rec walk sub_structure pos =
	  if pos = nr_indices-1
	  then pylist_set sub_structure indices.(pos) value
	  else walk (pylist_get sub_structure indices.(pos)) (1+pos)
	in walk structure 0
      in (structure,setter)
;;

(* Just for uniformity of nomenclature *)
let pylist_ftensor_new = py_float_tensor;;

(* Given a tensor (list of lists), returns a list of the maximum indices
   (basically the tensor shape)
 *)
let pylist_tensor_shape pyobj =
  let err_msg = "Malformed tensor: found two rows with different size." in
  let is_not_pylist x = (pytype x) <> ListType in
  let rec walk indices pyobj =
    if is_not_pylist pyobj
    then indices
    else
      let arr_of_pyrows = pylist_toarray pyobj in
      let num_pyrows = Array.length arr_of_pyrows in
        if num_pyrows = 0
        then 0::indices
        else
          let first_row = arr_of_pyrows.(0) in
            if is_not_pylist first_row
            then
              let () =
                Array.iter (* Check for tensor malformations *)
                  (fun item -> if is_not_pylist item
                               then () else failwith err_msg)
                  arr_of_pyrows
              in
                num_pyrows::indices
            else
              let size_first_row = pylist_size first_row in
              let _ =
                Array.fold_left (* Check for tensor malformations *)
                  (fun size_previous_row this_row ->
                     if is_not_pylist this_row
                     then failwith err_msg
                     else
                       let size_this_row = pylist_size this_row in
                         if size_this_row <> size_previous_row
                         then failwith err_msg
                         else size_previous_row)
                  size_first_row
                  arr_of_pyrows
              in
                walk (num_pyrows::indices) first_row
  in
    List.rev (walk [] pyobj)
;;

let pylist_ftensor_iter pyobj fn =
  let maxindices = Array.of_list (pylist_tensor_shape pyobj) in
  let num_indices = Array.length maxindices in
  let indices = Array.create num_indices 0 in
  let rec walk subpylist nr_idx =
    let max_idx = maxindices.(nr_idx) in
    if nr_idx = (num_indices - 1) then
      for idx = 0 to (max_idx - 1) do
        indices.(nr_idx) <- idx;
        fn indices subpylist idx;
      done
    else
      for idx = 0 to num_indices - 1 do
        indices.(nr_idx) <- idx;
        walk (pylist_get subpylist idx) (nr_idx + 1);
        () (* just to force (fn x y) to () *)
      done
  in
    walk pyobj 0
;;


(* Convert a tensor (python list of list of numbers) into a
   Bigarray.Genarray
 *)
let pylist_ftensor_to_ba pyobj =
  let maxindices = Array.of_list (pylist_tensor_shape pyobj) in
  let ba = Bigarray.Genarray.create
             Bigarray.float64 Bigarray.c_layout maxindices in
  let () =
    pylist_ftensor_iter pyobj
      (fun indices pyl pyl_idx ->
         let v = guarded_pynumber_asfloat (pylist_get pyl pyl_idx) in
           Bigarray.Genarray.set ba indices v)
  in
    ba
;;

(* Note: we do not subject the example/low-level python functions we provide here
   to profiling. Maybe we should.
*)

let _py_profiling =
  python_interfaced_function
    ~docstring:"Control profiling of python<->ocaml functions. Usage:

ocaml.sys_profiling(\"on\") -> turn on profiling, return previous on/off status (on=true)
ocaml.sys_profiling(\"off\") -> turn off profiling, return previous on/off status (on=true)
ocaml.sys_profiling(\"clear\") -> clear internal profiling tables
ocaml.sys_profiling(\"report\") -> return profiling report

Report format: list of (name,time,nr_calls), sorted by decreasing total time.
nr_calls is a floatingpoint number to overcome 32-bit integer limitations.
"
    [|StringType|]
    (fun arr ->
       let s = pystring_asstring arr.(0) in
	 match s with
	   | "on" ->
	       let z = py_activate_profiling() in
		 if z then py_true else py_false
	   | "off" ->
	       let z = py_activate_profiling() in
		 if z then py_true else py_false
	   | "clear" ->
	       let () = py_profile_reset() in pynone()
	   | "report" ->
	       let r = py_profile_report() in
		 pylist_fromarray
		   (Array.map
		      (fun (name,time,calls) ->
			 pytuple3 (pystring_fromstring name,
				   pyfloat_fromdouble time,
				   pyfloat_fromdouble calls))
		      r)
	   | _ -> pynone()
    )
;;

(* We provide a function to python that allows to check the type
   of an opaque OCaml object.
*)

let _py_ocamlpill_type =
  python_interfaced_function [|CamlpillType|]
    (fun arr ->
       let (type_name, _) = pyunwrap_value arr.(0)
       in pystring_fromstring type_name)
;;

(* Note: using ocaml.sys_python() will return
   the last value computed interactively.
 *)
let _py_python =
  python_interfaced_function [||]
    (fun arr ->
      let _ = python() in
      python_last_value()
    )
;;

let _py_ipython =
  python_interfaced_function [||]
    (fun arr ->
      let _ = ipython() in
      python_last_value()
    )
;;

let _py_check_heap =
  python_interfaced_function
    [||]
    (fun arr -> let _ = Gc.full_major () in py_true)
;;

let _py_gc_print_stat =
  python_interfaced_function
    [||]
    (fun arr ->
       begin
         Gc.print_stat stdout;
         Printf.printf "%!";
         pynone ()
       end)
;;

(* -- init -- *)

let _ =
  begin
    Callback.register_exception "ocaml_exn_pycaml" (Pycaml_exn (Pyerr_StandardError,""));
    ignore(pydict_setitemstring (_py_sys_modules_dict, "ocaml", _py_mod_ocaml));
    ignore(python_exec "import ocaml");
    register_for_python
      [|
	("sys_profiling",_py_profiling);
	(* -- This one is very important -- *)
	("sys_ocamlpill_type",_py_ocamlpill_type);
	(* -- This may seem very strange, but actually comes in handy -- *)
	("sys_python",_py_python);
	("sys_ipython",_py_ipython);
	("sys_check_heap",_py_check_heap);
        ("sys_gc_print_stat", _py_gc_print_stat);
	("sys_refcount",
	 python_interfaced_function
	   ~error_name:"sys_refcount"
	   [|AnyType|]
	   (fun py_args ->
	     pyint_fromint (pyrefcount py_args.(0))
	   ));

	(* -- Examples below -- *)
	("example_test_interface",
	 pywrap_closure
	   (fun _ ->
	      begin
		Printf.printf "This is printed by OCaml, called from Python!\n%!" ;
		pynone ()
	      end
	   ));
	("example_the_answer", pyint_fromint 42);
      |];
  end
;;

(* Nicer interface to Pycaml

   The structure of the Pycaml module is strongly constrained by
   compatibility requirements. We provide the "Pycaml.Nicerpy"
   module as an alternative that actually gives some thought to
   how names and interfaces are chosen.

   Nicerpy may be somewhat incomplete, as the choice is to err on the
   side of not including an interface rather than including a
   not-so-well-designed one - if you find important functions missing,
   please ask the pycaml maintainers to extend it.

 *)

module Nicerpy = 
  struct
    type py = pyobject
    type pytype = pyobject_type
    type pyerror = pyerror_type

    let profiler_on = py_activate_profiling
    let profiler_off = py_deactivate_profiling
    let profiler_reset = py_profile_reset
    let profiler_report = py_profile_report
	
    let py_to_type = pytype
    
    (* Not interfaced: py_initialize and py_finalize - 
       py_initialize is called when loading pycaml, and we assume
       python runs till the end of execution (should maybe register
       an atexit function).
     *)

    let repr = py_repr

    let array_to_pylist = pylist_fromarray
    let pylist_to_array = pylist_toarray
    let pylist_set = pylist_set
    let pylist_get = pylist_get
    let py_result  = python_last_value
    let py_true = py_true
    let py_false = py_false
    let py_null = pynull ()
    let py_none = pynone ()
    let py_to_bool = py_is_true

    let py_register = py_register
    let py_resolve = py_resolve

    (* Pills *)

    let define_pill_types = register_ocamlpill_types
    let pill_to_type = ocamlpill_type_of
    let pill_wrapper_unwrapper = make_ocamlpill_wrapper_unwrapper
  
    (* Common wrappers *)

    let py_optionally = py_optionally
    let py_to_int = guarded_pyint_asint
    let py_to_float = guarded_pynumber_asfloat
    let py_to_string = guarded_pystring_asstring

    let bool_to_py = pybool_frombool
    let int_to_py = pyint_fromint 
    let float_to_py = pyfloat_fromdouble
    let string_to_py = pystring_fromstring

    let fun_to_py = python_interfaced_function
    let py_to_fun = pycallable_asfun

    let id x = x (* useful for py_to_array *)

    let py_to_array mapper py =
      match py_to_type py with
      | ListType -> 
         let len = pysequence_length py in
         Array.init len (fun ix -> mapper (pylist_get py ix))
      | TupleType ->
         let len = pysequence_length py in
         Array.init len (fun ix -> mapper (pytuple_getitem (py,ix)))
      | _ -> failwith (Printf.sprintf "py_to_array: not a python array: %s" (repr py))

    let array_to_pylist mapper array = 
      pylist_fromarray (Array.map mapper array)

    let array_to_pytuple mapper array = 
      pytuple_fromarray (Array.map mapper array)

  (* Hash tables *)

    let ht_new = pydict_new

    let ht_get ?default h k =
      match default with
      | None ->
	  let z = pydict_getitem(h,k) in
	  if pytype z = NoneType then raise Not_found
	  else z
      | Some dfl ->
	  let z = pydict_getitem(h,k) in
	  if pytype z = NoneType then dfl
	  else z
	  
    let ht_set h k v = pydict_setitem(h,k,v)
    let ht_del h k = pydict_delitem(h,k)
    let ht_clear = pydict_clear
    let ht_keys h = py_to_array id (pydict_keys h)
    let ht_len = pydict_size

  (* Running Python code *)

    let py_exec = python_exec
    let py_eval = python_eval
    let py_load = python_load
    let py_repl = python
    let py_main = pymain
    let ipython = ipython

  end
;;
