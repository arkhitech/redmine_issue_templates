class CreateGlobalIssueChecklistTemplates < ActiveRecord::Migration
  def self.up
    create_table :global_issue_checklist_templates do |t|
      t.boolean :is_done, :default => false
      t.string :subject
      t.integer :position, :default => 1
      t.references :global_issue_template, :null => false 
    end
  end

  def self.down
    drop_table :global_issue_checklist_templates
  end
end
