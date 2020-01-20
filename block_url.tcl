  when DNS_REQUEST {
    set lower [string tolower [DNS::question name]]
    set q_name_label_split [split $lower "."]
    set q_name_label [lindex $q_name_label_split end-1]

  if {[class match $q_name_label equals "URL_blocking"] }
  {
     #log local0. "website blocked [DNS::question name] <$q_name_label> $q_name_label $lower"
     DNS::header rcode NXDOMAIN
     DNS::return
  }  
    } 

  
  when DNS_REQUEST {

  if {[class match [DNS::question name] ends_with "first_dg"]} {
     DNS::header rcode NXDOMAIN
     DNS::return
     return
  }
    if {[class match [DNS::question name] equals "second_dg"]} {
     DNS::header rcode NXDOMAIN
     DNS::return
     return
  }
}
