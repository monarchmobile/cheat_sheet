# Available callbacks you can use
(-) save 

(-) valid

(1) before_validation
	before_validation(:on => :create) do
	    self.number = number.gsub(%r[^0-9]/, "") if attribute_present?("number")
	end

(-) validate

(2) after_validation

(3) before_save

(4) before_create
	before_create :record_signup

	  private
	    def record_signup
	      self.signed_up_on = Date.today
	    end

(-) create

(5) after_create

(6) after_save

(7) after_commit

(8) before_destroy
	before_destroy { |record| Person.destroy_all "firm_id = #{record.id}"   }
	before_destroy { |record| Client.destroy_all "client_of = #{record.id}" }