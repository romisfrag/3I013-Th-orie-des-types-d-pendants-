open OUnit2
open Sexplib
open Lambda


(* ------------------------- test substitution  --------------------------- *)

			       (*  
let test_sub_inTm4 test_ctxt = assert_equal
				 (substitution_inTm  (Inv(Ifte(True,BVar 0,BVar 0))) (FVar "x") 0 )
				 (Inv(Ifte(True,FVar "x",FVar "x")))
 *)
			       
let inputs = 
  [("(lambda x (x 0))",(FVar "y"),"(lambda x (y 0))");
   ("(pi x * (pi y x *))",(FVar "lol"),"(pi x * (pi y lol *))");
   ("(lambda x (succ x))",(FVar "lol"),"(lambda x (succ lol))");
  ]


(* il va me falloir une technique pour les noms je pense le faire avec gensym *)

let tests = List.map (fun (term,sub,res) -> "lol" >:: fun ctxt -> assert_equal (substitution_inTm (read term) sub (-1)) (read res)) inputs

