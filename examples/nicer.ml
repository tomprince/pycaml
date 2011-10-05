(* Pycaml.Nicerpy is the more advanced and more convenient Python <-> OCaml interface.
 *)

#use "topfind";;
#require "pycaml";;

module P=Pycaml.Nicerpy;;

let xs=P.array_to_pylist
        P.float_to_py
        (Array.init 100 (fun n -> cos(8.0*.(atan 1.0)*.(float_of_int n)/.100.0)));;

let ys=P.array_to_pylist
        P.float_to_py
        (Array.init 100 (fun n -> sin(8.0*.(atan 1.0)*.(float_of_int n)/.100.0)));;

P.py_exec("import pylab");;
P.py_eval("pylab.gca().set_aspect('equal')");;
P.py_eval("pylab.grid()");;

(* Calling a Python function directly from ML *)
P.py_to_fun (P.py_eval("pylab.plot")) [|xs;ys;P.string_to_py "k-"|];;

P.py_eval("pylab.show()");;

