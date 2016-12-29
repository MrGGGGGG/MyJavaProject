/*property
    JSON, apply, call, charCodeAt, getUTCDate, getUTCFullYear, getUTCHours,
    getUTCMinutes, getUTCMonth, getUTCSeconds, hasOwnProperty, join,
    lastIndex, length, parse, prototype, push, replace, slice, stringify,
    test, toJSON, toString, valueOf
*/


// Create a JSON object only if one does not already exist. We create the
// methods in a closure to avoid creating global variables.

if (typeof JSON !== 'object') {
    JSON = {};
}

(function () {
    'use strict';
    
    var rx_one = /^[\],:{}\s]*$/,
        rx_two = /\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,
        rx_three = /"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,
        rx_four = /(?:^|:|,)(?:\s*\[)+/g,
        rx_escapable = /[\\\"\u0000-\u001f\u007f-\u009f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
        rx_dangerous = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;

    function f(n) {
        // Format integers to have at least two digits.
        return n < 10 
            ? '0' + n 
            : n;
    }
    
    function this_value() {
        return this.valueOf();
    }

    if (typeof Date.prototype.toJSON !== 'function') {

        Date.prototype.toJSON = function () {

            return isFinite(this.valueOf())
                ? this.getUTCFullYear() + '-' +
                        f(this.getUTCMonth() + 1) + '-' +
                        f(this.getUTCDate()) + 'T' +
                        f(this.getUTCHours()) + ':' +
                        f(this.getUTCMinutes()) + ':' +
                        f(this.getUTCSeconds()) + 'Z'
                : null;
        };

        Boolean.prototype.toJSON = this_value;
        Number.prototype.toJSON = this_value;
        String.prototype.toJSON = this_value;
    }

    var gap,
        indent,
        meta,
        rep;


    function quote(string) {

// If the string contains no control characters, no quote characters, and no
// backslash characters, then we can safely slap some quotes around it.
// Otherwise we must also replace the offending characters with safe escape
// sequences.

        rx_escapable.lastIndex = 0;
        return rx_escapable.test(string) 
            ? '"' + string.replace(rx_escapable, function (a) {
                var c = meta[a];
                return typeof c === 'string'
                    ? c
                    : '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
            }) + '"' 
            : '"' + string + '"';
    }


    function str(key, holder) {

// Produce a string from holder[key].

        var i,          // The loop counter.
            k,          // The member key.
            v,          // The member value.
            length,
            mind = gap,
            partial,
            value = holder[key];

// If the value has a toJSON method, call it to obtain a replacement value.

        if (value && typeof value === 'object' &&
                typeof value.toJSON === 'function') {
            value = value.toJSON(key);
        }

// If we were called with a replacer function, then call the replacer to
// obtain a replacement value.

        if (typeof rep === 'function') {
            value = rep.call(holder, key, value);
        }

// What happens next depends on the value's type.

        switch (typeof value) {
        case 'string':
            return quote(value);

        case 'number':

// JSON numbers must be finite. Encode non-finite numbers as null.

            return isFinite(value) 
                ? String(value) 
                : 'null';

        case 'boolean':
        case 'null':

// If the value is a boolean or null, convert it to a string. Note:
// typeof null does not produce 'null'. The case is included here in
// the remote chance that this gets fixed someday.

            return String(value);

// If the type is 'object', we might be dealing with an object or an array or
// null.

        case 'object':

// Due to a specification blunder in ECMAScript, typeof null is 'object',
// so watch out for that case.

            if (!value) {
                return 'null';
            }

// Make an array to hold the partial results of stringifying this object value.

            gap += indent;
            partial = [];

// Is the value an array?

            if (Object.prototype.toString.apply(value) === '[object Array]') {

// The value is an array. Stringify every element. Use null as a placeholder
// for non-JSON values.

                length = value.length;
                for (i = 0; i < length; i += 1) {
                    partial[i] = str(i, value) || 'null';
                }

// Join all of the elements together, separated with commas, and wrap them in
// brackets.

                v = partial.length === 0
                    ? '[]'
                    : gap
                        ? '[\n' + gap + partial.join(',\n' + gap) + '\n' + mind + ']'
                        : '[' + partial.join(',') + ']';
                gap = mind;
                return v;
            }

// If the replacer is an array, use it to select the members to be stringified.

            if (rep && typeof rep === 'object') {
                length = rep.length;
                for (i = 0; i < length; i += 1) {
                    if (typeof rep[i] === 'string') {
                        k = rep[i];
                        v = str(k, value);
                        if (v) {
                            partial.push(quote(k) + (
                                gap 
                                    ? ': ' 
                                    : ':'
                            ) + v);
                        }
                    }
                }
            } else {

// Otherwise, iterate through all of the keys in the object.

                for (k in value) {
                    if (Object.prototype.hasOwnProperty.call(value, k)) {
                        v = str(k, value);
                        if (v) {
                            partial.push(quote(k) + (
                                gap 
                                    ? ': ' 
                                    : ':'
                            ) + v);
                        }
                    }
                }
            }

// Join all of the member texts together, separated with commas,
// and wrap them in braces.

            v = partial.length === 0
                ? '{}'
                : gap
                    ? '{\n' + gap + partial.join(',\n' + gap) + '\n' + mind + '}'
                    : '{' + partial.join(',') + '}';
            gap = mind;
            return v;
        }
    }

// If the JSON object does not yet have a stringify method, give it one.

    if (typeof JSON.stringify !== 'function') {
        meta = {    // table of character substitutions
            '\b': '\\b',
            '\t': '\\t',
            '\n': '\\n',
            '\f': '\\f',
            '\r': '\\r',
            '"': '\\"',
            '\\': '\\\\'
        };
        JSON.stringify = function (value, replacer, space) {

// The stringify method takes a value and an optional replacer, and an optional
// space parameter, and returns a JSON text. The replacer can be a function
// that can replace values, or an array of strings that will select the keys.
// A default replacer method can be provided. Use of the space parameter can
// produce text that is more easily readable.

            var i;
            gap = '';
            indent = '';

// If the space parameter is a number, make an indent string containing that
// many spaces.

            if (typeof space === 'number') {
                for (i = 0; i < space; i += 1) {
                    indent += ' ';
                }

// If the space parameter is a string, it will be used as the indent string.

            } else if (typeof space === 'string') {
                indent = space;
            }

// If there is a replacer, it must be a function or an array.
// Otherwise, throw an error.

            rep = replacer;
            if (replacer && typeof replacer !== 'function' &&
                    (typeof replacer !== 'object' ||
                    typeof replacer.length !== 'number')) {
                throw new Error('JSON.stringify');
            }

// Make a fake root object containing our value under the key of ''.
// Return the result of stringifying the value.

            return str('', {'': value});
        };
    }


// If the JSON object does not yet have a parse method, give it one.

    if (typeof JSON.parse !== 'function') {
        JSON.parse = function (text, reviver) {

// The parse method takes a text and an optional reviver function, and returns
// a JavaScript value if the text is a valid JSON text.

            var j;

            function walk(holder, key) {

// The walk method is used to recursively walk the resulting structure so
// that modifications can be made.

                var k, v, value = holder[key];
                if (value && typeof value === 'object') {
                    for (k in value) {
                        if (Object.prototype.hasOwnProperty.call(value, k)) {
                            v = walk(value, k);
                            if (v !== undefined) {
                                value[k] = v;
                            } else {
                                delete value[k];
                            }
                        }
                    }
                }
                return reviver.call(holder, key, value);
            }


// Parsing happens in four stages. In the first stage, we replace certain
// Unicode characters with escape sequences. JavaScript handles many characters
// incorrectly, either silently deleting them, or treating them as line endings.

            text = String(text);
            rx_dangerous.lastIndex = 0;
            if (rx_dangerous.test(text)) {
                text = text.replace(rx_dangerous, function (a) {
                    return '\\u' +
                            ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
                });
            }

            if (
                rx_one.test(
                    text
                        .replace(rx_two, '@')
                        .replace(rx_three, ']')
                        .replace(rx_four, '')
                )
            ) {

// In the third stage we use the eval function to compile the text into a
// JavaScript structure. The '{' operator is subject to a syntactic ambiguity
// in JavaScript: it can begin a block or an object literal. We wrap the text
// in parens to eliminate the ambiguity.

                j = eval('(' + text + ')');

// In the optional fourth stage, we recursively walk the new structure, passing
// each name/value pair to a reviver function for possible transformation.

                return typeof reviver === 'function'
                    ? walk({'': j}, '')
                    : j;
            }

// If the text is not JSON parseable, then a SyntaxError is thrown.

            throw new SyntaxError('JSON.parse');
        };
    }
}());







var hnLocalStore = (function(j){	
	if(!j){
		return ;	  	
	}	
  var Store = {};
  var clientId; 
  var cdstorage = null ;
  var analysisDomain="http://ac.{domain}";
	var originDomain=analysisDomain.replace("{domain}", getDomain());
	var CHARS = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
	var uid_split_char = '_localstore_';
	 
	function getDomain(){
	 	var domain = window.document.domain; //http://www.cnhnb.com
	 	var domainchars = domain.split(".");
	 	domain = "";
	    for(var i = 1 ; i < domainchars.length ; i ++){
	    	domain += (i == 1 ? "" : ".") + domainchars[i] ;
	    }
	  return domain ;
	 }
 	
 	function addCookie(key, value, expireDays){
 		var date=new Date();
		//30 day
		date.setTime(date.getTime()+expireDays*24*3600*1000); 
		document.cookie=key+"="+value+";expires="+date.toGMTString()+";path=/;domain="+getDomain();
 	}
 	function getCookie(key){
 		var strCookie=document.cookie;
		var arrCookie=strCookie.split(";");
		var result;
		for(var i=0;i<arrCookie.length;i++){
			var arr=arrCookie[i].split("=");
			if("_analysis_client_id"==$.trim(arr[0])){
				result=arr[1];
				break;
			}
		}
		
		return result;
 	}
 	
 	function deleteCookie(key){
 		if (getCookie(name)){
 			document.cookie = name + '=;path=/;domain=' + getDomain()+';expires=Thu, 01-Jan-1970 00:00:01 GMT';
 		}
 	}
	 function register(){	
		 //cdstorage.cross_domain_storage.apply(window,[{origin: originDomain, path: "/hn-analysis-web/crossd_iframe.html"}]);		 
		 cdstorage = cross_domain_storage({origin: originDomain, path: "/hn-analysis-web/crossd_iframe.html"});
		 
		 
		 //PUBLIC method set
		 Store.set = function(obj,uid){
			 if(!uid){		 
				getStoreClientId(function(uuid){
					loopset(uuid,obj);
				});		 	
			 }else{
			 	loopset(uid,obj);
			 } 		
			
			 function loopset(uid,obj){				
			 	for(var i in obj){					
			 		var k = internalKey(uid,i);
			 		if(obj[i]){
			 			var v = obj[i].toString();
			 		 	cdstorage.setItem(k,v);
			 		}
			 	}
			 	
			 }							
	     };
	   
		 Store.setObject = function(key, obj, uid){
		 		if(!uid){
		 				getStoreClientId(function(uid){
								var k = internalKey(uid,key);
								cdstorage.setItem(k,JSON.stringify(obj));
						});
		 		}else{
		 				var k = internalKey(uid,key);
							cdstorage.setItem(k,JSON.stringify(obj));
		 		}
		 };
	  
	  Store.getObject = function(key,callback,uid){
			if(uid){
				var k = internalKey(uid,key);
				cdstorage.getItem(k,function(key,val){					
					  if(typeof callback == 'function'){
					    	var obj = JSON.parse(val);
					    	callback.apply(window,[obj]);
					  }					
				});
 			}else{
 					getStoreClientId(function(uuid){ 					
	 					var k = internalKey(uuid,key);
						cdstorage.getItem(k,function(key,val){
							if(typeof callback == 'function'){
								//some browser doesn't support JSON.parse
								var obj=eval('(' + val + ')');							
							  	callback.apply(window,[obj]);
							}					
					 	}); 					
	 				});
	 				
			}
	  };
	  
	   
	  //PUBLIC method get
		Store.get = function(key,callback,uid){
			if(uid){
				var k = internalKey(uid,key);
				cdstorage.getItem(k,function(key,val){					
					  if(typeof callback == 'function'){
					    	callback.apply(window,[val]);
					  }					
				});
 			}else{
 					getStoreClientId(function(uuid){ 					
 					var k = internalKey(uuid,key);
					cdstorage.getItem(k,function(key,val){					
					  if(typeof callback == 'function'){
					    	callback.apply(window,[val]);
					  }					
				 }); 					
 				});				
			}
		};
		Store.getInstance=function(callback){
			if(typeof callback=='function'){
					cdstorage.getItem("localstore_clientId",function(key,val){
							
							if(typeof callback=='function'){
									if(!val){
										getStoreClientId(callback);
									}
									callback.apply(window,[val]);
							}
							
					});
			}
		};
		
		//PUBLIC method remove
		Store.remove= function(key,uid){
			  if(uid){
			  	var k = internalKey(uid,key);
			  	cdstorage.removeItem(k);
			  }else{
			  	getStoreClientId(function(uuid){ 					
 					var k = internalKey(uuid,key);
					cdstorage.removeItem(k);				
 				  });				  	
			  }					   
		};   
		Store.updateClientId=function(val){
			cdstorage.setItem("localstore_clientId",val);
		};
		
		function internalKey(uid,key){
					return uid + uid_split_char + key;
		}
		
		//初始化ClientId
		getStoreClientId();
	}
	
	
  
  function getStoreClientId(callback){
  			cdstorage.getItem("localstore_clientId",function(key,uuid){
							if(!uuid || uuid == ''){
								uuid = randomUUID();
								cdstorage.setItem("localstore_clientId",uuid);
							}			
							if(typeof callback === 'function'){
								callback.apply(window,[uuid]);	
							}
				});
  }	
	
 
   
	
  function randomUUID(){	
    	var chars = CHARS, uuid = new Array(36), rnd=0, r;
 	    for (var i = 0; i < 36; i++) {
 	      if (i==8 || i==13 ||  i==18 || i==23) {
 	        uuid[i] = '-';
 	      } else if (i==14) {
 	        uuid[i] = '4';
 	      } else {
 	        if (rnd <= 0x02) rnd = 0x2000000 + (Math.random()*0x1000000)|0;
 	        r = rnd & 0xf;
 	        rnd = rnd >> 4;
 	        uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
 	      }
 	    }
 	    return uuid.join('');
  	};
  	
  	function cross_domain_storage(opts){

	    var origin = opts.origin || '',
	        path = opts.path || '',
	        cdstorage = {},
	        _iframe = null,
	        _iframeReady = false,
	        _origin = origin,
	        _path = path,
	        _queue = [],
	        _requests = {},
	        _id = 0;
	
	    var supported = (function(){
	        try{
	            return window.postMessage && window.JSON && 'localStorage' in window && window['localStorage'] !== null;
	        }catch(e){
	            return false;
	        }
	    })();
	
	    //private methods
	
	    var _sendRequest = function(data){
	        if (_iframe) {
	            _requests[data.request.id] = data;
	            _iframe.contentWindow.postMessage(JSON.stringify(data.request), _origin);
	        }
	    };
	
	    var _iframeLoaded = function(){
	        _iframeReady = true;
	        if (_queue.length) {
	            for (var i=0, len=_queue.length; i < len; i++){
	                _sendRequest(_queue[i]);
	            }
	            _queue = [];
	        }
	    };
	
	    var _handleMessage = function(event){
	        if (event.origin === _origin) {
	            var data = JSON.parse(event.data);
	            if (typeof _requests[data.id] != 'undefined') {
	                if (typeof _requests[data.id].deferred !== 'undefined') {
	                    _requests[data.id].deferred.resolve(data.value);
	                }
	                if (typeof _requests[data.id].callback === 'function') {
	                    _requests[data.id].callback(data.key, data.value);
	                }
	                delete _requests[data.id];
	            }
	        }
	    }
	
	    //Public methods
	
	    cdstorage.getItem = function(key, callback){
	        if (supported) {
	            var request = {
	                    id: ++_id,
	                    type: 'get',
	                    key: key
	                },
	                data = {
	                    request: request,
	                    callback: callback
	                };
	            if (window.jQuery) {
	                data.deferred = jQuery.Deferred();
	            }
	
	            if (_iframeReady) {
	                _sendRequest(data);
	            } else {
	                _queue.push(data);
	            }
	
	            if (window.jQuery) {
	                return data.deferred.promise();
	            }
	        }else{
	        	var result=getCookie(key);
	        	if(typeof callback == 'function'){
							callback.apply(window,[result]);
						}
	        }
	    };
	
	    cdstorage.setItem = function(key, value){
	        if (supported) {
	            var request = {
	                    id: ++_id,
	                    type: 'set',
	                    key: key,
	                    value: value
	                },
	                data = {
	                    request: request
	                };
	            if (window.jQuery) {
	                data.deferred = jQuery.Deferred();
	            }
	
	            if (_iframeReady) {
	                _sendRequest(data);
	            } else {
	                _queue.push(data);
	            }
	
	            if (window.jQuery) {
	                return data.deferred.promise();
	            }
	        }else{
	        	addCookie(key,value);
	        }
	    };
	    
	    
	     cdstorage.removeItem = function(key){
	        if (supported) {
	            var request = {
	                    id: ++_id,
	                    type: 'unset',
	                    key: key
	                },
	                data = {
	                    request: request
	                };
	            if (window.jQuery) {
	                data.deferred = jQuery.Deferred();
	            }
	
	            if (_iframeReady) {
	                _sendRequest(data);
	            } else {
	                _queue.push(data);
	            }
	
	            if (window.jQuery) {
	                return data.deferred.promise();
	            }
	        }else{
	        	deleteCookie(key);
	        }
	    };
	    
	
	    //Init
	    if (!_iframe && supported) {
	        _iframe = document.createElement("iframe");
	        _iframe.style.cssText = "position:absolute;width:1px;height:1px;left:-9999px;";
	        document.body.appendChild(_iframe);
	
	        if (window.addEventListener) {
	            _iframe.addEventListener("load", function(){ _iframeLoaded(); }, false);
	            window.addEventListener("message", function(event){ _handleMessage(event) }, false);
	        } else if (_iframe.attachEvent) {
	            _iframe.attachEvent("onload", function(){ _iframeLoaded(); }, false);
	            window.attachEvent("onmessage", function(event){ _handleMessage(event) });
	        }
	        _iframe.src = _origin + _path;
	    }
	    return cdstorage;
  	}	
    register();
    
	return Store;	
})(window.$);




