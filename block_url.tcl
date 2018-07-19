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
