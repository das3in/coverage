class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :tournament, optional: true

  scope :for_display, -> { order(created_at: :desc).last(50) }

  def display_content
    coderayified = CodeRayify.new(hard_wrap: true)
    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(content).html_safe
  end
end
