/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
 config.filebrowserBrowseUrl = '../ckfinder/ckfinder.html';  
 config.filebrowserImageBrowseUrl = '../ckfinder/ckfinder.html?type=Images';  
 config.filebrowserFlashBrowseUrl = '../ckfinder/ckfinder.html?type=Flash';  
 config.filebrowserUploadUrl = '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files'; 
 config.filebrowserImageUploadUrl = '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images'; 
 config.filebrowserFlashUploadUrl = '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash' ;
 config.language = "zh-cn";
 config.image_previewText=' '; //预览区域显示内容
 config.skin = 'kama';//默认皮肤
 // config.skin = 'v2';
 /*config.skin = 'office2003';*/
 
 config.toolbar = 'Full';
 
 config.toolbar_Full =
 [
     ['Source','-','Save','NewPage','Preview','-','Templates'],
     ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
     ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
     ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
     '/',
     ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
     ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
     ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
     ['Link','Unlink','Anchor'],
     ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
     '/',
     ['Styles','Format','Font','FontSize'],
     ['TextColor','BGColor'],
     ['Maximize', 'ShowBlocks','-','About']
 ];

 config.toolbar_Basic =
 [
     ['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-','About']
 ];
 
};