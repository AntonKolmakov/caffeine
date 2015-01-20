module ImportProductionSiteData
  class Import
    include Interactor::Organizer

    organize ImportProductionSiteData::Fetch,
      ::UnpackData,
      ImportProductionSiteData::BackupCurrent,
      ::RecordData
  end
end
