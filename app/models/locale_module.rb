module LocaleModule
  def is_br?
    if I18n.locale == :"pt-BR"
      return true
    end
    return false
  end
end
