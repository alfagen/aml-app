class ApplicationDecorator < Draper::Decorator
  delegate_all

  def alive?
    if object.alive?
      'действующий'
    else
      h.content_tag :span, 'архив', class: 'label label-default'
    end
  end

  def first_name
    object.first_name.presence || none
  end

  def surname
    object.surname.presence || none
  end

  def patronymic
    object.patronymic.presence || none
  end

  def birth_date
    return none if object.birth_date.nil?

    h.l object.birth_date, format: :default
  end

  def created_at
    l object.created_at
  end

  def aml_status
    object.aml_status.presence || h.content_tag(:span, 'не установлен', class: 'label label-default')
  end

  private

  def none
    h.content_tag :span, 'не указано', class: 'text-muted'
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
end
