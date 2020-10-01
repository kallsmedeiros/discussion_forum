class ForumThread < ApplicationRecord
  belongs_to :parent, :class_name => "ForumThread"
  has_many :children, :class_name => "ForumThread", :foreign_key => 'parent_id'
  before_save :change_text_backlist
  before_save :set_level

  def descendents
    children.map do |child|
      [child] + child.descendents
    end.flatten
  end

  def set_level
    return unless parent_id.present?
    f_level = parent.try(:level)
    self.level = (f_level.to_i + 1)
  rescue => e
    p e.message
  end

  def change_text_backlist
    list = BlackList.pluck(:text)
    text_str = text.tr('4@0','aao')
    list.each do |l|
      next unless text_str.downcase.include?(l.downcase)
      self.text = text.split(' ').map{|t| t.downcase.tr('4@0','aao').include?(l.downcase) ? t.downcase.tr('4@0','aao').gsub(l.downcase, ('X'*l.size)) : t }.join(' ')
    end
  rescue => e
    p e.message
  end
end
