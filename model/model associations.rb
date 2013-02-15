----- index -----
has_many through
belongs_to

----- index ---------
# has_many through
 #company
  has_many :investments, foreign_key: "company_id", dependent: :destroy
  has_many :investors, through: :investments

# belongs_to
 #investment
  belongs_to :company, class_name: "Company"
  belongs_to :investor, class_name: "Investor"

 #investor
  has_many :investments, foreign_key: "investor_id"
  has_many :companies, through: :investments, source: :company

class User < ActiveRecord::Base
  has_many :sent_referrals, :class_name => 'Referral', :foreign_key => 'sender_id'
  has_many :sent_jobs, :through => :sent_referrals, :foreign_key => 'job_id', :source => :job
  has_many :received_referrals, :class_name => 'Referral', :foreign_key => 'recipient_id'
  has_many :received_jobs, :through => :received_referrals, :foreign_key => 'job_id', :source => :job
end
class Referral < ActiveRecord::Base
  belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_id'
  belongs_to :recipient, :class_name => 'User', :foreign_key => 'recipient_id'
  belongs_to :job
end
class Job < ActiveRecord::Base
  has_many :referrals
  has_many :senders, :through => :referrals
  has_many :recipients, :through => :referrals
end


# User
  has_many :sent_leads, class_name: "Lead", foreign_key: "referrer_id"
  has_many :sent_referrals, through: :sent_leads, foreign_key: "referral_id", source: :referral

  has_many :received_leads, class_name: "Lead", foreign_key: "referee_id"
  has_many :received_referrals, through: :received_leads, foreign_key: "referral_id", source: :referral

# Lead
  belongs_to :referrer, class_name: "User", foreign_key: "referrer_id"
  belongs_to :referee, class_name: "User", foreign_key: "referee_id"
  belongs_to :referral

# referral
  has_many :leads
  has_many :referrers, through: :leads
  has_many :referees, through: :leads