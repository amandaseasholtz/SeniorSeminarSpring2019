Budget.transaction do
    Budget.delete_all
    Budget.create( :name => 'bobby', :bid => "1", :department => "Dept1", :dmoney => 5643.5, :title => "advisor")
    Budget.create( :name => 'brenda', :bid => "2", :department => "Dept2", :dmoney => 25321.5, :title => "advisor")
    Budget.create( :name => 'billy', :bid => "3", :department => "Dept3", :dmoney => 1124.5, :title => "advisor")
end

Payment.transaction do
    Payment.delete_all
    Payment.create( :name => 'paul', :pid => "1", :title => "manager")
end
  
Account.transaction do
    Account.delete_all
    Account.create( :email => 'b1@b.com', :password => '123456', :password_confirmation => '123456', 
                    :accountable => Budget.find_by_name("bobby"))
    Account.create( :email => 'b2@b.com', :password => '123456', :password_confirmation => '123456', 
                    :accountable => Budget.find_by_name("brenda"))
    Account.create( :email => 'b3@b.com', :password => '123456', :password_confirmation => '123456', 
                    :accountable => Budget.find_by_name("billy"))
    Account.create( :email => 'p1@p.com', :password => '123456', :password_confirmation => '123456', 
                    :accountable => Payment.find_by_name("paul"))
end
  