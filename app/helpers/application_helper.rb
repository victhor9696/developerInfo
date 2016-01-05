module ApplicationHelper
  def protect html
    replacements = [
      "<script>",
      "</script>",
      "<html>",
      "</html>",
      "<frame>",
      "</frame>",
      ":javascript",
      "$.ajax"
    ]
    replacements.each do |rep|
      html.gsub!(rep,"").nil? ? html : html.sub!(rep,"")
    end
    return html
  end
end
