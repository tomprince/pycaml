#use "topfind";;
#require "pycaml";;

open Pycaml;;

(* The Gamma function *)

let rec euler_gamma =
  (* Accurate to eps_rel = 2e-10; See http://www.rskey.org/gamma.htm *)
  let pi = 4.0*.(atan 1.0) in
  let constants =
    [|75122.6331530; 80916.6278952; 36308.2951477;
      8687.24529705; 1168.92649479; 83.8676043424;
      2.50662827511|]
  in
  let nr_constants = Array.length constants in
    fun x ->
      if x<0.0
      then -.pi/.(x*.(euler_gamma (-.x))*.(sin (pi*.x)))
      else
	let rec compute_sum_prod sum prod pow_x n =
	  if n=nr_constants then sum/.prod
	  else
	    compute_sum_prod
	      (sum+.constants.(n)*.pow_x)
	      (prod*.(x+.(float_of_int n)))
	      (pow_x*.x) (n+1)
	in
	let x5 = x+.5.5 in
	  exp(-.x5)*.(x5**(x+.0.5))
	  *.(compute_sum_prod 0.0 1.0 1.0 0)
in
let _py_gamma =
  python_interfaced_function [|FloatType|]
    (fun py_args -> pyfloat_fromdouble (euler_gamma (pyfloat_asdouble py_args.(0))))
in
  register_for_python [|("gamma",_py_gamma)|]
;;

Printf.printf "This example provides an implementation of the Gamma function.\n";;
Printf.printf "Example usage: ocaml.gamma(42.0)\n%!";;

python();;
