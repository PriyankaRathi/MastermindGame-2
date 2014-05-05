module GamesHelper
  def table_generator(guesses)
    return false unless guesses.any?
    content_tag(:table) do
      content_tag(:tbody) do
        guesses.each do |guess|
          if guess.id
            fields = guess.guessed_colors
            content_tag(:tr) do
              fields.each do |color|
                content_tag(:td, image_tag(Color.color_image_name_from_color_id(color.color_id), alt: Color.color_image_name_from_color_id(color.color_id)))
              end
              content_tag(:td, pluralize_sentence(guess.correct_digits_count, "color_count"))
              content_tag(:td, pluralize_sentence(guess.correct_at_wrong_postion_digit_count, "color_count_wrong_postion"))
            end
          end
        end
      end
    end
  end

  def pluralize_sentence(count, i18n_id, plural_i18n_id = nil)
    if count <= 1
      I18n.t(i18n_id, :count => count)
    else
      I18n.t(plural_i18n_id || (i18n_id << "_plural"), :count => count)
    end
  end
end