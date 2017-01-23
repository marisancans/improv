module EventHelper
  def edit_events_button options={}, data={}, icon_options={}
    button_tag class: options, data: data do
      content_tag(:i, 'mode_edit', class: icon_options)
    end
  end
    
end
