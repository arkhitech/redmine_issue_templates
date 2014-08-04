class GlobalIssueChecklistTemplate < ActiveRecord::Base
  unloadable
  belongs_to :global_issue_template
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  has_one :comment, :as => :commented, :dependent => :delete
  acts_as_list
  
  validates_presence_of :subject
    
  def info
    "[#{self.is_done ? 'x' : ' ' }] #{self.subject.strip}"
  end    
  
end
