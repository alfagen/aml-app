# frozen_string_literal: true

module ApplicationHelper
  def top_breadcrumbs
    return if breadcrumbs.empty?

    content_tag :ol, class: 'breadcrumb' do
      render_breadcrumbs tag: :li, separator: '', class: '', item_class: '', divider_class: '', active_class: 'active'
    end
  end

  def title_with_counter(title, count, hide_zero: true, css_class: '')
    [
      title,
      counter_badge(count, hide_zero: hide_zero, css_class: css_class)
    ].join(' ').html_safe
  end

  def paginate(objects, options = {})
    options.reverse_merge!(theme: 'twitter-bootstrap-3')

    super(objects, options)
  end

  def counter_badge(count, hide_zero: true, css_class: '')
    content_tag(:span,
                hide_zero && count.to_i.zero? ? '' : count.to_s,
                class: ['badge', css_class].compact.join(' '),
                data: { title_counter: true, count: count.to_i })
  end

  def active_style_tab(workflow_state)
    workflow_state == :none ? :inclusive : :exact
  end

  def app_title
    "AML #{AppVersion}"
  end

  def method_missing(method, *args, &block)
    if respond_to_missing?(method)
      main_app.send(method, *args)
    else
      super
    end
  end

  private

  def respond_to_missing?(method_name)
    method_name.to_s.end_with?('_path', '_url') && main_app.respond_to?(method_name)
  end
end
