let getindex path =
  try
    let ic = open_in_bin path in
    let index = input_value ic in
    close_in ic;
    index
  with _ ->
    []
;;

let main indexpath container =
  let index = getindex indexpath in
  let hash = Hashtbl.create 100 in
  let rec loop () =
    match try Some (input_line stdin) with End_of_file -> None with
    | None -> ()
    | Some line ->
        let offset, size, path =
          Scanf.sscanf line "%x %d %s"
            (fun offset size path -> (offset, size, path))
        in
        let name = Filename.basename path in
        if not (Hashtbl.mem hash name)
        then
          Hashtbl.add hash name (offset, size)
        ;
        loop ()
  in
  loop ();
  let oc = open_out_bin indexpath in
  output_value oc ((container, hash) :: index);
  close_out oc;
;;

let _ = main Sys.argv.(1) Sys.argv.(2);;
