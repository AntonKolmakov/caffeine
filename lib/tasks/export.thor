class Export < Thor

  desc 'export data', 'export data'
  def data(*model)
    require './config/environment'
    ExportProductionSiteData::Export.call(model: model)
  end
end