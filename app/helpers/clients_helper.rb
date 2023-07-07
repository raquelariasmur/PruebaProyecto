module ClientsHelper
  def search_tranlation_value(search)
    result = t("activerecord.attributes.client.enable").map do |translation|
      if translation[1].casecmp(search) == 0
        translation[0]
      end
    end
    result = result.map.reject(&:nil?)
    result[0]
  end
end
