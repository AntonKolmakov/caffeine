class Export < Thor

  desc 'export data', 'export data'
  def data(*model)
    require './config/environment'
    ExportData.call(model: model)
  end
end