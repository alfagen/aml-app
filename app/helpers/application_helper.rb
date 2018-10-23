# frozen_string_literal: true

module ApplicationHelper
  ORDER_WORKFLOW_STATE_CLASSES = {
    'none'       => 'label-default',
    'pending'    => 'label-warning',
    'processing' => 'label-warning',
    'accepted'   => 'label-success',
    'rejected'   => 'label-danger'
  }.freeze

  def order_workflow_state(workflow_state)
    workflow_state = workflow_state.workflow_state if workflow_state.is_a? AML::Order

    classes = [:label]
    classes << ORDER_WORKFLOW_STATE_CLASSES[workflow_state]
    content_tag :span, workflow_state, class: classes
  end

  def top_breadcrumbs
    return if breadcrumbs.empty?

    content_tag :ol, class: 'breadcrumb' do
      render_breadcrumbs tag: :li, separator: '', class: '', item_class: '', divider_class: '', active_class: 'active'
    end
  end

  def title_with_counter(title, count, hide_zero: true, css_class: 'badge-success')
    [
      title,
      counter_badge(count, hide_zero: hide_zero, css_class: css_class)
    ].join(' ').html_safe
  end

  def paginate(objects, options = {})
    return unless objects.respond_to? :total_pages

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

  def active_style_order(workflow_state)
    workflow_state == :pending ? :inclusive : :exact
  end

  def app_title
    "AML #{AppVersion}"
  end

  def current_time_zone_offset
    ActiveSupport::TimeZone[current_time_zone].formatted_offset
  end

  def humanized_time_in_current_time_zone(time)
    I18n.l time.in_time_zone(current_time_zone)
  end
end
