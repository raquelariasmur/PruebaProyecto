module UsersHelper
  def usertypes
    User.usertypes.keys.map do |usertype|
      [t("activerecord.attributes.user.usertypes.#{usertype}"), usertype]
    end
  end

  def search_tranlation_value(search)
    result = t("activerecord.attributes.user.usertypes").map do |translation|
      if translation[1].casecmp(search) == 1 || translation[1].casecmp(search) == 0
        User.usertypes[translation[0]]
      end
    end
    result = result.map.reject(&:nil?)
    result[0]
  end
end
