# dynamic  variable
 match "/clients/:status", to: "clients/index", :foo => "bar"

 clients_active_path  #--> :status is set to "active" && :foo => "bar