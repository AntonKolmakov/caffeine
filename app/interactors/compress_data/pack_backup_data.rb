module CompressData
  class PackBackupData
    include Interactor::Organizer

    organize CompressData::Prepare, CompressData::Compress, CompressData::Write
  end
end
