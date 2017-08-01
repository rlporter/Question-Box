class Post < ApplicationRecord
  belongs_to :user

  # before_save :assign_markdown_content, if: -> { content_changed? }
  #
  # def assign_markdown_content
  #   assign_attributes({
  #     markdown_content: self.class.markdown.render(content)
  #   })
  # end
end
