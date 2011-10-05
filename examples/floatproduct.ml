#use "topfind";;
#require "pycaml";;

open Pycaml;;

let register_name="foo.bar.floatproduct";;

let _ = 
  python_interfaced_function 
    ~register_as:register_name
    ~docstring:"Compute the Product of two floatingpoint numbers in OCaml"
    [|FloatType;FloatType|]
    (fun py_args ->
      let x = pyfloat_asdouble py_args.(0)
      and y = pyfloat_asdouble py_args.(1)
      in pyfloat_fromdouble ( x*.y))
;;

Printf.printf "This example defines an Ocaml function which computes the product of\n";;
Printf.printf "two floats and registers it as a python function called 'floatproduct'.\n\n";;
Printf.printf "From the python prompt, try '%s(3.0,4.0)' (after importing foo.bar if necessary).\n%!" register_name;;

python();;
