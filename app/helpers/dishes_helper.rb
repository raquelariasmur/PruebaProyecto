module DishesHelper
    def search_translation_value(search)
        result = t("activerecord.attributes.dish.state").map do |translation|
          if translation[1].casecmp(search) == 0
            translation[0]
          end
        end
        result = result.map.reject(&:nil?)
        result[0]
    end
  end
