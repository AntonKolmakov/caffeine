CKEDITOR.config.toolbar_mini =
    [
        ['Source','Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
        ['NumberedList','BulletedList','-','Outdent','Indent'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink'],
        ['Image','Table','HorizontalRule','CreateDiv'],
        ['Styles','Format','Font','FontSize'],
        ['TextColor','BGColor']
    ];
CKEDITOR.config.allowedContent = true;
CKEDITOR.config.extraAllowedContent = ['*[*](*)'];
CKEDITOR.dtd.$removeEmpty.i = 0;
CKEDITOR.dtd.$removeEmpty.span = 0;