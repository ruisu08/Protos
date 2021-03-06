﻿
    tinyMCE.init({
        // General options
        mode: "textareas",
        theme: "advanced",
        language: "es",
        encoding: "xml",
         plugins : "autolink,lists,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",
         // Theme options
         theme_advanced_buttons1: "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontselect,fontsizeselect",
         theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,image,|,preview,|,forecolor,backcolor",
         theme_advanced_buttons3: "tablecontrols,|,hr,|,emotions,iespell,|,fullscreen",
         theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute",
         theme_advanced_toolbar_location: "top",
         theme_advanced_toolbar_align: "left",
         theme_advanced_statusbar_location: "bottom",
         theme_advanced_resizing: true,
         height : '300',
         width : '450',
         file_browser_callback : "filebrowser",
         max_chars: "1998",
         setup: function (ed) {
             ed.onKeyDown.add(function (ed, evt) {
                 if ($(ed.getBody()).text().length + 1 > ed.getParam('max_chars')) {
                     evt.preventDefault();
                     evt.stopPropagation();
                     return false;
                 }
             });
         }
     });

function filebrowser(field_name, url, type, win) {
    fileBrowserURL = "/FileManager/Default.aspx";
    tinyMCE.activeEditor.windowManager.open({
        title: "Ajax File Manager",
        url: fileBrowserURL,
        width: 950,
        height: 650,
        inline: 0,
        maximizable: 1,
        close_previous: 0
    }, {
        window: win,
        input: field_name,
        sessionid: '<%= Session.SessionID.ToString() %>'
    }
);
}

