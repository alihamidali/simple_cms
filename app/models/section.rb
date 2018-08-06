class Section < ApplicationRecord
	has_many :section_edits
	belongs_to :page

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("name ASC") }
	scope :newest_first, lambda { order("created_at DECS") }
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }
end
