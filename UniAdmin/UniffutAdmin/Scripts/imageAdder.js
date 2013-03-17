tinyMCE.init({
    // General options
    mode: "exact",
    elements: 'multimediaAdder',
    theme: "advanced",
    encoding: "xml",
    plugins: "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount",
    // Theme options
    theme_advanced_buttons1: "image",
    theme_advanced_buttons2: "",
    theme_advanced_buttons3: "",
    theme_advanced_toolbar_location: "top",
    theme_advanced_toolbar_align: "left",
    theme_advanced_statusbar_location: "bottom",
    theme_advanced_resizing: true,
    relative_urls: false,
    remove_script_host: true,
    document_base_url: "",
    file_browser_callback: "filebrowser",
    max_chars: "0",
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