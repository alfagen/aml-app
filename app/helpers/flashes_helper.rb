# Хелпер показывает рельсовые флешки через window.Flash
#
module FlashesHelper
  DEFAULT_TYPE = :warning
  TYPES = { alert: :error, notice: :info }

  def noty_flash_javascript(key, message)
    noty_type = TYPES[key.to_sym] || DEFAULT_TYPE

    "window.Flash.show(#{noty_type.to_json}, #{message.to_json})"
  end
end
