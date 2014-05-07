def is_valid_number?(target_colors)
  /\A\d+\Z/.match(target_colors.join).present?
end

def is_duplicate?(target_colors)
  target_colors.length == target_colors.uniq.length
end

def enter_guess(colors)
  colors.each_with_index do |color, index|
    page.select(color, :from => "guess_guessed_colors_attributes_#{index}_color_id")
  end
end

def submit_guess(colors)
  enter_guess(colors)
  page.click_button('Check')
end