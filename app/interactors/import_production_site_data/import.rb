module ImportProductionSiteData
  class Import
    include Interactor::Organizer

    organize ImportProductionSiteData::Fetch,
      ::DeflateData,
      ImportProductionSiteData::BackupCurrent,
      ::RecordData
  end
end
