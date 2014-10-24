SimpleForm.setup do |config|
  config.wrappers :vertical_select, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :label, class: 'control-label'

    b.use :input, class: 'dropdown-select', wrap_with: { tag: 'div', class: 'dropdown' }
  end
end