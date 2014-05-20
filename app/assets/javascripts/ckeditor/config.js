CKEDITOR.editorConfig = function (config) {
  config.language = 'en';
  config.toolbar_Pure = [
    { name: 'clipboard',   items: [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
    { name: 'editing',     items: [ 'Find','Replace','-','SelectAll','-','SpellChecker' ] },
    { name: 'links',       items: [ 'Link','Unlink','Anchor' ] },
    { name: 'insert',      items: [ 'Image','Table','HorizontalRule'] },
    '/',
    { name: 'styles',      items: [ 'Format'] },
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline','-','RemoveFormat' ] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight' ] },
  ];
  config.toolbar = 'Pure';
  return true;
}
