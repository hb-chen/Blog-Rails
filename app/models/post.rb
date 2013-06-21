class Post < ActiveRecord::Base
    belongs_to :category
    
  	attr_accessible :content, :name, :title, :tags_attributes, :categories_attributes
	  validates :name,  	:presence => true
  	validates :title, 	:presence => true,
            			      :length => { :minimum => 5 },
                        :uniqueness => { :message => "Message"}
    has_many :comments, :dependent => :destroy
    
    has_many :tags
  	accepts_nested_attributes_for :tags, :allow_destroy => :true,
  	:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
    
end