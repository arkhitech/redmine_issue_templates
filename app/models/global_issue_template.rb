class GlobalIssueTemplate < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  belongs_to :tracker
  validates :title, :presence => true
  validates :tracker, :presence => true
  validates_uniqueness_of :title, :scope => :tracker_id
  acts_as_list :scope => :tracker
  has_many :issue_checklist_templates, :class_name => 'GlobalIssueChecklistTemplate'
  
  accepts_nested_attributes_for :issue_checklist_templates
  has_and_belongs_to_many :projects

  # author and project should be stable.
  safe_attributes 'title',
    'description',
    'tracker_id',
    'note',
    'enabled',
    'issue_title',
    'project_ids',
    'enabled_sharing',
    'visible_children', 
    'global_issue_checklist_template_attributes',
    'check_list_items',
    'subject'
  
  def enabled?
    self.enabled == true
  end

  def <=>(global_issue_template)
    position <=> global_issue_template.position
  end
  
  def checklist
    issue_checklist_templates || []
  end
end
