class PageAttachmentDecorator < Draper::Decorator
  delegate_all

  ICON_CLASSES = {
      pdf: ['pdf'],
      doc: ['doc', 'docx'],
      xls: ['xls', 'xlsx'],
      zip: ['zip', 'rar', '7z'],
  }

  DEFAULT = 'file'

  def icon_class
    ext = object.attachment.file.extension

    ICON_CLASSES.each do |icon_class, values|
      return "attachments-sprite attachments-#{icon_class}" if (values.include? ext)
    end

    DEFAULT
  end
end