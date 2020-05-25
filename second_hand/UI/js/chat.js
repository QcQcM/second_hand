/* ——聊天编辑器区域 */
var $editor = $(".J__editorText"), editor = $editor[0];
var $face = $(".emotion-area dd img");
$face.on("click", function(e){
    if($(this).hasClass("face")){ //图像
        var img = $(this)[0].cloneNode(true);
        
        editor.focus();
        setTimeout(function(){
            var range, node;
            if(document.selection && document.selection.createRange){
                document.selection.createRange().pasteHTML(img);
            }else if(window.getSelection && window.getSelection().getRangeAt){
                range = window.getSelection().getRangeAt(0);
                range.insertNode(img);
                range.collapse(false);
                
                var sel = window.getSelection();
                sel.removeAllRanges();
                sel.addRange(range);
            }
        }, 16);
    }else if($(this).hasClass("del")){ //删除
        editor.focus();
        
        range = window.getSelection().getRangeAt(0);
        range.collapse(false);
        
        var sel = window.getSelection();
        sel.removeAllRanges();
        sel.addRange(range);
        document.execCommand("delete");
    }
});

//...格式化编辑器包含标签
editor.addEventListener("focus", function(evt) {
    surrounds()
}, true);
editor.addEventListener("input", function(evt) {
    surrounds();
}, false);
function surrounds() {
    setTimeout(function () { //chrome
        var sel = window.getSelection();
        var anchorNode = sel.anchorNode;
        if (!anchorNode) return;
        if (sel.anchorNode === editor ||
            (sel.anchorNode.nodeType === 3 && sel.anchorNode.parentNode === editor)) {
            
            var range = sel.getRangeAt(0);
            var p = document.createElement("p");
            range.surroundContents(p);
            range.selectNodeContents(p);
            range.insertNode(document.createElement("br")); //chrome
            sel.collapse(p, 0);
            
            (function clearBr() {
                var elems = [].slice.call(editor.children);
                for (var i = 0, len = elems.length; i < len; i++) {
                    var el = elems[i];
                    if (el.tagName.toLowerCase() == "br") {
                        editor.removeChild(el);
                    }
                }
                elems.length = 0;
            })();
        }
    }, 0);
}

//...滚动到聊天内容底部
function scrollToBottom(){
    $('.ws__chatMsg-panel').animate({scrollTop: $("#J__chatMsgList").height()}, 300);
}