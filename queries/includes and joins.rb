CONDITIONS
# condition inside join table using arel table
Interest.includes(:bids).where(Bid.arel_table[:price].not_eq(nil))
# condition inside join table using string comparison
User.joins(:pets).where("pets.name != 'fluffy'")


ORDER
# order by joins table column
Interest.includes(:bids).order("bids.updated_at DESC")


NESTED
#nested join table products -> interests -> bids
Product.includes(:interests => :bid).where(Bid.arel_table[:price].not_eq(nil))