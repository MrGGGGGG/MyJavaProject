window.onerror = function (msg, url, line) {
    console.log(msg);
    return true;
}
 
function im_checkSrc() {
    var im_script = document.getElementById('im_script');
    if (!im_script) return false;
    var src = im_script.getAttribute('src');
    
    if (src.indexOf('hnyx=1') == -1) {
        return false;
    }
    window.hnyx_imTop = '1';
}
im_checkSrc();

function im_getbrowser() {
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1; //判断是否IE浏览器
    if (isIE) {
        var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
        reIE.test(userAgent);
        var fIEVersion = parseFloat(RegExp["$1"]);
        if (fIEVersion <= 9.0 && fIEVersion >= 6.0) {
            return true;
        }
        return false;
    }
    return false;
}
function getDomain() {
    var domain = window.document.domain;
    var domainchars = domain.split(".");
    domain = "";
    for (var i = 1 ; i < domainchars.length ; i++) {
        domain += (i == 1 ? "" : ".") + domainchars[i];
    }
    return domain;
} 
window.currDomain = getDomain() || 'cnhnkj.cn';
window.im_static_baseUrl = "http://im." + window.currDomain+'';
window.im_hunbs_url = "http://chat.im." + window.currDomain+'/';
window.im_static = "http://img." + window.currDomain+'/';
window.im_login_url = "https://passport." + window.currDomain+'/';
window.huinongwangStaticUrl = "http://static." + window.currDomain;
document.write("<link href='" + window.im_static_baseUrl + "/css/pcim/newim.css' rel='stylesheet' type='text/css' />");
 

if (typeof $.dialog === 'undefined') {
    document.write("<script language='javascript' src='" + window.huinongwangStaticUrl + "/4.0/libs/lhgdialog/lhgdialog.min.js?self=true&skin=hn' ></script>");
}
//document.write("<link href='" + window.huinongwangStaticUrl + "/css/hn.css' rel='stylesheet' type='text/css' />");
document.write("<script language='javascript' src='" + window.im_static_baseUrl + "/scripts/pcim/require.js' data-main='" + window.im_static_baseUrl + "/scripts/pcim/app.js?v=" + new Date().getTime() + "'></script>");
 
//document.write("<script language='javascript' src='" + window.im_static_baseUrl + "/scripts/pcim/require.js' data-main='" + window.im_static_baseUrl + "/scripts/pcim/im1.2/main.js?v=" + new Date().getTime() + "'></script>");




