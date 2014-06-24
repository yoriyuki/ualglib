let get_ucd inf = try 
  let ic = if inf = "-" then stdin else open_in inf in
  let d = Uucd.decoder (`Channel ic) in 
  match Uucd.decode d with 
  | `Ok db -> db 
  | `Error e -> 
    let (l0, c0), (l1, c1) = Uucd.decoded_range d in
    Printf.eprintf "%s:%d.%d-%d.%d: %s\n%!" inf l0 c0 l1 c1 e; 
    exit 1
with Sys_error e -> Printf.eprintf "%s\n%!" e; exit 1

let () = Printf.printf "....."; flush_all ()

let ucd = get_ucd "ucd/ucd.all.grouped.xml"

let () = Printf.printf " done.\n"; flush_all ()
