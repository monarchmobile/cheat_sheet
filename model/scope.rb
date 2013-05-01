Article.all(:conditions => {:published => true})
 
 -or-

 Article.published.all

 	where:
 		named_scope :published, :conditions => {:published => true}


 # lamda
 double = lambda{|x| x * 2}

 double.call 21 => 42


 named_scope :published_before, 
 		lambda{|date| {:conditions => ["published_at < ?", date] } }
 Article.published_before(Time.now.beginning_of_year).featured.all