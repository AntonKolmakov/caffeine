class Export < Thor

  desc 'export data', "export data from production site, call as 'thor export:data Page Album'"
  def data(*model)
    require './config/environment'
    ExportProductionSiteData::Export.call(model: model)
  end
end