#use "topfind";;
#require "pycaml";;

open Pycaml;;

let _py_make_powers =
  python_interfaced_function
    ~extra_guards:
    [|(fun py_len ->
	 let len = pyint_asint py_len in
	   if len < 0
	   then Some "Negative Length"
	   else None);
      (fun _ -> None); (* This check never fails *)
    |]
    [|IntType;FloatType|]
    (fun py_args ->
       let len = pyint_asint py_args.(0)
       and pow = pyfloat_asdouble py_args.(1)
       in
	 float_array_to_python
	   (Array.init len (fun n -> let nn = float_of_int (n+1) in nn**pow)))
and
    _py_hypotenuse_2d =
  python_interfaced_function
    [|FloatType;FloatType|]
    (fun py_args ->
       let x = pyfloat_asdouble py_args.(0)
       and y = pyfloat_asdouble py_args.(1)
       in pyfloat_fromdouble (sqrt(x*.x+.y*.y)))
in
  register_for_python
    [|("make_powers", _py_make_powers);
      ("hypotenuse", _py_hypotenuse_2d);
    |]
;;

Printf.printf "This example provides two functions: make_powers and hypotenuse.\n";;
Printf.printf "make_powers(n,k) creates a list containing the k-th powers of all integers in the range 1,...,n.\n";;
Printf.printf "hypotenuse(x,y) computes the hypotenuse of a right-angled triangle with sides x,y.\n\n";;
Printf.printf "Example usage:\n";;
Printf.printf "   ocaml.make_powers(5, 2.0)   -->  [1.0, 4.0, 9.0, 16.0, 25.0]\n";;
Printf.printf "   ocaml.hypotenuse(3.0, 4.0)  -->  5.0\n%!";;

python();;
