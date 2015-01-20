SimpleForm.setup do |config|
  config.wrappers :vertical_select, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :label, class: 'control-label'

    b.use :input, class: 'dropdown-select', wrap_with: { tag: 'div', class: 'dropdown' }
  end

  config.wrappers :decorate_file_input, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :readonly
    b.use :label, class: 'control-label'

    b.use :input
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :decorate_boolean, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly


    b.use :label_input
    b.use :label, class: 'switch'

    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

end