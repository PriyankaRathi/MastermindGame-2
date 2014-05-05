def is_valid_number?(target_colors)
  /\A\d+\Z/.match(target_colors.join) == nil ? false : true
end

def is_duplicate?(target_colors)
  target_colors.length == target_colors.uniq.length
end